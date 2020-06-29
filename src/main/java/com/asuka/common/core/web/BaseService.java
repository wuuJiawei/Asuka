package com.asuka.common.core.web;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.asuka.common.system.entity.Dictionary;
import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.db.ColDesc;
import org.beetl.sql.core.db.TableDesc;
import org.beetl.sql.core.mapper.BaseMapper;
import org.beetl.sql.core.query.LambdaQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Service基类
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/29
 */
public class BaseService<T, S extends BaseMapper<T>> {

    @Autowired
    protected SQLManager sqlManager;
    @Autowired
    private S dao;

    public S dao() {
        return dao;
    }

    /**
     * 创建查询
     * @return
     */
    public Query<T> query(){
        return dao.createQuery();
    }

    /**
     * 创建Lambda查询
     * @return
     */
    public LambdaQuery<T> lambdaQuery() {
        return dao.createLambdaQuery();
    }

    /**
     * 根据id查询对象，如果主键ID不存在
     * @param id
     * @return
     */
    public T queryById(Object id) {
        return queryById(getCurrentEntityClass(), id);
    }

    /**
     * 根据id查询
     * @param tClass 返回的对象类型
     * @param id     主键id
     * @return
     */
    public T queryById(Class<T> tClass, Object id) {
        T t = sqlManager.unique(tClass, id);
        return t;
    }

    /**
     * 根据Query查询
     * @param query
     * @return
     */
    public List<T> queryAll(Query<T> query) {
        return query.select(getAllColumns());
    }

    /**
     * 查询所有数据
     * @return
     */
    public List<T> queryAll(){
        return query().select(getAllColumns());
    }

    /**
     * 新增一条数据
     * @param model 实体类
     * @return
     */
    public boolean save(T model) {
        return sqlManager.insert(model,true) > 0;
    }

    /**
     * 批量新增数据
     * 默认不填充自增ID
     * @param list
     * @return
     */
    public boolean saveBatch(List<T> list) {
        return saveBatch(list, false);
    }

    /**
     * 批量新增数据
     * 自动填充自增ID
     * @param list
     * @param autoDbAssignKey  是否填充自增ID
     * @return
     */
    public boolean saveBatch(List<T> list, boolean autoDbAssignKey) {
        return sqlManager.insertBatch(getCurrentEntityClass(), list, autoDbAssignKey).length > 0;
    }

    /**
     * 批量删除数据
     * @param ids
     * @return
     */
    public boolean deleteBatchById(List<Serializable> ids) {
        if (ids == null || ids.isEmpty()) {
            throw new IllegalArgumentException("删除数据ID不能为空");
        }

    }

    /**
     * 删除数据
     * @param id
     * @return
     */
    public boolean deleteById(Serializable id) {
        return sqlManager.deleteById(getCurrentEntityClass(), id) > 0;
    }

    /**
     * 更新，只更新不为空的字段
     * @param model
     * @return
     */
    public boolean updateTemplate(T model) {
        return sqlManager.updateTemplateById(model)>0;
    }

    /**
     * 更新所有字段
     * @param model
     * @return
     */
    public boolean update(T model) {
        return sqlManager.updateById(model) > 0;
    }
    
    /**
     * 获取当前注入泛型T的类型
     * @return 具体类型
     */
    @SuppressWarnings("unchecked")
    private Class<T> getCurrentEntityClass() {
        return (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    /**
     * 获取所有字段
     * @return
     */
    public String[] getAllColumns() {
        String tableName = sqlManager.getNc().getTableName(getCurrentEntityClass());
        TableDesc desc = sqlManager.getMetaDataManager().getTable(tableName);
        Map<String, ColDesc> colMap = desc.getColsDetail();
        List<String> cols = new ArrayList<>(colMap.size());
        for(Map.Entry<String,ColDesc> entry:colMap.entrySet()){
            cols.add(entry.getKey());
        }
        String[] columns = new String[cols.size()];
        cols.toArray(columns);
        return columns;
    }

}
