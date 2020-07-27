package com.asuka.plugin.file.handler;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.asuka.module.system.service.OptionService;
import com.asuka.plugin.file.FileTargetTypeEnum;
import com.asuka.plugin.file.FileUploadResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

/**
 * 阿里云OSS文件处理器
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/22
 */
@Component("AliOssFileHandlerOfAsuka")
public class AliOssFileHandler implements IFileHandler {

    private final static Logger log = LoggerFactory.getLogger(AliOssFileHandler.class);
    private final OptionService optionService;

    public AliOssFileHandler(OptionService optionService) {
        this.optionService = optionService;
    }

    /**
     * Uploads file.
     *
     * @param file multipart file must not be null
     * @return upload result
     */
    @Override
    public FileUploadResult upload(MultipartFile file) throws IOException {
        Assert.notNull(file, "Multipart file must not be null");

        String fileName = file.getOriginalFilename();
        Assert.notNull(fileName, "Multipart file name must be given");
        String suffix = FileUtil.extName(fileName);

        // 文件名称，中文需要URL编码
        try {
            fileName = URLEncoder.encode(FileUtil.mainName(fileName), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            log.error(e.getMessage(), e.getCause());
            fileName = DateUtil.format(new Date(), "yyyyMMddHHmmss") + cn.hutool.core.lang.UUID.fastUUID().toString();
        }
        String fileFinalName = fileName + "." + FileTargetTypeEnum.ALIOSS.toString() + "." + suffix;

        String accessKey = optionService.getByKeyAsString("oss_ali_access_key");
        String accessKeySecret = optionService.getByKeyAsString("oss_ali_access_secret");
        String bucketName = optionService.getByKeyAsString("oss_ali_bucket_name");
        String fileHost = optionService.getByKeyAsString("oss_ali_domain");
        String endpoint = optionService.getByKeyAsString("oss_ali_endpoint");

        // 上传到OSS
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKey, accessKeySecret);
        if (!ossClient.doesBucketExist(bucketName)) {
            ossClient.createBucket(bucketName);
        }
        ossClient.putObject(bucketName, fileFinalName, new ByteArrayInputStream(file.getBytes()));
        ossClient.shutdown();

        FileUploadResult uploadResult = new FileUploadResult();
        uploadResult.setFileName(fileFinalName);
        uploadResult.setFilePath(fileFinalName);
        uploadResult.setThumbPath(fileFinalName);
        uploadResult.setKey(fileFinalName);
        uploadResult.setSuffix(suffix);
        uploadResult.setSize(file.getSize());
        return uploadResult;
    }


    /**
     * Deletes file.
     *
     * @param key file key must not be null
     */
    @Override
    public void delete(String key) {
        String bucketName = optionService.getByKeyAsString("oss_ali_bucket_name");
        String accessKey = optionService.getByKeyAsString("oss_ali_access_key");
        String accessKeySecret = optionService.getByKeyAsString("oss_ali_access_secret");
        String endpoint = optionService.getByKeyAsString("oss_ali_endpoint");
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKey, accessKeySecret);
        ossClient.deleteObject(bucketName, key);
        ossClient.shutdown();
    }

    /**
     * Checks if the given type is supported.
     *
     * @param targetTypeEnum attachment type
     * @return true if supported; false otherwise
     */
    @Override
    public boolean support(FileTargetTypeEnum targetTypeEnum) {
        return targetTypeEnum == FileTargetTypeEnum.ALIOSS;
    }

    /**
     * 渲染文件到输出流
     *
     * @param key      文件KEY
     * @param response
     */
    @Override
    public void render(String key, HttpServletResponse response) throws IOException {

    }

    /**
     * 文件上传时是否加密
     *
     * @return
     */
    @Override
    public boolean isEncrypt() {
        return false;
    }
}
