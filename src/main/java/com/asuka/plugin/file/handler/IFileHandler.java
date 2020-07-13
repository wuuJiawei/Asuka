package com.asuka.plugin.file.handler;

import com.asuka.plugin.file.FileTargetTypeEnum;
import com.asuka.plugin.file.FileUploadResult;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

/**
 * 文件处理抽象基类
 *
 * @author wujiawei
 * @see
 * @since 2020/7/12 7:40 下午
 */
public interface IFileHandler {

    /**
     * 是否支持的上传方式
     * @param targetTypeEnum 上传位置类型枚举
     * @return
     */
    boolean support(FileTargetTypeEnum targetTypeEnum);

    /**
     * 上传
     *
     * @param file
     * @return
     */
    FileUploadResult upload(MultipartFile file) throws IOException;

    /**
     * 渲染文件到输出流
     * @param key 文件KEY
     * @param response
     */
    void render(String key, HttpServletResponse response) throws IOException;

    /**
     * 删除
     *
     * @param key
     */
    void delete(String key);

    /**
     * 文件上传时是否加密
     *
     * @return
     */
    boolean isEncrypt();

    /**
     * 统一的文件加密方法
     * 采用AES加密
     * @param multipartFile
     * @param targetFile
     */
    static void encryptFile(MultipartFile multipartFile, File targetFile){
        //TODO 文件加密

    }

}
