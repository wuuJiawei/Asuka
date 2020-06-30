package com.asuka.module.system.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.alibaba.fastjson.JSON;
import com.asuka.common.annotation.OperLog;
import com.asuka.common.web.*;
import com.asuka.common.utils.CoreUtil;
import com.asuka.module.system.service.DictionaryDataService;
import com.asuka.module.system.service.OrganizationService;
import com.asuka.module.system.service.RoleService;
import com.asuka.module.system.service.UserService;
import com.asuka.module.system.entity.DictionaryData;
import com.asuka.module.system.entity.Organization;
import com.asuka.module.system.entity.Role;
import com.asuka.module.system.entity.User;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 用户管理
 * Created by wangfan on 2018-12-24 16:10
 */
@Controller
@RequestMapping("/sys/user")
public class UserController extends BaseQueryController<User, UserService> {

    @Autowired
    private DictionaryDataService dictionaryDataService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private OrganizationService organizationService;

    @RequestMapping()
    public String view(Model model) {
        model.addAttribute("sexList" , dictionaryDataService.listByDictCode("sex"));
        model.addAttribute("organizationTypeList" , dictionaryDataService.listByDictCode("organization_type"));
        model.addAttribute("rolesJson" , JSON.toJSONString(roleService.dao().all()));
        return "system/user.html";
    }

    /**
     * 个人中心
     */
    @RequestMapping("/info")
    public String userInfo(Model model) {
        model.addAttribute("user" , service.getFullById(getLoginUserId()));
        model.addAttribute("sexList" , dictionaryDataService.listByDictCode("sex"));
        return "index/user-info.html";
    }

    /**
     * 分页查询用户
     */
    @OperLog(value = "用户管理" , desc = "分页查询")
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<User> page(HttpServletRequest request) {
        PageQuery<User> query = createPageQuery(request);
        List<User> list = query.getList();
        service.selectUserRoles(list);
        return new PageResult<User>(list, query.getTotalRow());
    }

    /**
     * 查询全部用户
     */
    @OperLog(value = "用户管理" , desc = "查询全部")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        Query<User> query = createQuery(request);
        List<User> records = service.queryAll(query);
        return JsonResult.ok().setData(records);
    }

    /**
     * 根据id查询用户
     */
    @OperLog(value = "用户管理" , desc = "根据id查询")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        return JsonResult.ok().setData(service.queryById(id));
    }

    /**
     * 添加用户
     */
    @OperLog(value = "用户管理" , desc = "添加" , param = false, result = true)
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult save(@RequestBody User user) {
        user.setState(0);
        user.setPassword(service.encodePsw(user.getPassword()));
        if (service.saveUser(user)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 修改用户
     */
    @OperLog(value = "用户管理" , desc = "修改" , param = false, result = true)
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(@RequestBody User user) {
        user.setState(null);  // 状态不能修改
        user.setPassword(null);  // 密码不能修改
        user.setUsername(null);  // 账号不能修改
        if (service.updateUser(user)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 删除用户
     */
    @OperLog(value = "用户管理" , desc = "删除" , result = true)
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(Integer id) {
        if (service.deleteById(id)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 批量修改用户
     */
    @OperLog(value = "用户管理" , desc = "批量修改" , param = false, result = true)
    @ResponseBody
    @RequestMapping("/updateBatch")
    public JsonResult updateBatch(@RequestBody List<User> list) {
        // 不能修改的字段
        for (User user : list) {
            user.setPassword(null);
            user.setState(null);
            user.setUsername(null);
            user.setPhone(null);
            user.setEmail(null);
        }
        if (service.updateTemplateBatch(list)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 批量删除用户
     */
    @OperLog(value = "用户管理" , desc = "批量删除" , result = true)
    @ResponseBody
    @RequestMapping("/removeBatch")
    public JsonResult removeBatch(@RequestBody List<Long> ids) {
        if (service.deleteBatchById(ids)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 修改用户状态
     */
    @OperLog(value = "用户管理" , desc = "修改状态" , result = true)
    @ResponseBody
    @RequestMapping("/state/update")
    public JsonResult updateState(Integer id, Integer state) {
        if (state == null || (state != 0 && state != 1)) {
            return JsonResult.error("状态值不正确");
        }
        User user = new User();
        user.setUserId(id);
        user.setState(state);
        if (service.updateTemplate(user)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 批量修改用户状态
     */
    @OperLog(value = "用户管理" , desc = "批量修改状态" , result = true)
    @ResponseBody
    @RequestMapping("/state/updateBatch")
    public JsonResult updateStateBatch(@RequestBody List<User> list) {
//        User user = new User();
//        user.setState(batchParam.getData().getState());
//        if (user.getState() == null || (user.getState() != 0 && user.getState() != 1)) {
//            return JsonResult.error("状态值不正确");
//        }
//        if (batchParam.update(userService, "user_id")) {
//            return JsonResult.ok("修改成功");
//        }
        //TODO 这里要结合前端进行修改
        return JsonResult.error("修改失败");
    }

    /**
     * 重置密码
     */
    @OperLog(value = "用户管理" , desc = "重置密码" , param = false, result = true)
    @ResponseBody
    @RequestMapping("/psw/reset")
    public JsonResult resetPsw(Integer id, String password) {
        User user = new User();
        user.setUserId(id);
        user.setPassword(service.encodePsw(password));
        if (service.updateTemplate(user)) {
            return JsonResult.ok("重置成功");
        } else {
            return JsonResult.error("重置失败");
        }
    }

    /**
     * 批量重置密码
     */
    @OperLog(value = "用户管理" , desc = "批量重置密码" , param = false, result = true)
    @ResponseBody
    @RequestMapping("/psw/resetBatch")
    public JsonResult resetPswBatch(@RequestBody List<User> list) {
        for (User user : list) {
            user.setPassword(service.encodePsw(user.getPassword()));
        }
        if (service.updateTemplateBatch(list)) {
            return JsonResult.ok("重置成功");
        } else {
            return JsonResult.error("重置失败");
        }
    }

    /**
     * 修改自己密码
     */
    @OperLog(value = "用户管理" , desc = "修改自己密码" , param = false, result = true)
    @ResponseBody
    @RequestMapping("/psw/update")
    public JsonResult updatePsw(String oldPsw, String newPsw) {
        if (StrUtil.hasBlank(oldPsw, newPsw)) {
            return JsonResult.error("参数不能为空");
        }
        if (getLoginUserId() == null) {
            return JsonResult.error("未登录");
        }
        if (!service.comparePsw(service.queryById(getLoginUserId()).getPassword(), oldPsw)) {
            return JsonResult.error("原密码输入不正确");
        }
        User user = new User();
        user.setUserId(getLoginUserId());
        user.setPassword(service.encodePsw(newPsw));
        if (service.updateTemplate(user)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 修改自己资料
     */
    @OperLog(value = "用户管理" , desc = "修改个人信息" , param = false, result = true)
    @ResponseBody
    @RequestMapping("/info/update")
    public JsonResult updateInfo(User user) {
        user.setUserId(getLoginUserId());
        // 不能修改的字段
        user.setState(null);
        user.setPassword(null);
        user.setUsername(null);
        user.setOrganizationId(null);
        if (service.update(user)) {
            User loginUser = getLoginUser();
            if (user.getNickName() != null) loginUser.setNickName(user.getNickName());
            if (user.getAvatar() != null) loginUser.setAvatar(user.getAvatar());
            return JsonResult.ok("保存成功").setData(service.getFullById(user.getUserId()));
        }
        return JsonResult.error("保存失败");
    }

    /**
     * excel导入用户
     */
    @Transactional
    @OperLog(value = "用户管理" , desc = "excel导入" , param = false, result = true)
    @ResponseBody
    @RequestMapping("/import")
    public JsonResult importBatch(MultipartFile file) {
        StringBuilder sb = new StringBuilder();
        try {
            // 读取excel
            int startRow = 1;
            ExcelReader reader = ExcelUtil.getReader(file.getInputStream(), 0);
            List<List<Object>> list = reader.read(startRow);
            // 进行非空和重复检查
            sb.append(CoreUtil.excelCheckBlank(list, startRow, 0, 1, 2, 3, 4, 7));
            sb.append(CoreUtil.excelCheckRepeat(list, startRow, 0, 5, 6));
            if (!sb.toString().isEmpty()) return JsonResult.error(sb.toString());
            // 进行数据库层面检查
            List<User> users = new ArrayList<>();
            for (int i = 0; i < list.size(); i++) {
                List<Object> objects = list.get(i);
                String username = String.valueOf(objects.get(0));  // 账号
                String password = String.valueOf(objects.get(1));  // 密码
                String nickName = String.valueOf(objects.get(2));  // 用户名
                String sexName = String.valueOf(objects.get(3));  // 性别
                String roleName = String.valueOf(objects.get(4));  // 角色名
                String phone = String.valueOf(objects.get(5));  // 手机号
                String email = String.valueOf(objects.get(6));  // 邮箱
                String orgName = String.valueOf(objects.get(7));  // 组织机构
                long usernameCnt = service.lambdaQuery().andEq(User::getUsername, username).count();
                if (usernameCnt > 0) {
                    sb.append("第");
                    sb.append(i + startRow + 1);
                    sb.append("行第1");
                    sb.append("列账号已存在;\r\n");
                }
                long phoneCnt = service.lambdaQuery().andEq(User::getPhone, phone).count();
                if (StrUtil.isNotBlank(phone) && phoneCnt > 0) {
                    sb.append("第");
                    sb.append(i + startRow + 1);
                    sb.append("行第6");
                    sb.append("列手机号已存在;\r\n");
                }
                long emailCnt = service.lambdaQuery().andEq(User::getEmail, email).count();
                if (StrUtil.isNotBlank(email) && emailCnt > 0) {
                    sb.append("第");
                    sb.append(i + startRow + 1);
                    sb.append("行第7");
                    sb.append("列邮箱已存在;\r\n");
                }
                User user = new User();
                user.setUsername(username);
                user.setNickName(nickName);
                user.setPassword(service.encodePsw(password));
                user.setState(0);
                user.setPhone(phone);
                user.setEmail(email);
                DictionaryData sexDictData = dictionaryDataService.listByDictCodeAndName("sex" , sexName);
                if (sexDictData == null) {
                    sb.append("第");
                    sb.append(i + startRow + 1);
                    sb.append("行第4");
                    sb.append("列性别不存在;\r\n");
                } else {
                    user.setSex(sexDictData.getDictDataId());
                }
                Role role = roleService.lambdaQuery().andEq(Role::getRoleName, roleName).single();
                if (role == null) {
                    sb.append("第");
                    sb.append(i + startRow + 1);
                    sb.append("行第5");
                    sb.append("列角色不存在;\r\n");
                } else {
                    user.setRoleIds(Collections.singletonList(role.getRoleId()));
                }
                Organization org = organizationService.lambdaQuery().andEq(Organization::getOrganizationFullName, orgName).single();
                if (org == null) {
                    sb.append("第");
                    sb.append(i + startRow + 1);
                    sb.append("行第8");
                    sb.append("列机构不存在;\r\n");
                } else {
                    user.setOrganizationId(org.getOrganizationId());
                }
                users.add(user);
            }
            if (!sb.toString().isEmpty()) return JsonResult.error(sb.toString());
            // 开始添加用户
            int okNum = 0, errorNum = 0;
            for (User user : users) {
                if (service.saveUser(user)) okNum++;
                else errorNum++;
            }
            return JsonResult.ok("导入完成，成功" + okNum + "条，失败" + errorNum + "条");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return JsonResult.error("导入失败");
    }

}
