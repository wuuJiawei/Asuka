package com.asuka.common.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.asuka.common.system.mapper.DictionaryMapper;
import com.asuka.common.system.entity.Dictionary;
import com.asuka.common.system.service.DictionaryService;
import org.springframework.stereotype.Service;

/**
 * 字典服务实现类
 * Created by wangfan on 2020-03-14 11:29:03
 */
@Service
public class DictionaryServiceImpl extends ServiceImpl<DictionaryMapper, Dictionary> implements DictionaryService {

}
