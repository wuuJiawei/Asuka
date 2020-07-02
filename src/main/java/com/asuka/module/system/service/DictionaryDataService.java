package com.asuka.module.system.service;

import com.asuka.common.web.BaseService;
import com.asuka.module.system.dao.DictionaryDataDao;
import com.asuka.module.system.entity.Dictionary;
import com.asuka.module.system.entity.DictionaryData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 字典项服务类
 * Created by wangfan on 2020-03-14 11:29:04
 */
@Service
public class DictionaryDataService extends BaseService<DictionaryData, DictionaryDataDao> {

    @Autowired
    DictionaryService dictionaryService;

    /**
     * 根据字典代码查询字典项
     */
    public List<DictionaryData> listByDictCode(String dictCode) {
        Dictionary dictionary = dictionaryService.lambdaQuery().andEq(Dictionary::getDictCode, dictCode).singleSimple();
        if (dictionary == null) {
            return new ArrayList<>();
        }
        return lambdaQuery().andEq(DictionaryData::getDictId, dictionary.getDictId()).asc(DictionaryData::getSortNumber).select();
    }

    /**
     * 根据字典代码和字典项名称查询字典项
     */
    public DictionaryData listByDictCodeAndName(String dictCode, String name) {
        Dictionary dictionary = dictionaryService.lambdaQuery().andEq(Dictionary::getDictCode, dictCode).singleSimple();
        if (dictionary == null) {
            return new DictionaryData();
        }
        return lambdaQuery().andEq(DictionaryData::getDictId, dictionary.getDictId()).andEq(DictionaryData::getDictDataName, name).single();
    }

    /**
     * 根据字典标识和字典项标识查询字典项
     * @param dictCode
     * @param dictDataCode
     * @return
     */
    public DictionaryData listByDictCodeAndDataCode(String dictCode, String dictDataCode) {
        Dictionary dictionary = dictionaryService.lambdaQuery().andEq(Dictionary::getDictCode, dictCode).singleSimple();
        if (dictionary == null) {
            return new DictionaryData();
        }
        return lambdaQuery().andEq(DictionaryData::getDictId, dictionary.getDictId()).andEq(DictionaryData::getDictDataCode, dictDataCode).single();
    }

}
