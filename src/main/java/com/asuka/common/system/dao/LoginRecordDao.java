package com.asuka.common.system.dao;

import org.beetl.sql.core.mapper.BaseMapper;
import com.asuka.common.core.web.PageParam;
import com.asuka.common.system.entity.LoginRecord;


import java.util.List;
import java.util.Map;

/**
 * 登录日志Mapper接口
 * Created by wangfan on 2018-12-24 16:10
 */
public interface LoginRecordDao extends BaseMapper<LoginRecord> {

    /**
     * 分页查询
     */
    List<LoginRecord> listPage(PageParam<LoginRecord> page);

    /**
     * 查询全部
     */
    List<LoginRecord> listAll(Map<String, Object> page);

}
