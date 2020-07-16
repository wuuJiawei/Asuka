package com.asuka.plugin.file.handler;

import com.asuka.common.utils.ServletUtils;
import com.asuka.module.system.service.OptionService;
import com.asuka.plugin.file.FileTargetTypeEnum;
import com.asuka.plugin.file.FileUploadResult;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * 文件处理适配器
 */
@Component
public class FileHandlerDispatcher {

    private final Collection<IFileHandler> fileHandlers = new LinkedList<>();
    private final HttpServletRequest request;
    private final OptionService optionService;

    public FileHandlerDispatcher(ApplicationContext applicationContext, HttpServletRequest request, OptionService optionService) {
        this.request = request;
        this.optionService = optionService;
        if (CollectionUtils.isEmpty(fileHandlers)) {
            fileHandlers.addAll(applicationContext.getBeansOfType(IFileHandler.class).values());
        }
    }

    /**
     * 文件上传
     *
     * @param file
     * @param targetTypeEnum
     * @return
     */
    public FileUploadResult upload(MultipartFile file, FileTargetTypeEnum targetTypeEnum) throws IOException {
        for (IFileHandler handler : fileHandlers) {
            if (handler.support(targetTypeEnum)) {
                return handler.upload(file);
            }
        }
        throw new NoSuchElementException("No such file target type as " + targetTypeEnum.toString() + ", check your parameter");
    }

    /**
     * 输出（下载）文件
     *
     * @param key
     * @param response
     * @param targetTypeEnum
     */
    public void render(String key, HttpServletResponse response, FileTargetTypeEnum targetTypeEnum) throws IOException {
        for (IFileHandler handler : fileHandlers) {
            if (handler.support(targetTypeEnum)) {
                handler.render(key, response);
                return;
            }
        }
        throw new NoSuchElementException("No such " + targetTypeEnum.toString() + ", check your parameter");
    }

    /**
     * 翻译文件名为可访问地址
     * 后期集成完善的文件系统后，将移除Switch判断
     *
     * @param key
     * @return
     */
    public String translateUrl(String key) {
        if (StringUtils.isEmpty(key)) {
            return "";
        }
        if (key.startsWith("http")) {
            return key;
        }

        // 获取文件名中的targetType
        List<Integer> indexList = new ArrayList<>();
        char[] fileNameChars = key.toCharArray();
        for (int i = 0; i < fileNameChars.length; i++) {
            char nameChar = fileNameChars[i];
            if (nameChar == '.') {
                indexList.add(i);
            }
        }
        String target = key.substring(indexList.get(indexList.size() - 2) + 1, indexList.get(indexList.size() - 1));
        FileTargetTypeEnum targetTypeEnum = FileTargetTypeEnum.get(target);

        // 判断上传类型
        switch (Objects.requireNonNull(targetTypeEnum)) {
            case LOCAL:
                String cdnHost = optionService.getByKeyAsString("oss_local_cdn_host");
                return StringUtils.isEmpty(cdnHost) ? ServletUtils.getBasePath(request) : (cdnHost + "/") + "sys/upload/render/" + key;
            case QINIUOSS:
                return optionService.getByKeyAsString("oss_qiniu_domain_protocol") + "/" + optionService.getByKeyAsString("oss_qiniu_domain") + "/" + key;
            default:
                return "";
        }
    }

}
