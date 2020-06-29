package com.asuka.common.system.service;

import com.asuka.common.core.web.BaseService;
import com.asuka.common.system.dao.OperRecordDao;
import com.asuka.common.system.entity.OperRecord;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;


/**
 * 操作日志服务实现类
 * Created by wangfan on 2018-12-24 16:10
 */
@Service
public class OperRecordService extends BaseService<OperRecord, OperRecordDao> {

    @Async
    public void saveAsync(OperRecord operRecord) {
        dao().insert(operRecord);
    }

}
