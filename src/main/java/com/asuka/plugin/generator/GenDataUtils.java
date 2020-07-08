package com.asuka.plugin.generator;

import cn.hutool.core.util.StrUtil;
import com.asuka.plugin.generator.dto.Attribute;
import com.asuka.plugin.generator.dto.Entity;
import org.beetl.sql.core.JavaType;
import org.beetl.sql.core.NameConversion;
import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.db.ColDesc;
import org.beetl.sql.core.db.MetadataManager;
import org.beetl.sql.core.db.TableDesc;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/7
 */
public class GenDataUtils {

    /**
     * 获取所有表
     * @return
     */
    public static List<Entity> getAllTable(SQLManager sqlManager){
        MetadataManager metadataManager = sqlManager.getMetaDataManager();
        Set<String> tableSet = metadataManager.allTable();
        return tableSet.stream().map(x-> getEntitySimpleInfo(sqlManager, x)).collect(Collectors.toList());
    }


    /**
     * 获取表的简单信息
     * 仅包含：表名、类名、注释
     * @param tableName 表名
     * @return
     */
    public static Entity getEntitySimpleInfo(SQLManager sqlManager, String tableName) {
        MetadataManager metadataManager = sqlManager.getMetaDataManager();
        NameConversion nameConversion =sqlManager.getNc();
        TableDesc tableDesc = metadataManager.getTable(tableName);
        if (tableDesc == null) {
            return null;
        }
        Entity entity = new Entity();
        entity.setTableName(tableName);
        entity.setClassName(nameConversion.getClassName(tableName));
        entity.setFirstUpperClassName(StrUtil.upperFirst(entity.getClassName()));
        entity.setComment(StrUtil.emptyToDefault(tableDesc.getRemark(), entity.getFirstUpperClassName()));
        return entity;
    }

    /**
     * 获取表的完整信息，包含字段列表、主键字段等
     * @param sqlManager
     * @param tableName 表名
     * @return
     */
    public static Entity getEntityInfo(SQLManager sqlManager, String tableName){
        MetadataManager metadataManager = sqlManager.getMetaDataManager();
        NameConversion nameConversion = sqlManager.getNc();
        TableDesc tableDesc = metadataManager.getTable(tableName);
        if (tableDesc == null) {
            return null;
        }

        // 表基础信息
        Entity entity = new Entity();
        entity.setTableName(tableName);
        entity.setClassName(nameConversion.getClassName(tableName));
        entity.setFirstUpperClassName(StrUtil.upperFirst(entity.getClassName()));
        entity.setComment(StrUtil.emptyToDefault(tableDesc.getRemark(), entity.getFirstUpperClassName()));

        // 字段信息
        Set<String> cols = tableDesc.getCols();
        List<Attribute> attributeList = cols.stream().map(x->{
            ColDesc colDesc = tableDesc.getColDesc(x);
            Attribute attribute = new Attribute();
            attribute.setClassName(nameConversion.getPropertyName(x));
            attribute.setFirstUpperClassName(StrUtil.upperFirst(attribute.getClassName()));
            attribute.setComment(colDesc.remark);
            attribute.setSqlName(x);
            if(tableDesc.getIdNames().contains(x)) {
                attribute.setId(true);
                //TODO 目前仅支持单一主键生成
                entity.setIdAttribute(attribute);
            }
            String type = JavaType.getType(colDesc.sqlType, colDesc.size, colDesc.digit);
            if(type.equals("Double")){
                type = "BigDecimal";
            }
            if(type.equals("Timestamp")){
                type ="Date";
            }
            attribute.setJavaType(type);
            setGetDisplayName(attribute);
            return attribute;
        }).collect(Collectors.toList());
        entity.setColList(attributeList);
        return entity;
    }

    /**
     * 根据数据库注释来判断显示名称
     * @param attr
     */
    private static void setGetDisplayName(Attribute attr) {
        String comment = attr.getComment();
        if(StringUtils.isEmpty(comment)) {
            attr.setDisplayName(attr.getClassName());
            return ;
        }
        String displayName = null;
        int index = comment.indexOf(",");
        if(index!=-1) {
            displayName =  comment.substring(0,index);
            attr.setDisplayName(displayName);
        }else {
            attr.setDisplayName(comment);
        }
    }

}
