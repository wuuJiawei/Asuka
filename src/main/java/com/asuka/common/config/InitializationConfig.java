package com.asuka.common.config;

import cn.hutool.core.thread.ThreadUtil;
import com.asuka.plugin.file.FileUploadResult;
import com.asuka.plugin.file.service.FileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.IOException;

/**
 * 初始化配置
 *
 * @author wujiawei
 * @see
 * @since 2020/7/20 11:37 上午
 */
@Order(1)
@Component
public class InitializationConfig {

    private final static Logger log = LoggerFactory.getLogger(InitializationConfig.class);
    private final FileService fileService;

    public InitializationConfig(FileService fileService) {
        this.fileService = fileService;
    }

    /**
     * 持久化头像到文件目录
     */
    @PostConstruct
    public void avatar() {
        ThreadUtil.execute(() -> {
            String usrDir = System.getProperty("user.dir");
            String resourcePath = usrDir + "/src/main/resources/";
            String avatarUrl = resourcePath + "static/assets/images/head.jpg";
            try {
                FileUploadResult result = fileService.upload(new File(avatarUrl));
                log.debug(result.getFileName());
            } catch (IOException e) {
                log.error(e.getMessage(), e);
            }
        });
    }

}
