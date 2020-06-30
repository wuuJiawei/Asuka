package com.asuka.common.web;

import cn.hutool.core.util.StrUtil;
import org.beetl.sql.core.engine.PageQuery;
import org.beetl.sql.core.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 查询解析器
 *
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/6/29
 */
public class BaseQueryController<Entity, Service extends BaseService> extends BaseConsoleController {

    @Autowired
    protected Service service;

    /**
     * 标识多个字段查询
     */
    public static final String KEY_MULTI_COLUMN = "|";

    /**
     * 标识分割的关键字
     */
    public static final String KEY_SPLIT = "@";

    /**
     * 标识搜索字段的关键字
     */
    public static final String KEY_SEARCH = "search";
    public static final String KEY_SEARCH_LIKE = "like";
    public static final String KEY_SEARCH_LIKE_FUZZY = "%";
    public static final String KEY_SEARCH_EQ = "eq";
    public static final String KEY_SEARCH_BETWEEN = "between";
    public static final String KEY_SEARCH_BETWEEN_SPLIT = " - ";
    public static final String KEY_SEARCH_LT = "lt";
    public static final String KEY_SEARCH_GT = "gt";

    /**
     * 分页与排序参数
     */
    private static final String FILED_PAGE = "page";  // 第几页参数名称
    private static final String FILED_LIMIT = "limit";  // 每页显示数量参数名称
    private static final String FILED_SORT = "sort";  // 排序字段参数名称
    private static final String FILED_ORDER = "order";  // 排序方式参数名称
    private static final String VALUE_ORDER_ASC = "asc";  // 表示升序的值
    private static final String VALUE_ORDER_DESC = "desc";  // 表示降序的值
    public static final String VALUE_SORT_DEFAULT = "create_time";  // 默认的排序字段

    /**
     * 初始化分页查询
     * 从请求中获取分页参数，并解析查询参数，按约定格式进行查询
     *
     * @param request
     * @return
     */
    public PageQuery<Entity> createPageQuery(HttpServletRequest request) {
        String pageNo = request.getParameter(FILED_PAGE);
        String pageSize = request.getParameter(FILED_LIMIT);
        return createPageQuery(
                StringUtils.isEmpty(pageNo) ? 1 : Integer.parseInt(pageNo),
                StringUtils.isEmpty(pageSize) ? 20 : Integer.parseInt(pageSize),
                request);
    }

    /**
     * 初始化分页查询
     * 从请求中直接解析参数，按格式进行查询
     *
     * @param pageNo
     * @param pageSize
     * @param request
     * @return
     */
    public PageQuery<Entity> createPageQuery(Integer pageNo, Integer pageSize, HttpServletRequest request) {
        return createPageQuery(pageNo, pageSize, request.getParameterMap());
    }

    /**
     * 初始化分页查询
     *
     * @param pageNo
     * @param pageSize
     * @param parameterMap
     * @return
     */
    public PageQuery<Entity> createPageQuery(Integer pageNo, Integer pageSize, Map<String, String[]> parameterMap) {
        return createQuery(parameterMap).page(pageNo, pageSize);
    }

    /**
     * 创建Query
     *
     * @param request
     * @return
     */
    public Query<Entity> createQuery(HttpServletRequest request) {
        return createQuery(request.getParameterMap());
    }

    /**
     * 创建Query
     *
     * @param parameterMap
     * @return
     */
    public Query<Entity> createQuery(Map<String, String[]> parameterMap) {
        Query<Entity> query = service.query();

        // 查询条件
        newQuery(query, parameterMap);

        // 排序
        String orderByColumn = getParam(parameterMap, FILED_SORT, (String) service.pk());
        String isAsc =  getParam(parameterMap, FILED_ORDER, VALUE_ORDER_DESC);
        String orderBy;
        if (StrUtil.isNotEmpty(orderByColumn)) {
            orderBy = StrUtil.toUnderlineCase(orderByColumn) + " " + isAsc;
        } else {
            orderBy = VALUE_SORT_DEFAULT + " " + VALUE_ORDER_DESC;
        }
        query.orderBy(orderBy);

        return query;
    }

    private String getParam(Map<String, String[]> parameterMap, String filedKey, String defaultValue) {
        String[] v = parameterMap.get(filedKey);
        if (v != null && v.length > 0) {
            return v[0];
        } else {
            return defaultValue;
        }
    }

    /**
     * 按约定获取request的查询参数，组合成Query
     * 约定的查询参数key格式：search@[type]@[column]，
     * [type]：（查询的方式），like/eq/lt/gt/between
     * [column]：（数据库中的字段名称）；支持多个字段，字段名称使用[|]分割；当type为between时，字段对应的值使用[-]分割
     * 示例：search@like@user_name
     * 示例：search@like@user_name|phone|nick_name
     * 示例：search@between@time, 值为2000-01-01 - 2000-01-31
     *
     * @return
     */
    private void newQuery(Query<Entity> query, Map<String, String[]> parameterMap) {
        // 遍历查询条件
        for (String key : parameterMap.keySet()) {
            // 校验是否查询关键字
            if (!key.startsWith(KEY_SEARCH + KEY_SPLIT)) {
                continue;
            }

            // 获取查询的值
            String searchColumnValue = parameterMap.get(key)[0];

            // 拦截空字符串
            if (StringUtils.isEmpty(searchColumnValue)) {
                continue;
            }

            // 获取查询方式和字段
            String[] searchKeyArr = key.split(KEY_SPLIT);
            String searchType = searchKeyArr[1],
                    searchColumnName = searchKeyArr[2];

            // 多个Column的查询
            if (searchColumnName.contains(KEY_MULTI_COLUMN)) {
                String[] multiArr = searchColumnName.split(KEY_MULTI_COLUMN);
                for (String multiColumnName : multiArr) {
                    query.and(query.or(fixSingleQuery(multiColumnName, searchColumnValue, searchType, query.condition())));
                }
            }
            // 单个Column的查询
            else {
                fixSingleQuery(searchColumnName, searchColumnValue, searchType, query);
            }
        }
    }

    /**
     * 补全单个Query
     *
     * @param columnName
     * @param columnValue
     * @param searchType
     * @param query
     * @return
     */
    private Query<Entity> fixSingleQuery(String columnName, String columnValue, String searchType, Query<Entity> query) {
        // 驼峰转下划线 TODO 从sqlManager中获取namespace
        columnName = StrUtil.toUnderlineCase(columnName);

        switch (searchType) {
            case KEY_SEARCH_EQ:
                query.andEq(columnName, columnValue);
                break;
            case KEY_SEARCH_LIKE:
                query.andLike(columnName, KEY_SEARCH_LIKE_FUZZY + columnValue + KEY_SEARCH_LIKE_FUZZY);
                break;
            case KEY_SEARCH_LT:
                query.andLessEq(columnName, columnValue);
                break;
            case KEY_SEARCH_GT:
                query.andGreatEq(columnName, columnValue);
                break;
            case KEY_SEARCH_BETWEEN:
                String[] v = columnValue.split(KEY_SEARCH_BETWEEN_SPLIT);
                query.andBetween(columnName, v[0], v[1]);
                break;
            default:
                break;
        }
        return query;
    }


}
