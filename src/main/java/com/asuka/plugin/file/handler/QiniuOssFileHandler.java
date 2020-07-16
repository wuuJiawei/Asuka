package com.asuka.plugin.file.handler;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.asuka.module.system.service.OptionService;
import com.asuka.plugin.file.FileTargetTypeEnum;
import com.asuka.plugin.file.FileUploadResult;
import com.asuka.plugin.file.dto.QiniuCustomPutRet;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

/**
 * 七牛OSS文件处理器
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/5/20
 */
@Component("QiniuOssFileHandlerOfAsuka")
public class QiniuOssFileHandler implements IFileHandler {

    private static final Logger log = LoggerFactory.getLogger(QiniuOssFileHandler.class);
    private final OptionService optionService;

    public QiniuOssFileHandler(OptionService optionService) {
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
        String extension = FileUtil.extName(fileName);

        // 文件名称，中文需要URL编码
        try {
            fileName = URLEncoder.encode(FileUtil.mainName(fileName), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            log.error(e.getMessage(), e.getCause());
            fileName = DateUtil.format(new Date(), "yyyyMMddHHmmss") + UUID.fastUUID().toString();
        }
        String fileFinalName = fileName + "." + FileTargetTypeEnum.QINIUOSS.toString() + "." + extension;

        Zone zone = getZone(optionService.getByKeyAsString("oss_qiniu_zone"));
        String accessKey = optionService.getByKeyAsString("oss_qiniu_access_key");
        String secretKey = optionService.getByKeyAsString("oss_qiniu_secret_key");
        String bucket = optionService.getByKeyAsString("oss_qiniu_bucket");
        String protocol = optionService.getByKeyAsString("oss_qiniu_protocol");
        String domain = optionService.getByKeyAsString("oss_qiniu_domain");
        String source = optionService.getByKeyAsString("oss_qiniu_source");
        String styleRule = optionService.getByKeyAsString("oss_qiniu_style_rule");

        // Create configuration
        Configuration configuration = new Configuration(zone);
        UploadManager uploadManager = new UploadManager(configuration);
        Auth auth = Auth.create(accessKey, secretKey);
        StringMap putPolicy = new StringMap();
        putPolicy.put("returnBody", "{\"key\":\"$(key)\",\"hash\":\"$(etag)\",\"size\":$(fsize),\"width\":$(imageInfo.width),\"height\":$(imageInfo.height)}");
        String uploadToken = auth.uploadToken(bucket, null, 60 * 60, putPolicy);



        Response response = uploadManager.put(file.getBytes(), fileFinalName, uploadToken);
        QiniuCustomPutRet putRet = JSONUtil.toBean(response.bodyString(), QiniuCustomPutRet.class);

        String filePath = putRet.getKey();

        FileUploadResult result = new FileUploadResult();
        result.setFileName(putRet.getKey());
        result.setFilePath(StrUtil.isBlank(styleRule) ? filePath : filePath + styleRule);
        result.setThumbPath(StrUtil.isBlank(styleRule) ? filePath : filePath + styleRule);
        result.setKey(putRet.getKey());
        result.setSuffix(extension);
        result.setSize(putRet.getSize());
        return result;
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
     * Deletes file.
     *
     * @param key file key must not be null
     */
    @Override
    public void delete(String key) {
        Zone zone = getZone(optionService.getByKeyAsString("oss_qiniu_zone"));
        String accessKey = optionService.getByKeyAsString("oss_qiniu_access_key");
        String secretKey = optionService.getByKeyAsString("oss_qiniu_secret_key");
        String bucket = optionService.getByKeyAsString("oss_qiniu_bucket");

        Configuration configuration = new Configuration(zone);
        Auth auth = Auth.create(accessKey, secretKey);
        BucketManager bucketManager = new BucketManager(auth, configuration);
        try {
            bucketManager.delete(bucket, key);
        } catch (QiniuException e) {
            e.printStackTrace();
            log.error("删除七牛云附件  " + key + " 失败", e);
        }
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

    /**
     * Checks if the given type is supported.
     *
     * @param typeEnum file target type
     * @return true if supported; false otherwise
     */
    @Override
    public boolean support(FileTargetTypeEnum typeEnum) {
        return FileTargetTypeEnum.QINIUOSS == typeEnum;
    }

    /**
     * 获取七牛Zone
     *
     * @param zoneStr
     * @return
     */
    private Zone getZone(String zoneStr) {
        Zone zone;

        if (StringUtils.isEmpty(zoneStr)) {
            zone = Zone.autoZone();
        }

        switch (zoneStr) {
            case "z0":
                zone = Zone.zone0();
                break;
            case "z1":
                zone = Zone.zone1();
                break;
            case "z2":
                zone = Zone.zone2();
                break;
            case "na0":
                zone = Zone.zoneNa0();
                break;
            case "as0":
                zone = Zone.zoneAs0();
                break;
            default:
                zone = Zone.autoZone();
        }
        return zone;
    }
}
