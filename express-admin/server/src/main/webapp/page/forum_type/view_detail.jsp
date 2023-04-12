<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 论坛分类列表详情/Details -->
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
                                   class="layui-input" id="name">
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
<script src="../../layui/layui.js"></script>
<script src="../../js/axios.min.js" charset="utf-8"></script>
<script src="../../js/base.js" charset="utf-8"></script>

<script>
    var BaseUrl = baseUrl()
    layui.use(['upload', 'element', 'layer'], async function () {
        var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , form = layui.from
            , layer = layui.layer
            , $ = layui.$;

        let token = sessionStorage.token || null

        // 拿到传递过来的值
        var type_id = window.location.href.split("?")[1]

        let set_data = {
            icon: ''
        }
        // 发起请求获取数据
        let {data: res} = await axios.get(BaseUrl + '/api/forum_type/get_obj', {
            params: {
                type_id: type_id
            }
        })

        let request = res.result.obj
        console.log(request)

        let name = document.querySelector('#name')
        name.value = request.name
        let description = document.querySelector('#description')
        description.innerHTML = request.description

        let submit = document.querySelector('#submit')
        submit.addEventListener('click', async function () {
            set_data['description'] = description.value
            set_data['name'] = name.value
            set_data['url'] = request.url
            set_data['type_id'] = request.type_id
            set_data['father_id'] = request.father_id

            const {data: res} = await axios.post(BaseUrl + '/api/forum_type/set?type_id=' + type_id, set_data, {
                headers: {
                    'x-auth-token': token,
                    'Content-Type': 'application/json'
                }
            })
            if (res.result == 1) {
                layer.msg('确认/Confirm成功')
                setTimeout(function () {
                    window.location.replace("./table.jsp");
                }, 1000)
            }
        })
    });
</script>

</html>
