package com.asuka.plugin.generator;

import cn.hutool.core.io.FileUtil;
import com.asuka.common.web.JsonResult;
import com.asuka.common.web.PageResult;
import com.asuka.plugin.generator.dto.Entity;
import com.asuka.plugin.generator.dto.SuperConfig;
import com.asuka.plugin.generator.dto.Template;
import com.asuka.plugin.generator.dto.enums.TemplateTypeEnum;
import org.beetl.sql.core.SQLManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        // 读取pom.xml，解析出artifactId和groupId
        String artifactId = env.getProperty("application.artifactId");
        request.setAttribute("artifactId", StringUtils.isEmpty(artifactId) ? "Asuka" : artifactId);
        String groupId = env.getProperty("application.groupId");
        request.setAttribute("groupId", StringUtils.isEmpty(groupId)?"com.asuka":groupId);
        String usrDir = System.getProperty("user.dir") + "/src/main/java/";
        request.setAttribute("absoluteFilePath", usrDir);

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
     * 预览单个文件代码
     * @param tableName
     * @param type
     * @return
     */
    @RequestMapping("preview/{type}")
    @ResponseBody
    public JsonResult previewCode(String tableName, SuperConfig config, @PathVariable String type) {
        Assert.notNull(type, "type must be given");
        String content = "";

        SuperGenHandler superGenHandler = new SuperGenHandler(sqlManager).config(config).selectTable(tableName).justForPreview();

        switch (TemplateTypeEnum.getValue(type)) {
            case ENTITY:
                content = superGenHandler.makeEntity();
                break;
            case DAO:
                content = superGenHandler.makeDao();
                break;
            case DAOMD:
                content = superGenHandler.makeDaoMd();
                break;
            case SERVICE:
                content = superGenHandler.makeService();
                break;
            case CONTROLLER:
                content = superGenHandler.makeController();
                break;
            case HTML:
                content = superGenHandler.makeHtml();
                break;
            case SQL:
                content = superGenHandler.makeSQL();
                break;
            default:
                break;
        }

        return JsonResult.ok().setData(content);
    }

    @ResponseBody
    @RequestMapping("preview")
    public JsonResult previewAllCode(String tableName, SuperConfig config) {
        SuperGenHandler superGenHandler = new SuperGenHandler(sqlManager).config(config).selectTable(tableName).justForPreview();

        // 代码内容
        Map<String, Object> contentMap = new HashMap<>();
        contentMap.put("entity", superGenHandler.makeEntity());
        contentMap.put("dao", superGenHandler.makeDao());
        contentMap.put("daoMd", superGenHandler.makeDaoMd());
        contentMap.put("service", superGenHandler.makeService());
        contentMap.put("controller", superGenHandler.makeController());
        contentMap.put("html", superGenHandler.makeHtml());
        contentMap.put("sql", superGenHandler.makeSQL());

        return JsonResult.ok()
                .put("path", superGenHandler.getOutputFileConfig().getPath())
                .put("name", superGenHandler.getOutputFileConfig().getName())
                .put("content", contentMap);
    }

    @ResponseBody
    @RequestMapping("generate")
    public JsonResult generateAllCode(String tableNames, SuperConfig config, HttpServletResponse response){
        Assert.notNull(tableNames, "tableNames must be given");
        String[] tableNameArr = tableNames.split(",");
        SuperGenHandler superGenHandler = new SuperGenHandler(sqlManager).config(config);
        for (String tableName : tableNameArr) {
            superGenHandler.selectTable(tableName);
            // 代码内容
            Map<String, Object> contentMap = new HashMap<>();
            contentMap.put("entity", superGenHandler.makeEntity());
            contentMap.put("dao", superGenHandler.makeDao());
            contentMap.put("daoMd", superGenHandler.makeDaoMd());
            contentMap.put("service", superGenHandler.makeService());
            contentMap.put("controller", superGenHandler.makeController());
            contentMap.put("html", superGenHandler.makeHtml());
            contentMap.put("sql", superGenHandler.makeSQL());
        }
        return JsonResult.ok();
    }


}
