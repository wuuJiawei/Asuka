package com.asuka.module.system.service;

import com.asuka.common.utils.UserAgentGetter;
import com.asuka.common.web.BaseService;
import com.asuka.module.system.dao.LoginRecordDao;
import com.asuka.module.system.entity.LoginRecord;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * 登录日志服务类
 * Created by wangfan on 2018-12-24 16:10
 */
@Service
public class LoginRecordService extends BaseService<LoginRecord, LoginRecordDao> {

    /**
     * 添加登录日志
     *
     * @param username 用户账号
     * @param type     操作类型
     * @param comments 备注
     * @param request  HttpServletRequest
     */
    public void saveAsync(String username, Integer type, String comments, HttpServletRequest request){
        LoginRecord loginRecord = new LoginRecord();
        loginRecord.setUsername(username);
        loginRecord.setOperType(type);
        loginRecord.setComments(comments);
        UserAgentGetter agentGetter = new UserAgentGetter(request);
        loginRecord.setOs(agentGetter.getOS());
        loginRecord.setDevice(agentGetter.getDevice());
        loginRecord.setBrowser(agentGetter.getBrowser());
        loginRecord.setIp(agentGetter.getIp());
        saveAsync(loginRecord);
    }

    /**
     * 添加登录成功的登录日志
     *
     * @param username 用户账号
     * @param request  HttpServletRequest
     */
    public void saveAsync(String username, HttpServletRequest request) {
        saveAsync(username, LoginRecord.TYPE_LOGIN, null, request);
    }

    @Async
    public void saveAsync(LoginRecord loginRecord) {
        dao().insert(loginRecord);
    }

}
