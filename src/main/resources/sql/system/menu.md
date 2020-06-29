listByUserId
===
* 查询用户的菜单
    SELECT DISTINCT b.*
    FROM sys_role_menu a
    LEFT JOIN sys_menu b ON a.menu_id = b.menu_id
    LEFT JOIN sys_role c ON a.role_id = c.role_id
    WHERE a.role_id IN ( SELECT role_id FROM sys_user_role WHERE user_id=#{userId} )
    AND b.deleted = 0 AND c.deleted=0
    @if(!isEmpty(menuType)){
    AND b.menu_type=#menuType
    @}
    ORDER BY b.sort_number