package com.asuka.plugin.file.handler;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.UUID;
import cn.hutool.system.SystemUtil;
import com.asuka.plugin.file.FileTargetTypeEnum;
import com.asuka.plugin.file.FileUploadResult;
import org.apache.tika.Tika;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;

import static com.asuka.plugin.file.handler.IFileHandler.encryptFile;

/**
 * 本地文件上传
 *
 * @author wujiawei
 * @see
 * @since 2020/7/12 7:56 下午
 */
@Component
public class LocalFileHandler implements IFileHandler {

    private static final Logger log = LoggerFactory.getLogger(LocalFileHandler.class);
    public static final String UPLOAD_PATH = "upload";
    private static final String LINUX_PATH = "/tmp/asuka";
    private static final String WINDOWS_PATH = "C:/Tmp/asuka";

    /**
     * 是否支持的上传方式
     *
     * @param targetTypeEnum 上传位置类型枚举
     * @return
     */
    @Override
    public boolean support(FileTargetTypeEnum targetTypeEnum) {
        return targetTypeEnum == FileTargetTypeEnum.LOCAL;
    }

    /**
     * 上传
     *
     * @param file
     * @return
     */
    @Override
    public FileUploadResult upload(MultipartFile file) throws IOException {
        // 原始文件名称
        String fileName = file.getOriginalFilename();
        Assert.notNull(fileName, "Multipart file name must be given");

        // 校验文件名称
        if (fileName.contains("..")) {
            throw new IllegalArgumentException("Sorry! Filename contains invalid path sequence " + fileName);
        }

        // 文件类型
        String suffix = FileUtil.extName(fileName);

        // 文件名称，中文需要URL编码
        try {
            fileName = URLEncoder.encode(FileUtil.mainName(fileName), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            log.error(e.getMessage(), e.getCause());
            fileName = DateUtil.format(new Date(), "yyyyMMddHHmmss") + UUID.fastUUID().toString();
        }

        // 文件上传路径
        String filePath = ((SystemUtil.getOsInfo().isLinux() || SystemUtil.getOsInfo().isMac()) ? LINUX_PATH : WINDOWS_PATH) + File.separator + UPLOAD_PATH + File.separator + suffix;
        String fileFinalName = fileName + "." + FileTargetTypeEnum.LOCAL.toString() + "." + suffix;
        String filePathConcatName = filePath + File.separator + fileFinalName;
        File targetFile = new File(filePathConcatName);
        if (!targetFile.getParentFile().exists()) {
            targetFile.getParentFile().mkdirs();
        }

        if (!isEncrypt()) {
            file.transferTo(targetFile);
        } else {
            encryptFile(file, targetFile);
        }

        FileUploadResult result = new FileUploadResult();
        result.setFileName(fileFinalName);
        result.setFilePath(targetFile.getAbsolutePath());
        result.setKey(fileFinalName);
        result.setSuffix(suffix);
        result.setSize(file.getSize());
        return result;
    }

    /**
     * 渲染文件到输出流
     *
     * @param fileName          文件名称
     * @param outputStream
     */
    @Override
    public void render(String fileName, HttpServletResponse response) throws IOException {
        String suffix = FileUtil.extName(fileName);
        String filePath = ((SystemUtil.getOsInfo().isLinux() || SystemUtil.getOsInfo().isMac()) ? LINUX_PATH : WINDOWS_PATH) + File.separator + UPLOAD_PATH + File.separator + suffix;
        String filePathConcatName = filePath + File.separator + fileName;
        File file = new File(filePathConcatName);

        // 设置ContentType
        String contentType = getFileType(file);  // 获取文件类型
        if (contentType != null) {
            response.setContentType(contentType);
        } else {
            setDownloadHeader(response, file.getName());
        }

        output(file, response.getOutputStream());
    }

    /**
     * 删除
     *
     * @param key
     */
    @Override
    public void delete(String key) {

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
     * 获取文件类型
     */
    private static String getFileType(File file) {
        String contentType = null;
        try {
            contentType = new Tika().detect(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return contentType;
    }

    /**
     * 输出
     * @param file
     * @param os
     */
    private static void output(File file, OutputStream os) {
        BufferedInputStream is = null;
        try {
            is = new BufferedInputStream(new FileInputStream(file));
            byte[] bytes = new byte[1024 * 256];
            int len;
            while ((len = is.read(bytes)) != -1) {
                os.write(bytes, 0, len);
            }
            os.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 设置下载文件的header
     */
    public static void setDownloadHeader(HttpServletResponse response, String fileName) {
        response.setContentType("application/force-download");
        try {
            fileName = URLEncoder.encode(fileName, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
    }
}
