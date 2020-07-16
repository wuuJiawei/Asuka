package com.asuka.common.aspect;

import cn.hutool.core.util.ReflectUtil;
import com.asuka.common.Constants;
import com.asuka.common.annotation.Dict;
import com.asuka.common.annotation.File;
import com.asuka.common.web.JsonResult;
import com.asuka.common.web.PageResult;
import com.asuka.module.system.entity.DictionaryData;
import com.asuka.module.system.service.DictionaryDataService;
import com.asuka.plugin.file.handler.FileHandlerDispatcher;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.json.JsonReadFeature;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * 全局通用的Aspect
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/1
 */
@Component
@Aspect
public class GlobalControllerAspect {

    private static final Logger log = LoggerFactory.getLogger(GlobalControllerAspect.class);
    private final static ObjectMapper objectMapper = new ObjectMapper();
    private final DictionaryDataService dictionaryDataService;
    private final FileHandlerDispatcher fileHandlerDispatcher;

    public GlobalControllerAspect(DictionaryDataService dictionaryDataService, FileHandlerDispatcher fileHandlerDispatcher) {
        this.dictionaryDataService = dictionaryDataService;
        this.fileHandlerDispatcher = fileHandlerDispatcher;
    }

    static {
        //序列化处理
        objectMapper.configure(JsonParser.Feature.ALLOW_COMMENTS, true);
        objectMapper.configure(JsonParser.Feature.ALLOW_YAML_COMMENTS, true);
        objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
        objectMapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);
        objectMapper.configure(JsonReadFeature.ALLOW_UNESCAPED_CONTROL_CHARS.mappedFeature(), true);
        objectMapper.configure(JsonReadFeature.ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER.mappedFeature(), true);

        //反序列化时，属性不存在的兼容处理
        objectMapper.getDeserializationConfig().withoutFeatures(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
    }

    /**
     * 定义切点：所有以Controller为末尾的所有方法
     */
    @Pointcut("execution(public * com.asuka..*.*Controller.*(..))")
    public void aroundPointCut() {
    }

    @Around("aroundPointCut()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        long time1 = System.currentTimeMillis();

        Object result = pjp.proceed();

        long time2 = System.currentTimeMillis();
        log.debug("获取JSON数据 耗时：" + (time2 - time1) + "ms");

        long start = System.currentTimeMillis();

        this.parseResult(result);

        long end = System.currentTimeMillis();
        log.debug("解析注入JSON数据  耗时" + (end - start) + "ms");

        return result;
    }

    /**
     * 解析返回结果
     *
     * @param result
     */
    private void parseResult(Object result) {
        if (result instanceof JsonResult) {
            Object dataObj = ((JsonResult) result).getData();
            if (dataObj == null) {
                return;
            }
            if (excludeDataType(result)) {
                return;
            }
            Object item = toJsonNode(dataObj);
            ((JsonResult) result).setData(item);
        } else if (result instanceof PageResult) {
            List<Object> items = new ArrayList<>();
            for (Object record : ((PageResult) result).getData()) {
                if (excludeDataType(result)) {
                    continue;
                }
                Object item = toJsonNode(record);
                items.add(item);
            }
            ((PageResult) result).setData(items);
        }
    }

    /**
     * 排除掉的数据类型
     *
     * @param o
     * @return
     */
    private boolean excludeDataType(Object o) {
        return (o instanceof String
                || o instanceof Byte
                || o instanceof Short
                || o instanceof Integer
                || o instanceof Long
                || o instanceof Float
                || o instanceof Double
                || o instanceof Boolean
        );
    }

    /**
     * 转换为JSON并解析数据
     *
     * @param record
     * @return
     */
    private Object toJsonNode(Object record) {
        JsonNode jsonNode = objectMapper.convertValue(record, JsonNode.class);
        if (jsonNode.isArray()) {
            List<?> recordList = (List<?>) record;
            ArrayNode arrayNode = jsonNode.deepCopy();
            for (int i = 0; i < arrayNode.size(); i++) {
                JsonNode singleNode = arrayNode.get(i);
                singleNode = translateSingle(singleNode, record);
                arrayNode.set(i, singleNode);
            }
        } else {
            jsonNode = translateSingle(jsonNode, record);
        }
        return jsonNode;
    }

    /**
     * 翻译单个节点
     *
     * @param jsonNode
     * @param record
     * @return
     */
    private JsonNode translateSingle(JsonNode jsonNode, Object record) {
        if (!jsonNode.isObject()) {
            return jsonNode;
        }

        ObjectNode objectNode = jsonNode.deepCopy();

        Field[] fields = ReflectUtil.getFields(record.getClass());
        for (Field field : fields) {
            // 深度翻译
            if (field.getGenericType().getTypeName().startsWith("java.util.List")) {
                Object listObj = ReflectUtil.getFieldValue(record, field);
                if (listObj == null) {
                    continue;
                }

                List<?> list = (List<?>) listObj;
                ArrayNode arrayNode = objectMapper.createArrayNode();
                for (Object o : list) {
                    JsonNode childNode = objectMapper.valueToTree(o);
                    arrayNode.add(translateSingle(childNode, o));
                }
                objectNode.set(field.getName(), arrayNode);
            }

            // 字典
            if (field.getAnnotation(Dict.class) != null) {
                String dictCode = field.getAnnotation(Dict.class).value();
                String dictDataCode = objectNode.get(field.getName()).asText();

                //翻译字典值对应的txt
                String textValue = translateDictValue(dictCode, dictDataCode);

                log.debug(" __翻译字典字段__ " + field.getName() + Constants.DICT_VALUE_SUFFIX + "： " + textValue);
                objectNode.put(field.getName() + Constants.DICT_VALUE_SUFFIX, textValue);
            }

            // 文件链接
            if (field.getAnnotation(File.class) != null) {
                String fileValue = objectNode.get(field.getName()).asText();
                String textValue = translateFileValue(fileValue);
                log.debug(" __翻译文件字段__ " + field.getName() + Constants.FILE_VALUE_SUFFIX + "： " + textValue);
                objectNode.put(field.getName() + Constants.FILE_VALUE_SUFFIX, textValue);
            }

        }

        return objectNode;
    }

    /**
     * 翻译字典数据
     *
     * @param dictCode     字典标识
     * @param dictDataCode 字典项标识
     * @return
     */
    private String translateDictValue(String dictCode, String dictDataCode) {
        if (StringUtils.isEmpty(dictCode)) {
            return "";
        }
        StringBuilder builder = new StringBuilder();
        DictionaryData dictionaryData = dictionaryDataService.listByDictCodeAndDataCode(dictCode, dictDataCode);
        return StringUtils.isEmpty(dictionaryData.getDictDataName()) ? "" : dictionaryData.getDictDataName();
    }

    /**
     * 翻译文件数据
     *
     * @param value
     * @return
     */
    private String translateFileValue(String value) {
        return fileHandlerDispatcher.translateUrl(value);
    }
}
