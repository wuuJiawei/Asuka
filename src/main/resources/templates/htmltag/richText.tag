<script type="text/javascript" src="${ctxPath}/assets/libs/tinymce/tinymce.min.js"></script>
<%if(inForm == 'true'){%>
<div class="layui-form-item">
    <label class="layui-form-label <%if(required == 'true'){%>layui-form-required<%}%>">${label!}:</label>
    <div class="layui-input-block">
<%}%>
        <textarea id="${id!}"></textarea>
<%if(inForm == 'true'){%>
    </div>
</div>
<%}%>
<script>
layui.use(['layer'], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    tinymce.init({
        selector: '#${id}',
        height: 480,
        branding: false,
        language: 'zh_CN',
        plugins: 'code print preview fullscreen paste searchreplace save autosave link autolink image imagetools media table codesample lists advlist hr charmap emoticons anchor directionality pagebreak quickbars nonbreaking visualblocks visualchars wordcount',
        toolbar: 'fullscreen preview code | undo redo | forecolor backcolor | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | outdent indent | numlist bullist | formatselect fontselect fontsizeselect | link image media emoticons charmap anchor pagebreak codesample | ltr rtl',
        toolbar_drawer: 'sliding',
        images_upload_url: '${ctxPath}/sys/upload',
        file_picker_types: '${accept!'media'}',
        file_picker_callback: function (callback, value, meta) {

        }
    });
});
</script>

