package com.asuka.module.system.controller;

import com.asuka.common.web.BaseConsoleController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
    public String richText() {
        return "system/demo/richtext.html";
    }

    @GetMapping("{name}.html")
    public String autoLoad(@PathVariable String name) {
        return "system/demo/" + name + ".html";
    }

    @GetMapping("error/{num}")
    public String error(@PathVariable String num){
        return "error/" + num + ".html";
    }

}
