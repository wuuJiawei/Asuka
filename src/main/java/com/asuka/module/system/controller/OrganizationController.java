package com.asuka.module.system.controller;

import com.alibaba.fastjson.JSON;
import com.asuka.common.Constants;
import com.asuka.common.annotation.OperLog;
import com.asuka.common.web.BaseQueryController;
import com.asuka.common.web.JsonResult;
import com.asuka.common.web.PageResult;
import com.asuka.module.system.entity.Organization;
import com.asuka.module.system.service.DictionaryDataService;
import com.asuka.module.system.service.OrganizationService;
import com.asuka.module.system.service.RoleService;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 组织机构管理
 * Created by AutoGenerator on 2020-03-14 11:29:04
 */
@Controller
@RequestMapping("/sys/organization")
public class OrganizationController extends BaseQueryController<Organization, OrganizationService> {

    @Autowired
    private DictionaryDataService dictionaryDataService;
    @Autowired
    private RoleService roleService;

    @RequestMapping()
    public String view(Model model) {
        model.addAttribute("sexList", dictionaryDataService.listByDictCode("sex"));
        model.addAttribute("organizationTypeList", dictionaryDataService.listByDictCode("organization_type"));
        model.addAttribute("rolesJson", JSON.toJSONString(roleService.dao().all()));
        return "system/organization.html";
    }

    /**
     * 分页查询组织机构
     */
    @OperLog(value = "机构管理", desc = "分页查询")
    @ResponseBody
    @RequestMapping("/page")
    public PageResult<Organization> page(HttpServletRequest request) {
        PageQuery<Organization> query = createPageQuery(request);
        return new PageResult<Organization>(query.getList(), query.getTotalRow());
    }

    /**
     * 查询全部组织机构
     */
    @OperLog(value = "机构管理", desc = "查询全部")
    @ResponseBody
    @RequestMapping("/list")
    public JsonResult list(HttpServletRequest request) {
        Query<Organization> query = createQuery(request);
        List<Organization> records = service.queryAll(query);
        return JsonResult.ok().setData(records);
    }

    /**
     * 根据id查询组织机构
     */
    @OperLog(value = "机构管理", desc = "根据id查询")
    @ResponseBody
    @RequestMapping("/get")
    public JsonResult get(Integer id) {
        return JsonResult.ok().setData(service.queryById(id));
    }

    /**
     * 添加组织机构
     */
    @OperLog(value = "机构管理", desc = "添加", param = false, result = true)
    @ResponseBody
    @RequestMapping("/save")
    public JsonResult add(Organization organization) {
        if (organization.getParentId() == null) {
            organization.setParentId(0);
        }
        long nameCnt = service.lambdaQuery()
                .andEq(Organization::getOrganizationName, organization.getOrganizationName())
                .andEq(Organization::getParentId, organization.getParentId())
                .count();
        if (nameCnt > 0) {
            return JsonResult.error("机构名称已存在");
        }
        organization.setCreateTime(new Date());
        organization.setDeleted(Constants.NO);
        if (service.save(organization)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 修改组织机构
     */
    @OperLog(value = "机构管理", desc = "修改", param = false, result = true)
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(Organization organization) {
        if (organization.getOrganizationName() != null) {
            if (organization.getParentId() == null) {
                organization.setParentId(0);
            }
            long nameCnt = service.lambdaQuery()
                    .andEq(Organization::getOrganizationName, organization.getOrganizationName())
                    .andEq(Organization::getParentId, organization.getParentId())
                    .andNotEq(Organization::getOrganizationId, organization.getOrganizationId())
                    .count();
            if (nameCnt > 0) {
                return JsonResult.error("机构名称已存在");
            }
        }
        if (service.updateTemplate(organization)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 删除组织机构
     */
    @OperLog(value = "机构管理", desc = "删除", result = true)
    @ResponseBody
    @RequestMapping("/remove")
    public JsonResult remove(Integer id) {
        if (service.deleteById(id)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

    /**
     * 批量添加组织机构
     */
    @OperLog(value = "机构管理", desc = "批量添加", param = false, result = true)
    @ResponseBody
    @RequestMapping("/saveBatch")
    public JsonResult saveBatch(@RequestBody List<Organization> organizationList) {
        if (service.saveBatch(organizationList)) {
            return JsonResult.ok("添加成功");
        }
        return JsonResult.error("添加失败");
    }

    /**
     * 批量修改组织机构
     */
    @OperLog(value = "机构管理", desc = "批量修改", result = true)
    @ResponseBody
    @RequestMapping("/updateBatch")
    public JsonResult updateBatch(@RequestBody List<Organization> list) {
        if (service.updateTemplateBatch(list)) {
            return JsonResult.ok("修改成功");
        }
        return JsonResult.error("修改失败");
    }

    /**
     * 批量删除组织机构
     */
    @OperLog(value = "机构管理", desc = "批量删除", result = true)
    @ResponseBody
    @RequestMapping("/removeBatch")
    public JsonResult removeBatch(@RequestBody List<Long> ids) {
        if (service.deleteBatchById(ids)) {
            return JsonResult.ok("删除成功");
        }
        return JsonResult.error("删除失败");
    }

}
