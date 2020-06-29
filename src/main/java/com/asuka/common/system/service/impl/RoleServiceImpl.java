package com.asuka.common.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.asuka.common.system.mapper.RoleMapper;
import com.asuka.common.system.entity.Role;
import com.asuka.common.system.service.RoleService;
import org.springframework.stereotype.Service;

/**
 * 角色服务实现类
 * Created by wangfan on 2018-12-24 16:10
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

}
