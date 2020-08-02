package com.asuka.plugin.spider.html;

import cn.hutool.core.util.ReUtil;
import cn.hutool.http.HttpUtil;

import java.util.List;

/**
 * https://www.layui.com/doc/element/icon.html
 * 爬取Layui的图标库
 * @author wujiawei
 * @see
 * @since 2020/8/2 10:56 上午
 */
public class LayuiIconSpider {

    private static final String URL = "https://www.layui.com/doc/element/icon.html";

    public static void run(){
        String html = HttpUtil.get(URL);

        List<String> iconList = ReUtil.findAll("<div class=\"doc-icon-fontclass\">(.*?)</div>", html, 1);
        StringBuilder builder = new StringBuilder();;
        for (String icon : iconList) {
            builder.append("\"").append(icon).append("\"").append(",");
        }
        System.out.println(builder.toString());

        List<String> unicodeIconList = ReUtil.findAll("<div class=\"doc-icon-code\">(.*?)</div>", html, 1);
        builder = new StringBuilder();
        for (String icon : unicodeIconList) {
            builder.append("\"").append(icon).append("\"").append(",");
        }
        System.out.println(builder.toString());
    }

    public static void main(String[] args) {
        run();
    }
}
