listByUserIds
===
        SELECT a.user_id, b.* FROM sys_user_role a
        LEFT JOIN sys_role b ON a.role_id=b.role_id
        WHERE a.user_id IN
        #join(userIds)#
        AND b.deleted=0


listByUserId
===
        SELECT * FROM sys_role
        WHERE role_id IN (SELECT role_id FROM sys_user_role WHERE user_id=#userId#) AND deleted=0
