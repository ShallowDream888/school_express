<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 论他把列表新增/Add -->
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
    <div class="warp forum">
        <div class="layui-container">
            <div class="layui-row">
                <form class="layui-form" action="">
                    <div class="layui-upload">
                        <button type="button" class="layui-btn" id="test1">上传图片</button>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="demo1">
                            <p id="demoText"></p>
                        </div>
                        <div style="width: 95px;">
                            <div class="layui-progress layui-progress-big" lay-showpercent="yes" lay-filter="demo">
                                <div class="layui-progress-bar" lay-percent=""></div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入标题"
                                   class="layui-input" id="title">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">昵称</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入昵称"
                                   class="layui-input" id="nickname">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">标签</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入标签"
                                   class="layui-input" id="tag">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">分类</label>
                        <div class="layui-input-block">
                            <select name="interest" lay-filter="classifys" id="classifys">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">正文</label>
                        <div class="layui-input-block">
                            <textarea id="demo" style="display: none;"></textarea>
                        </div>
                    </div>
                </form>
                <div class="layui-btn-container">
                    <a href="#" type="button" class="layui-btn layui-btn-normal login" id="submit">确认</a>
                    <a href="./table.jsp" target="main_self_frame" type="button"
                       class="layui-btn layui-btn-normal login">取消</a>
                </div>
            </div>
        </div>
    </div>
</article>
</body>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script src="../../js/axios.min.js" charset="utf-8"></script>
<script src="../../js/index.js"></script>
<script src="../../js/base.js" charset="utf-8"></script>

<script>
    var BaseUrl = baseUrl()
    layui.use(['upload', 'element', 'layer'], function () {
        var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , $ = layui.$;
        // 拿到本地存储的token
        layui.layedit.set({
            uploadImage: {
                url: BaseUrl + '/api/forum/upload' //接口url
                , type: 'post' //默认post
            }
        });
        let token = sessionStorage.token || null

        let from = {
            avatar: "",
            description: "",
            display: 0,
            forum_id: 0,
            hits: 0,
            keywords: "",
            url: "",
            user_id: 1
        }

        if (sessionStorage.personInfo) {
            let personInfo = JSON.parse(sessionStorage.personInfo)
            from.user_id = personInfo.user_id
        }

        var uploadInst = upload.render({
            elem: '#test1'
            , url: BaseUrl + '/api/forum/upload'
            , headers: {
                'x-auth-token': token
            }//此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', fullUrl(BaseUrl, result)); //图片链接（base64）
                });

                element.progress('demo', '0%'); //进度条复位
                layer.msg('上传中', {icon: 16, time: 0});
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功的一些操作
                //……
                from['img'] = res.result.url
                $('#demoText').html(''); //置空上传失败的状态
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
            //进度条
            , progress: function (n, elem, e) {
                element.progress('demo', n + '%'); //可配合 layui 进度条元素使用
                if (n == 100) {
                    layer.msg('上传完毕', {icon: 1});
                }
            }
        });
        var layedit = layui.layedit
            , form = layui.form;
        var demo = layedit.build('demo', {
            tool: [
                'strong' //加粗
                , 'italic' //斜体
                , 'underline' //下划线
                , 'del' //删除/Del线

                , '|' //分割线

                , 'left' //左对齐
                , 'center' //居中对齐
                , 'right' //右对齐
                , 'link' //超链接
                , 'unlink' //清除链接
                , 'face' //表情
                , 'image' //插入图片
                , 'help' //帮助
            ]
        });

        form.on('select(classifys)', function (data) {
            from['type'] = data.elem[data.elem.selectedIndex].text; //得到文本内容
        });
        init(BaseUrl + '/api/forum_type/get_list', 'classifys')

        let nickname = document.querySelector('#nickname')
        let tag = document.querySelector('#tag')
        let title = document.querySelector('#title')
        let submit = document.querySelector('#submit')
        submit.onclick = async function () {
            if (title.value == '') {
                layer.msg('标题不能为空')
            } else if (nickname.value == '') {
                layer.msg('昵称不能为空')
            } else {
                from['nickname'] = nickname.value
                from['tag'] = tag.value
                from['title'] = title.value
                from['content'] = layedit.getContent(demo)
                let {data: res} = await axios.post(BaseUrl + '/api/forum/add', from, {
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
                } else if (res.error.massage) {
                    layer.msg(res.error.massage)
                }
            }
        }

    });
</script>

</html>
