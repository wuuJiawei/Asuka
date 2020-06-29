package com.asuka.common.system.dao;

import org.beetl.sql.core.mapper.BaseMapper;
import com.asuka.common.core.web.PageParam;
import com.asuka.common.system.entity.OperRecord;


import java.util.List;
import java.util.Map;

/**
 * 操作日志Mapper接口
 * Created by wangfan on 2018-12-24 16:10
 */
public interface OperRecordDao extends BaseMapper<OperRecord> {

    /**
     * 分页查询
     */
    List<OperRecord> listPage(PageParam<OperRecord> page);

    /**
     * 查询全部
     */
    List<OperRecord> listAll(Map<String, Object> page);

}
