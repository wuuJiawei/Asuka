package com.asuka.plugin.upload.handler;

import com.asuka.plugin.upload.FileTargetTypeEnum;
import com.asuka.plugin.upload.FileUploadResult;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Collection;
import java.util.LinkedList;
import java.util.NoSuchElementException;

/**
 * 文件处理适配器
 */
@Component
public class FileHandlerDispatcher {

    private final Collection<IFileHandler> fileHandlers = new LinkedList<>();

    public FileHandlerDispatcher(ApplicationContext applicationContext){
        if (!CollectionUtils.isEmpty(fileHandlers)) {
            fileHandlers.addAll(applicationContext.getBeansOfType(IFileHandler.class).values());
        }
    }

    /**
     * 文件上传
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
        throw new NoSuchElementException("No such " + targetTypeEnum.toString() + ", check your parameter");
    }

    /**
     * 输出文件
     * @param key
     * @param outputStream
     * @param targetTypeEnum
     */
    public void render(String key, OutputStream outputStream, FileTargetTypeEnum targetTypeEnum) {
        for (IFileHandler handler : fileHandlers) {
            if (handler.support(targetTypeEnum)) {
                handler.render(key, outputStream);
                return;
            }
        }
        throw new NoSuchElementException("No such " + targetTypeEnum.toString() + ", check your parameter");
    }

}
