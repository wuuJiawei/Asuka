<div class="layui-form-item">
    <label class="layui-form-label">${label}</label>
    <div class="layui-input-block">
        <input name="${name}" placeholder="${label}地址" type="text" class="layui-input"
        <% if (required!true){ %> lay-verType="tips" lay-verify="required" required <% } %>/>
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label"></label>
    <div class="layui-input-block">
        <img class="layui-upload-img" id="img-${name}" src="${previewSrc!}" style="max-width:100px;max-height:100px;">
        <button type="button" class="layui-btn" id="upload-${name}">上传${label}</button>
    </div>
</div>
<script>
    layui.use(['upload', 'layer'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var upload = layui.upload;

        upload.render({
            elem: '#upload-${name}' //绑定元素
            ,url: '${ctxPath}/sys/upload' //上传接口
            ,accept: '${accept!'images'}'
            ,before: function(obj){
                obj.preview(function(index, file, result){
                    $('#img-${name}').attr('src', result);
                });
            }
            ,done: function(res){
                if(res.code !== 0){
                    return layer.msg('上传失败');
                }

                // SUCCESS
                $('input[name=${name}]').val(res.data.key);
            }
            ,error: function(){
                $('#img-${label}').attr('src', '');
                layer.msg('上传失败，请重新上传')
            }
        });

    });
</script>