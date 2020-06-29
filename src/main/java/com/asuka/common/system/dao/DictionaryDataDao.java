package com.asuka.common.system.dao;

import org.beetl.sql.core.mapper.BaseMapper;
import com.asuka.common.core.web.PageParam;
import com.asuka.common.system.entity.DictionaryData;

import java.util.List;
import java.util.Map;

/**
 * 字典项Mapper接口
 * Created by wangfan on 2020-03-14 11:29:04
 */
public interface DictionaryDataDao extends BaseMapper<DictionaryData> {

    /**
     * 分页查询
     */
    List<DictionaryData> listPage(PageParam<DictionaryData> page);

    /**
     * 查询全部
     */
    List<DictionaryData> listAll(Map<String, Object> page);

}
