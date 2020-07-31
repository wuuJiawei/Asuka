package com.asuka.module.system.controller;

import cn.hutool.core.util.RandomUtil;
import com.asuka.common.utils.RandomUtils;
import com.asuka.common.web.BaseConsoleController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author wujiawei
 * @see
 * @since 2020/7/29 9:38 下午
 */
@RequestMapping("sys")
@Controller
public class DashboardController extends BaseConsoleController {

    private static ExecutorService executor = Executors.newSingleThreadExecutor();

    @GetMapping("dashboard")
    public String dashboard(HttpServletRequest request) {
        executor.submit(() -> {
            Map<String, Object> infoMap = new HashMap<>(4);
            infoMap.put("star", 56);
            infoMap.put("fork", 678);
            infoMap.put("hate", 324);
            infoMap.put("feedback", 999);
            request.setAttribute("info", infoMap);
        });

        executor.submit(()->{
            List<Map<String, Object>> history = new ArrayList<>();
            for (int i = 0; i < 8; i++) {
                Map<String, Object> map = new HashMap<>(3);
                map.put("title", RandomUtils.randomChineseName() + " 完成了TA的保密工作");
                map.put("time", RandomUtils.randomTime());
                map.put("active", RandomUtil.randomBoolean());
                history.add(map);
            }
            request.setAttribute("history", history);
        });

        return "system/dashboard.html";
    }


}
