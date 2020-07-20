package com.asuka.module.api.controller;

import com.asuka.common.web.JsonResult;
import com.asuka.common.web.PageResult;
import com.asuka.module.system.entity.User;
import com.asuka.module.system.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.beetl.sql.core.engine.PageQuery;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(value = "测试", tags = "测试")
@RequestMapping("/api/v1/test")
@RestController
public class ApiTestController {

    private final UserService userService;

    public ApiTestController(UserService userService) {
        this.userService = userService;
    }

    @ApiOperation("测试接口")
    @GetMapping("1")
    public JsonResult test() {
        return JsonResult.programing();
    }

    @ApiOperation("测试接口2")
    @GetMapping("2")
    public PageResult<User> test2() {
        PageQuery<User> pageQuery = userService.lambdaQuery().desc(User::getUserId).page(1, 20);
        return new PageResult<User>(pageQuery.getList(), pageQuery.getTotalRow());
    }

}
