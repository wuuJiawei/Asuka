package com.asuka.plugin.generator;

import com.asuka.plugin.generator.dto.Entity;
import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.db.MetadataManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class WebGenService {

    @Autowired private SQLManager sqlManager;

    /**
     * 获取所有表
     * @return
     */
    public List<Entity> getAllTable(){
        return GenDataUtils.getAllTable(sqlManager);
    }

    /**
     * 获取表的简单信息
     * 仅包含：表名、类名、注释
     * @param tableName 表名
     * @return
     */
    public Entity getEntitySimpleInfo(String tableName) {
        return GenDataUtils.getEntitySimpleInfo(sqlManager, tableName);
    }

    /**
     * 获取表的完整信息，包含字段列表、主键字段等
     * @param tableName
     * @return
     */
    public Entity getEntityInfo(String tableName) {
        return GenDataUtils.getEntityInfo(sqlManager, tableName);
    }



}
