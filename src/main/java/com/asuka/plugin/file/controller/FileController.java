package com.asuka.plugin.file.controller;

import com.asuka.common.web.JsonResult;
import com.asuka.plugin.file.FileUploadResult;
import com.asuka.plugin.file.service.FileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 文件 控制器
 * @author wujiawei
 * @see
 * @since 2020/7/12 7:59 下午
 */
@Controller("fileControllerPlugin")
@RequestMapping("sys")
public class FileController {

    private final FileService fileService;

    public FileController(FileService fileService) {
        this.fileService = fileService;
    }

    @ResponseBody
    @RequestMapping("upload")
    public JsonResult upload(@RequestPart("file") MultipartFile file){
        try {
            FileUploadResult result = fileService.upload(file);
            return JsonResult.ok().setData(result);
        } catch (IOException e) {
            return JsonResult.error("文件上传失败，错误信息为：" + e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("upload/batch")
    public JsonResult upload(@RequestPart("file")MultipartFile[] files) {
        List<FileUploadResult> results = new ArrayList<>(files.length);
        StringBuilder builder = new StringBuilder();
        for (MultipartFile file : files) {
            try {
                results.add(fileService.upload(file));
            } catch (IOException e) {
                builder.append("[").append(file.getOriginalFilename()).append("]");
            }
        }
        if (builder.length() > 0) {
            return JsonResult.error(builder.append("上传失败，请重试，其他文件上传成功").toString());
        }
        return JsonResult.ok().setData(results);
    }

    @RequestMapping("upload/render/{path}")
    public void previewLocalFile(HttpServletResponse response, @PathVariable String path) {
        fileService.render(path, response);
    }
}
