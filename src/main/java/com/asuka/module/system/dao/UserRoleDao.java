package com.asuka.module.system.dao;

import com.asuka.module.system.entity.Role;
import com.asuka.module.system.entity.UserRole;
import org.beetl.sql.core.annotatoin.SqlResource;
import org.beetl.sql.core.mapper.BaseMapper;

import java.util.List;

/**
 * 用户角色Mapper接口
 * Created by wangfan on 2018-12-24 16:10
 */
@SqlResource("system.userRole")
public interface UserRoleDao extends BaseMapper<UserRole> {

    /**
     * 批量查询用户角色
     */
    List<Role> listByUserIds(List<Integer> userIds);

    /**
     * 查询某个用户的角色
     */
    List<Role> listByUserId(Integer userId);

}
