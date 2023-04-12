<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 测试新闻新增/Add -->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="../../layui/css/layui.css">
  <link rel="stylesheet" href="../../css/diy.css">
  <script src="../../js/axios.min.js" charset="utf-8"></script>


</head>

<body>
  <article class="sign_in">
    <div class="warp article">
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
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                  class="layui-input" id="title">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">标签</label>
              <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标签"
                  class="layui-input" id="tag">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">分类</label>
              <div class="layui-input-block">
                <select name="interest" lay-filter="aihao" id="select">
                  <option value=""></option>
                </select>
              </div>
            </div>
            <div class="layui-form-item layui-form-text">
              <label class="layui-form-label">描述</label>
              <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" id="description"></textarea>
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
<script src="../../js/index.js"></script>
<script src="../../js/base.js" charset="utf-8"></script>

<script>
  var BaseUrl = baseUrl()
  layui.use(['upload', 'element', 'layer', 'layedit'], function () {
    var $ = layui.jquery
      , upload = layui.upload
      , element = layui.element
      , form = layui.from
      , layer = layui.layer
      , $ = layui.$;

    let token = localStorage.getItem('token') || null
    layui.layedit.set({
      uploadImage: {
        url: BaseUrl + '/api/article/upload?' //接口url
        , type: 'post' //默认post
      }
    });

    var demo = layui.layedit.build('demo', {
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

    let submit = document.querySelector('#submit')
    let title = document.querySelector('#title')
    let tag = document.querySelector('#tag')
    let description = document.querySelector('#description')

    let url
    let from = {
      img: '',
      source: "",
      hits: 0,
      article_id: 0
    }
    var uploadInst = upload.render({
      elem: '#test1'
      , url: BaseUrl + '/api/article/upload?' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
      , headers: {
        'x-auth-token': token
      }, before: function (obj) {
        //预读本地文件示例，不支持ie8
        obj.preview(function (index, file, result) {
          $('#demo1').attr('src', fullUrl(BaseUrl,result)); //图片链接（base64）
        });

        element.progress('demo', '0%'); //进度条复位
        layer.msg('上传中', { icon: 16, time: 0 });
      }
      , done: function (res) {
        //如果上传失败
        if (res.code > 0) {
          return layer.msg('上传失败');
        }
        //上传成功的一些操作
        //……
        from.img = res.result.url
        console.log(from)
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
          layer.msg('上传完毕', { icon: 1 });
        }
      }
    });

    init(BaseUrl + '/api/article_type/get_list', "select")

    submit.onclick = async function () {
      from['title'] = title.value
      from['tag'] = tag.value
      from['description'] = description.value
      from['content'] = layui.layedit.getContent(demo)
      let token = localStorage.getItem('token') || null

      const { data: res } = await axios.post(BaseUrl + '/api/article/add?', from, {
        headers: {
          'x-auth-token': token,
          'Content-Type': 'application/json'
        }
      })
      if (res.result == 1) {
        layer.msg('确认/Confirm完毕');
        setTimeout(function () { window.location.replace("./table.jsp"); }, 1000)
      }
    }

    // 单选框点击事件
    layui.form.on('select', function (data) {
      from['type'] = data.elem[data.elem.selectedIndex].text;
    })
  });
</script>

</html>
