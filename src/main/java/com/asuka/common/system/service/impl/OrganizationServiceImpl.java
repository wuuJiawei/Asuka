package com.asuka.common.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.asuka.common.core.web.PageParam;
import com.asuka.common.core.web.PageResult;
import com.asuka.common.system.mapper.OrganizationMapper;
import com.asuka.common.system.entity.Organization;
import com.asuka.common.system.service.OrganizationService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 组织机构服务实现类
 * Created by wangfan on 2020-03-14 11:29:04
 */
@Service
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements OrganizationService {

    @Override
    public PageResult<Organization> listPage(PageParam<Organization> page) {
        List<Organization> records = baseMapper.listPage(page);
        return new PageResult<>(records, page.getTotal());
    }

    @Override
    public List<Organization> listAll(Map<String, Object> page) {
        return baseMapper.listAll(page);
    }

}
