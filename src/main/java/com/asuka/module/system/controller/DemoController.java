package com.asuka.module.system.controller;

import com.asuka.common.web.BaseConsoleController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wujiawei
 * @see
 * @since 2020/7/20 11:00 上午
 */
@Controller
@RequestMapping("sys/demo")
public class DemoController extends BaseConsoleController {

    @GetMapping("richtext")
    public String richText(){
        return "system/demo/richtext.html";
    }

}
