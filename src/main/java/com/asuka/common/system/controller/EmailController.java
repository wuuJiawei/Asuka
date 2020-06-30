package com.asuka.common.system.controller;

import com.asuka.common.core.annotation.OperLog;
import com.asuka.common.core.web.JsonResult;
import com.asuka.common.system.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;

/**
 * 邮件功能
 * Created by wangfan on 2020-03-21 0:37
 */
@Controller
@RequestMapping("/sys/email")
public class EmailController {
    @Autowired
    private EmailService emailService;

    @RequestMapping()
    public String view() {
        return "system/email.html";
    }

    /**
     * 发送邮件
     */
    @OperLog(value = "邮件功能", desc = "发送邮件", result = true, param = false)
    @ResponseBody
    @RequestMapping("/send")
    public JsonResult send(String title, String html, String email) {
        try {
            emailService.sendFullTextEmail(title, html, new String[]{email});
            return JsonResult.ok("发送成功");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return JsonResult.error("发送失败");
    }

}
