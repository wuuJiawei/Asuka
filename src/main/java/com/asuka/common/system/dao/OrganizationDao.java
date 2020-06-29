package com.asuka.common.system.dao;

import org.beetl.sql.core.mapper.BaseMapper;
import com.asuka.common.core.web.PageParam;
import com.asuka.common.system.entity.Organization;


import java.util.List;
import java.util.Map;

/**
 * 组织机构Mapper接口
 * Created by wangfan on 2020-03-14 11:29:04
 */
public interface OrganizationDao extends BaseMapper<Organization> {

    /**
     * 分页查询
     */
    List<Organization> listPage(PageParam<Organization> page);

    /**
     * 查询全部
     */
    List<Organization> listAll(Map<String, Object> page);

}
