package com.asuka.common.system.controller;

import com.asuka.common.core.web.BaseConsoleController;
import com.asuka.common.core.web.JsonResult;
import com.asuka.common.system.entity.LoginRecord;
import com.asuka.common.system.entity.Menu;
import com.asuka.common.system.service.LoginRecordService;
import com.asuka.common.system.service.MenuService;
import com.wf.captcha.utils.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 首页、登录、验证码等
 * Created by wangfan on 2018-12-24 16:10
 */
@Controller
public class MainController extends BaseConsoleController implements ErrorController {

    @Autowired
    private MenuService menuService;
    @Autowired
    private LoginRecordService loginRecordService;
    @Autowired
    private AuthenticationManager authenticationManager;

    /**
     * 用户登录
     */
    @ResponseBody
    @GetMapping("/login/processing")
    public JsonResult login(String username, String password, String code, Boolean remember, HttpServletRequest request) {
        if (username == null || username.trim().isEmpty()) return JsonResult.error("请输入账号");
        if (!CaptchaUtil.ver(code, request)) {
            loginRecordService.saveAsync(username, LoginRecord.TYPE_ERROR, "验证码错误", request);
            return JsonResult.error("验证码不正确");
        }
        Authentication authentication = null;
        try {
            if (remember == null) {
                remember = false;
            }
            // 该方法会调用UserService.loadUserByUsername
            authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            loginRecordService.saveAsync(username, request);
            return JsonResult.ok("登录成功");
        } catch (BadCredentialsException ice) {
            loginRecordService.saveAsync(username, LoginRecord.TYPE_ERROR, "密码错误", request);
            return JsonResult.error("密码错误");
        } catch (UsernameNotFoundException uae) {
            loginRecordService.saveAsync(username, LoginRecord.TYPE_ERROR, "账号不存在", request);
            return JsonResult.error("账号不存在");
        } catch (LockedException e) {
            loginRecordService.saveAsync(username, LoginRecord.TYPE_ERROR, "账号被锁定", request);
            return JsonResult.error("账号被锁定");
        } catch (Exception eae) {
            loginRecordService.saveAsync(username, LoginRecord.TYPE_ERROR, eae.getMessage(), request);
            return JsonResult.error(eae.getMessage());
        }
    }

    /**
     * 登录页
     */
    @GetMapping("/login")
    public String login() {
        if (getLoginUser() != null) return "redirect:index";
        return "login.html";
    }

    /**
     * 主页
     */
    @RequestMapping({"/", "/index"})
    public String index(Model model) {
        // 左侧菜单
        List<Menu> menus = menuService.getUserMenu(getLoginUserId(), Menu.TYPE_MENU);
        model.addAttribute("menus", menuService.toMenuTree(menus, 0));
        return "index.html";
    }

    /**
     * 图形验证码
     */
    @RequestMapping("/assets/captcha")
    public void captcha(HttpServletRequest request, HttpServletResponse response) {
        try {
            CaptchaUtil.out(5, request, response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 主页弹窗页面
     */
    @RequestMapping("/tpl/{name}")
    public String tpl(@PathVariable("name") String name) {
        return "index/" + name + ".html";
    }

    /**
     * 错误页
     */
    @RequestMapping("/error")
    public String error() {
        return "error/404.html";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }

}
