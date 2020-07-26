package com.asuka.module.api.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel("演示参数")
public class TestDto {

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("当前页码")
    private int pageNo;

}
