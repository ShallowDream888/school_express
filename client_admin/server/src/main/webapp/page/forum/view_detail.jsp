<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 论坛列表详情/Details -->
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
                        <label class="layui-form-label">昵称</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入昵称"
                                   class="layui-input" id="nickname">
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
                            <select name="interest" lay-filter="type" id="type">
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
<script src="../../js/index.js"></script>
<script src="../../js/base.js" charset="utf-8"></script>

<script>
    var BaseUrl = baseUrl()
    layui.use(['upload', 'element', 'layer', 'layedit'], async function () {
        var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , form = layui.from
            , layer = layui.layer
            , layedit = layui.layedit
            , $ = layui.$;

        let token = sessionStorage.token || null
        let set_data = {}

        layui.layedit.set({
            uploadImage: {
                url: BaseUrl + '/api/forum/upload?' //接口url
                , type: 'post' //默认post
            }
        });

        let url
        var uploadInst = upload.render({
            elem: '#test1'
            , url: BaseUrl + '/api/forum/upload?' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
            , headers: {
                'x-auth-token': token
            }, before: function (obj) {
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
                url = res.result.url
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

        init(BaseUrl + '/api/forum_type/get_list', 'type')


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
        // 拿到传递过来的值
        var forum_id = window.location.href.split("?")[1]
        console.log(forum_id)

        // 发起请求获取数据
        let {data: res} = await axios.get(BaseUrl + '/api/forum/get_obj', {
            params: {
                forum_id: forum_id
            }, headers: {
                'x-auth-token': token,
                'Content-Type': 'application/json'
            }
        })

        let request = res.result.obj
        // 数据的渲染

        set_data['type'] = request.type

        let demo1 = document.querySelector('#demo1')
        demo1.src = fullUrl(BaseUrl, request.img)

        let nickname = document.querySelector('#nickname')
        nickname.value = request.nickname

        let title = document.querySelector('#title')
        title.value = request.title

        let tag = document.querySelector('#tag')
        tag.value = request.tag

        let type = document.querySelector('#type').querySelectorAll('option')
        for (let i = 0; i < type.length; i++) {
            if (type[i].innerHTML == request.type) {
                type[i].selected = true
                layui.use('form', function () {
                    var form = layui.form;
                    form.render("select");
                });
            }
        }

        layui.form.on('select(type)', function (data) {
            set_data.type = data.elem[data.elem.selectedIndex].text
        });

        layedit.setContent(demo, request.content)

        let submit = document.querySelector('#submit')
        submit.addEventListener('click', async function () {
            set_data['avatar'] = ""
            set_data['content'] = layedit.getContent(demo)
            set_data['description'] = request.description
            set_data['display'] = request.display
            set_data['forum_id'] = forum_id
            set_data['hits'] = request.hits
            set_data['img'] = url
            set_data['keywords'] = request.keywords
            set_data['nickname'] = nickname.value
            set_data['tag'] = tag.value
            set_data['title'] = title.value
            set_data['url'] = request.url
            set_data['user_id'] = request.user_id

            console.log(set_data);
            const {data: res} = await axios.post(BaseUrl + '/api/forum/set?forum_id=' + forum_id, set_data, {
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
        });
    });
</script>

<style>
    img {
        width: 178px;
        height: 178px;
    }
</style>

</html>
