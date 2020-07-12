package com.asuka.plugin.upload.service;

import com.asuka.plugin.upload.FileTargetTypeEnum;
import com.asuka.plugin.upload.FileUploadResult;
import com.asuka.plugin.upload.handler.FileHandlerDispatcher;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

/**
 * 文件上传服务类
 * @author wujiawei0926
 * @see
 * @since 2020-07-12
 */
@Service
public class FileService {

    private final FileHandlerDispatcher fileHandlerDispatcher;

    public FileService(FileHandlerDispatcher fileHandlerDispatcher) {
        this.fileHandlerDispatcher = fileHandlerDispatcher;
    }

    /**
     * 文件上传
     * @param file 上传的文件
     * @return
     */
    public FileUploadResult upload(MultipartFile file) throws IOException {
        Assert.notNull(file, "Multipart file must be given");
        return fileHandlerDispatcher.upload(file, FileTargetTypeEnum.LOCAL);
    }

    public void render(String key, HttpServletResponse response) {
        try {
            fileHandlerDispatcher.render(key, response.getOutputStream(), FileTargetTypeEnum.LOCAL);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
