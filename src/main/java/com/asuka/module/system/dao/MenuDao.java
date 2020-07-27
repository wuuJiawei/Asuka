package com.asuka.module.system.dao;

import com.asuka.module.system.entity.Menu;
import org.beetl.sql.core.annotatoin.SqlResource;
import org.beetl.sql.core.mapper.BaseMapper;

/**
 * 菜单Mapper接口
 * Created by wangfan on 2018-12-24 16:10
 */
@SqlResource("system.menu")
public interface MenuDao extends BaseMapper<Menu> {

}
