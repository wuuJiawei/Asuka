<%
if(!has(range)){
    range = false;
} else if (range != 'false') {
    range = "' - '";
}

var inFormTmp = inForm!'false' == 'true';

%>


<%if(inFormTmp){%>
<div class="layui-form-item">
    <label class="layui-form-label <%if(required!'false' == 'true'){%>layui-form-required<%}%>">${label!}:</label>
    <div class="layui-input-block">
<%}%>
        <input type="text" name="${name}" id="date-${name}" class="layui-input"
            placeholder="请选择${label!}"
             style="${style!}"
            <%if(required!'false' == 'true'){%> lay-verType="tips" lay-verify="required" required <%}%>
        />
<%if(inFormTmp){%>
    </div>
</div>
<%}%>
<script>
    layui.use(['layer', 'laydate'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var laydate = layui.laydate;

        laydate.render({
            elem: '#date-${name}',
            type: '${type!'date'}',
            range: ${range},
        });

    });
</script>

