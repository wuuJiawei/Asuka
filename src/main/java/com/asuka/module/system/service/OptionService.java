package com.asuka.module.system.service;

import com.asuka.common.web.BaseService;
import com.asuka.module.system.dao.OptionDao;
import com.asuka.module.system.entity.Option;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author wujiawei
 * @see
 * @since 2020/7/16 1:32 下午
 */
@Service
public class OptionService extends BaseService<Option, OptionDao> {

    /**
     * 根据Key获取配置
     * @param key
     * @return
     */
    public Option getByKey(String key) {
        return lambdaQuery().andEq(Option::getOptionKey, key).singleSimple();
    }

    /**
     * 根据Key获取Value，转换为字符串类型
     * @param key
     * @return
     */
    public String getByKeyAsString(String key) {
        Option option = getByKey(key);
        if (option == null) {
            return "";
        }
        return option.getOptionValue();
    }

    /**
     * 根据Key获取Value，转换为Boolean类型
     * @param key
     * @return
     */
    public boolean getByKeyAsBoolean(String key) {
        Option option = getByKey(key);
        if (option == null) {
            return false;
        }
        return Boolean.parseBoolean(option.getOptionValue());
    }

    /**
     * 根据Key获取Value，转换为int类型
     * @param key
     * @return
     */
    public int getByKeyAsInt(String key) {
        Option option = lambdaQuery().andEq(Option::getOptionKey, key).singleSimple();
        if (option == null) {
            return Integer.MIN_VALUE;
        }
        return Integer.parseInt(option.getOptionValue());
    }

    /**
     * 获取所有配置，转换为Map
     * @return
     */
    public Map<String, Object> getAsMap(){
        List<Option> options = dao().all();
        Map<String, Object> optionMap = new HashMap<>(options.size());
        for (Option option : options) {
            optionMap.put(option.getOptionKey(), option.getOptionValue());
        }
        return optionMap;
    }

}
