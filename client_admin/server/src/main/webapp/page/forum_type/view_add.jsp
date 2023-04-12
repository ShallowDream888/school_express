<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 论坛分类列表新增/Add -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/diy.css">
</head>

<body>
<article class="sign_in">
    <div class="warp forum_type">
        <div class="layui-container">
            <div class="layui-row">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入类型名称"
                                   class="layui-input" id="typeName">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">描述</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" class="layui-textarea" id="description"></textarea>
                        </div>
                    </div>
                </form>
                <div class="layui-btn-container">
                    <a href="#" type="button" class="layui-btn layui-btn-normal login" id="submit">确认/Confirm</a>
                    <a href="./table.jsp" target="main_self_frame" type="button"
                       class="layui-btn layui-btn-normal login">取消/Cancel</a>
                </div>
            </div>
        </div>
    </div>
</article>
</body>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script src="../../js/axios.min.js" charset="utf-8"></script>
<script src="../../js/base.js" charset="utf-8"></script>

<script>
    var BaseUrl = baseUrl()
    layui.use(['upload', 'element', 'layer'], function () {
        var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , form = layui.from
            , layer = layui.layer
            , $ = layui.$;
        // 拿到本地存储的token
        let token = sessionStorage.token

        let typeName = document.querySelector('#typeName')
        let description = document.querySelector('#description')
        let submit = document.querySelector('#submit')
        submit.onclick = async function () {
            let {data: res} = await axios.post(BaseUrl + '/api/forum_type/add', {
                description: description.value,
                father_id: "0",
                icon: "",
                name: typeName.value,
                type_id: 0,
                url: "",
            }, {
                headers: {
                    'x-auth-token': token,
                    'Content-Type': 'application/json'
                }
            })
            if (res.result == 1) {
                layer.msg('新增成功')
                setTimeout(function () {
                    window.location.replace("./table.jsp");
                }, 1000)
            }
        }
    });
</script>

</html>
