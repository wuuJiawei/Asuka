package com.asuka.plugin.file.service;

import com.asuka.module.system.service.OptionService;
import com.asuka.plugin.file.FileTargetTypeEnum;
import com.asuka.plugin.file.FileUploadResult;
import com.asuka.plugin.file.handler.FileHandlerDispatcher;
import org.apache.tika.Tika;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 文件上传服务类
 * @author wujiawei0926
 * @see
 * @since 2020-07-12
 */
@Service
public class FileService {

    private final FileHandlerDispatcher fileHandlerDispatcher;
    private final OptionService optionService;

    public FileService(FileHandlerDispatcher fileHandlerDispatcher, OptionService optionService) {
        this.fileHandlerDispatcher = fileHandlerDispatcher;
        this.optionService = optionService;
    }

    /**
     * 文件上传
     * @param file 上传的文件
     * @return
     */
    public FileUploadResult upload(MultipartFile file) throws IOException {
        Assert.notNull(file, "Multipart file must be given");
        FileTargetTypeEnum targetTypeEnum = FileTargetTypeEnum.get(optionService.getByKeyAsString("oss_type"));
        return upload(file, targetTypeEnum);
    }

    /**
     * 文件上传
     * @param file
     * @return
     * @throws IOException
     */
    public FileUploadResult upload(File file) throws IOException {
        return upload(file, null);
    }

    public FileUploadResult upload(File file, FileTargetTypeEnum targetTypeEnum) throws IOException {
        MockMultipartFile multipartFile = new MockMultipartFile(file.getName(), file.getName(), new Tika().detect(file), new FileInputStream(file));
        if (targetTypeEnum == null) {
            return upload(multipartFile);
        }
        return upload(multipartFile, targetTypeEnum);
    }

    public FileUploadResult upload(MultipartFile file, FileTargetTypeEnum targetTypeEnum) throws IOException {
        Assert.notNull(file, "Multipart file must be given");
        return fileHandlerDispatcher.upload(file, targetTypeEnum);
    }

    /**
     * 渲染（输出）文件
     * @param key
     * @param response
     */
    public void render(String key, HttpServletResponse response) {
        try {
            // 拆分key，获取上传方式
            FileTargetTypeEnum targetTypeEnum = FileTargetTypeEnum.LOCAL;
            List<Integer> dotIndexList = new ArrayList<>();
            char[] keyChars = key.toCharArray();
            for (int i = 0; i < keyChars.length; i++) {
                if (keyChars[i] == '.') {
                    dotIndexList.add(i);
                }
            }
            if (dotIndexList.size() >= 2) {
                String targetType = key.substring(dotIndexList.get(dotIndexList.size() - 2) + 1, dotIndexList.get(dotIndexList.size() - 1));
                targetTypeEnum = FileTargetTypeEnum.get(targetType);
            }

            // 渲染到输出流
            fileHandlerDispatcher.render(key, response, targetTypeEnum);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 翻译文件名为可访问地址
     * @param key
     * @return
     */
    public String translateUrl(String key){
        return fileHandlerDispatcher.translateUrl(key);
    }
}
