package com.asuka.plugin.upload.handler;

import cn.hutool.core.io.FileUtil;
import cn.hutool.crypto.SecureUtil;
import com.asuka.plugin.upload.FileTargetTypeEnum;
import com.asuka.plugin.upload.FileUploadResult;
import org.springframework.web.multipart.MultipartFile;

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
     * @param outputStream
     */
    void render(String key, OutputStream outputStream);

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
