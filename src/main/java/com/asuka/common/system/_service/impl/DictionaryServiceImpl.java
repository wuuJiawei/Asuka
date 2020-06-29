package com.asuka.common.system._service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.asuka.common.system.dao.DictionaryDao;
import com.asuka.common.system.entity.Dictionary;
import com.asuka.common.system._service.DictionaryService;
import org.springframework.stereotype.Service;

/**
 * 字典服务实现类
 * Created by wangfan on 2020-03-14 11:29:03
 */
@Service
public class DictionaryServiceImpl extends ServiceImpl<DictionaryDao, Dictionary> implements DictionaryService {

}
