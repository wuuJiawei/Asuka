package com.asuka.plugin.generator;

import cn.hutool.core.io.FileUtil;
import com.asuka.common.web.JsonResult;
import com.asuka.common.web.PageResult;
import com.asuka.plugin.generator.dto.Entity;
import com.asuka.plugin.generator.dto.Template;
import org.beetl.sql.core.SQLManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.charset.Charset;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Web版代码生成器
 */
@RequestMapping("sys/generator")
@Controller
public class WebGenerator {

    private static Logger log = LoggerFactory.getLogger(WebGenerator.class);

    @Autowired @Lazy Environment env;
    @Autowired SQLManager sqlManager;
    @Autowired @Lazy WebGenService genService;

    @GetMapping
    public String index(HttpServletRequest request){
        String url = env.getProperty("spring.datasource.master.url");
        String user = env.getProperty("spring.datasource.master.username");
        String password = env.getProperty("spring.datasource.master.password");
        String driver = env.getProperty("spring.datasource.master.driver-class-name");
        Map<String, String> dataSource = new HashMap<>(4);
        dataSource.put("url", url);
        dataSource.put("user", user);
        dataSource.put("password", password);
        dataSource.put("driver", driver);
        request.setAttribute("dataSource", dataSource);

        // 读取pom.xml，解析出artifactId和groupId
        String artifactId = env.getProperty("application.artifactId");
        request.setAttribute("artifactId", StringUtils.isEmpty(artifactId) ? "Asuka" : artifactId);
        String groupId = env.getProperty("application.groupId");
        request.setAttribute("groupId", StringUtils.isEmpty(groupId)?"com.asuka":groupId);

        return "generator.html";
    }

    /**
     * 获取模板列表
     * @return
     */
    @GetMapping("templates")
    @ResponseBody
    public JsonResult getTemplates(){
        String thisPath = Objects.requireNonNull(WebGenerator.class.getResource("")).getPath();
        String tplPath = thisPath + "tpl";
        File[] tplFiles = FileUtil.ls(tplPath);
        List<Template> templateList = new ArrayList<>(tplFiles.length);
        for (File tplFile : tplFiles) {
            Template template = new Template();
            template.setName(tplFile.getName());
            template.setFileLength(tplFile.length());
            List<String> lineContent = FileUtil.readLines(tplFile, Charset.defaultCharset());
            template.setLineContent(lineContent);
            template.setLineLength(lineContent.size());
            templateList.add(template);
        }
        return JsonResult.ok().setData(templateList);
    }

    /**
     * 编辑模板内容
     * @param name
     * @param text
     * @return
     */
    @PutMapping("template/edit/{name}")
    public JsonResult editTemplate(@PathVariable String name, String text) {
        return JsonResult.programing();
    }

    /**
     * 获取全部表
     * @return
     */
    @RequestMapping("tables")
    @ResponseBody
    public PageResult<Entity> getTables(String tableName){
        List<Entity> entityList = genService.getAllTable();
        if (!StringUtils.isEmpty(tableName)) {
            entityList = entityList.stream().filter(entity -> entity.getTableName().contains(tableName) || entity.getComment().contains(tableName)).collect(Collectors.toList());
        }
        return new PageResult<>(entityList, entityList.size());
    }

    /**
     * 获取表的完整信息
     * @param tableName 表名
     * @return
     */
    @RequestMapping("tableInfo")
    @ResponseBody
    public JsonResult getTableInfo(String tableName) {
        Assert.notNull(tableName, "tableName must be given");
        return JsonResult.ok().setData(genService.getEntityInfo(tableName));
    }

    /**
     * 预览代码
     * @param tableName
     * @param type
     * @return
     */
    @RequestMapping("preview/{type}")
    @ResponseBody
    public JsonResult previewCode(String tableName, @PathVariable String type) {

        return JsonResult.error("开发中...");
    }


}
