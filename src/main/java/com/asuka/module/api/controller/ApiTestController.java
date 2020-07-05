package com.asuka.module.api.controller;

import com.asuka.common.web.JsonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(value = "测试", tags = "测试")
@RequestMapping("/api/v1/test")
@RestController
public class ApiTestController {

    @ApiOperation("测试接口")
    @GetMapping
    public JsonResult test(){
        return JsonResult.programing();
    }

}
