package com.asuka.plugin.generator;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.asuka.plugin.generator.dto.Entity;
import com.asuka.plugin.generator.dto.OutputFileConfig;
import com.asuka.plugin.generator.dto.SuperConfig;
import org.beetl.core.Configuration;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.core.resource.FileResourceLoader;
import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.SQLReady;
import org.beetl.sql.core.SQLScript;
import org.beetl.sql.core.SQLSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/7
 */
public class SuperGenHandler {

    private static Logger log = LoggerFactory.getLogger(SuperGenHandler.class);

    private SQLManager sqlManager;
    private GroupTemplate groupTemplate;
    private Map<String, Object> attributeMap = new HashMap<>();
    private OutputStream outputStream;
    private Entity tableEntity;
    private SuperConfig superConfig;
    private OutputFileConfig outputFileConfig = new OutputFileConfig();
    private boolean justPreview = false;

    public SuperGenHandler(SQLManager sqlManager) {
        initGroupTemplate();
        setSqlManager(sqlManager);
    }

    public SuperGenHandler(GroupTemplate groupTemplate, SQLManager sqlManager) {
        this.groupTemplate = groupTemplate;
        setSqlManager(sqlManager);
    }

    /**
     * 初始化GroupTemplate
     */
    private void initGroupTemplate() {
        if (groupTemplate != null) {
            return;
        }
        // 加载模板文件
        String thisPath = Objects.requireNonNull(SuperGenHandler.class.getResource("")).getPath();
        String tplPath = thisPath + "tpl";
        FileResourceLoader resourceLoader = new FileResourceLoader(tplPath);
        try {
            Configuration configuration = Configuration.defaultConfiguration();
//            configuration.setStatementStart("@");
//            configuration.setStatementEnd(null);
//            configuration.setHtmlTagSupport(false);
            configuration.build();

            groupTemplate = new GroupTemplate(resourceLoader, configuration);
        } catch (IOException e) {
            log.error(e.getMessage());
        }
    }

    /**
     * 设置SqlManager
     *
     * @param sqlManager
     * @return
     */
    public SuperGenHandler setSqlManager(SQLManager sqlManager) {
        this.sqlManager = sqlManager;
        return this;
    }

    /**
     * 配置生成信息
     *
     * @param config
     * @return
     */
    public SuperGenHandler config(SuperConfig config) {
        superConfig = config;
        attributeMap.put("cfg", superConfig);
        if (StrUtil.isNotEmpty(config.getPackageName())) {
            initPackage(config.getPackageName());
        }
        return this;
    }

    /**
     * 自定义生成文件包名
     *
     * @param packageConfig
     * @return
     */
    private SuperGenHandler setPackage(OutputFileConfig.FileType packageConfig) {
        outputFileConfig.setPackages(packageConfig);
        attributeMap.put("package", packageConfig);
        return this;
    }

    /**
     * 初始化包名
     * 默认的包名是：com.asuka.${fileType}
     */
    private void initPackage(String parent) {
        OutputFileConfig.FileType packages = new OutputFileConfig.FileType();
        packages.setParent(StrUtil.isEmpty(parent) ? "com.asuka" : parent);
        outputFileConfig.setPackages(packages);
        attributeMap.put("package", packages);
    }

    /**
     * 初始化输出路径
     * 该路径为绝对路径
     */
    private void initOutputPath() {
        OutputFileConfig.FileType fileType = new OutputFileConfig.FileType();
        String usrDir = System.getProperty("user.dir");
        if (!StringUtils.isEmpty(superConfig.getAbsoluteFilePath())) {
            usrDir = superConfig.getAbsoluteFilePath();
        }
        String javaPath = usrDir + "/src/main/java/" + StrUtil.replace(superConfig.getPackageName(), ".", "/") + "/";
        String resourcePath = usrDir + "/src/main/resources/";

        fileType.setHtml(resourcePath + "templates/system");
        fileType.setController(javaPath + "controller");
        fileType.setService(javaPath + "service");
        fileType.setDao(javaPath + "dao");
        fileType.setEntity(javaPath + "entity");
        fileType.setDaoMd(resourcePath + "sql");
        fileType.setSql(resourcePath + "sql/_auth");
        outputFileConfig.setPath(fileType);
        attributeMap.put("outputName", fileType);
    }

    /**
     * 初始化输出文件名称
     */
    private void initOutputName() {
        OutputFileConfig.FileType name = new OutputFileConfig.FileType();
        name.setHtml(tableEntity.getFirstUpperClassName() + ".html");
        name.setController(tableEntity.getFirstUpperClassName() + "Controller.java");
        name.setService(tableEntity.getFirstUpperClassName() + "Service.java");
        name.setDao(tableEntity.getFirstUpperClassName() + "Dao.java");
        name.setEntity(tableEntity.getFirstUpperClassName() + ".java");
        name.setDaoMd(tableEntity.getFirstUpperClassName() + ".md");
        name.setSql(tableEntity.getFirstUpperClassName() + "-menu.sql");
        outputFileConfig.setName(name);
        attributeMap.put("outputName", name);
    }

    /**
     * 获取输出文件配置信息
     *
     * @return
     */
    public OutputFileConfig getOutputFileConfig() {
        return outputFileConfig;
    }

    /**
     * 选择需要生成的表
     * 并做一些初始化操作
     *
     * @param table
     * @return
     */
    public SuperGenHandler selectTable(String table) {
        tableEntity = GenDataUtils.getEntityInfo(sqlManager, table);
        attributeMap.put("table", tableEntity);
        attributeMap.put("thisDateTime", DateUtil.now());
        initPackage(null);
        initOutputName();
        initOutputPath();
        return this;
    }

    /**
     * 设置额外的属性
     *
     * @param key
     * @param value
     * @return
     */
    public SuperGenHandler setAttribute(String key, String value) {
        this.attributeMap.put(key, value);
        return this;
    }

    /**
     * 设置为预览模板
     * 如果开启预览，则
     *
     * @return
     */
    public SuperGenHandler justForPreview() {
        this.justPreview = true;
        return this;
    }

    /**
     * 生成实体类
     *
     * @return
     */
    public String makeEntity() {
        Template template = groupTemplate.getTemplate("/entity.java.btl");
        template.binding(attributeMap);
        if (justPreview) {
            String content = template.render();
            return content;
        }

        try {
            File targetFile = new File(outputFileConfig.getPath().getEntity()  + "/" + outputFileConfig.getName().getEntity());
            if (!targetFile.exists()) {
                targetFile.getParentFile().mkdirs();
                targetFile.createNewFile();
            }
            template.renderTo(new FileOutputStream(targetFile));
            logMakeInfo("entity");
        } catch (IOException e) {
            log.error("== Code Generator == make entity == Error ==",e);
        }

        return "";
    }

    public String makeDaoMd() {
        Template template = groupTemplate.getTemplate("/dao.md.btl");
        template.binding(attributeMap);
        if (justPreview) {
            String content = template.render();
            return content;
        }


        try {
            File targetFile = new File(outputFileConfig.getPath().getDaoMd()  + "/" + outputFileConfig.getName().getDaoMd());
            if (!targetFile.exists()) {
                targetFile.getParentFile().mkdirs();
                targetFile.createNewFile();
            }
            template.renderTo(new FileOutputStream(targetFile));
            logMakeInfo("dao.md");
        } catch (IOException e) {
            log.error("== Code Generator == make dao.md == Error ==",e);
        }

        return "";
    }

    public String makeDao() {
        Template template = groupTemplate.getTemplate("/dao.java.btl");
        template.binding(attributeMap);
        if (justPreview) {
            String content = template.render();
            return content;
        }

        try {
            File targetFile = new File(outputFileConfig.getPath().getDao()  + "/" + outputFileConfig.getName().getDao());
            if (!targetFile.exists()) {
                targetFile.getParentFile().mkdirs();
                targetFile.createNewFile();
            }
            template.renderTo(new FileOutputStream(targetFile));
            logMakeInfo("dao");
        } catch (IOException e) {
            log.error("== Code Generator == make dao == Error ==",e);
        }

        return "";
    }

    public String makeService() {
        Template template = groupTemplate.getTemplate("/service.java.btl");
        template.binding(attributeMap);
        if (justPreview) {
            String content = template.render();
            return content;
        }

        try {
            File targetFile = new File(outputFileConfig.getPath().getService()  + "/" + outputFileConfig.getName().getService());
            if (!targetFile.exists()) {
                targetFile.getParentFile().mkdirs();
                targetFile.createNewFile();
            }
            template.renderTo(new FileOutputStream(targetFile));
            logMakeInfo("service");
        } catch (IOException e) {
            log.error("== Code Generator == make service == Error ==",e);
        }

        return "";
    }

    public String makeController() {
        Template template = groupTemplate.getTemplate("/controller.java.btl");
        template.binding(attributeMap);
        if (justPreview) {
            String content = template.render();
            return content;
        }

        try {
            File targetFile = new File(outputFileConfig.getPath().getController()  + "/" + outputFileConfig.getName().getController());
            if (!targetFile.exists()) {
                targetFile.getParentFile().mkdirs();
                targetFile.createNewFile();
            }
            template.renderTo(new FileOutputStream(targetFile));
            logMakeInfo("controller");
        } catch (IOException e) {
            log.error("== Code Generator == make controller == Error ==",e);
        }

        return "";
    }

    public String makeHtml() {
        Template template = groupTemplate.getTemplate("/page.html.btl");
        template.binding(attributeMap);
        if (justPreview) {
            String content = template.render();
            return content;
        }

        try {
            File targetFile = new File(outputFileConfig.getPath().getHtml()  + "/" + outputFileConfig.getName().getHtml());
            if (!targetFile.exists()) {
                targetFile.getParentFile().mkdirs();
                targetFile.createNewFile();
            }
            template.renderTo(new FileOutputStream(targetFile));
            logMakeInfo("html");
        } catch (IOException e) {
            log.error("== Code Generator == make html == Error ==",e);
        }

        return "";
    }

    /**
     * 生成SQL，如果superConfig.autoLoadSql=true，将会自动执行SQL
     *
     * @return
     */
    public String makeSQL() {
        Template template = groupTemplate.getTemplate("/permission.sql.btl");
        template.binding(attributeMap);

        String content = "";
        if (justPreview) {
            content = template.render();
            return content;
        }
        if (superConfig.getAutoLoadSql()) {
            SQLReady sqlReady = new SQLReady(content);
            SQLSource source = new SQLSource();
            SQLScript script = new SQLScript(source, sqlManager);
            script.sqlReadyExecuteUpdate(sqlReady);
        } else {

            try {
                File targetFile = new File(outputFileConfig.getPath().getSql()  + "/" + outputFileConfig.getName().getSql());
                if (!targetFile.exists()) {
                    targetFile.getParentFile().mkdirs();
                    targetFile.createNewFile();
                }
                template.renderTo(new FileOutputStream(targetFile));
                logMakeInfo("sql");
            } catch (IOException e) {
                log.error("== Code Generator == make sql == Error ==",e);
            }

        }
        return content;
    }

    private void logMakeInfo(String typeName) {
        log.info("== Code Generator == make " + typeName + " ==");
    }
}
