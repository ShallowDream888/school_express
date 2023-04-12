<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 公告栏详情/Details -->
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
    <div class="warp notice">
      <div class="layui-container">
        <div class="layui-row">
          <form class="layui-form" action="">
            <div class="layui-form-item">
              <label class="layui-form-label">标题</label>
              <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                  class="layui-input" id="title">
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
            <button type="button" class="layui-btn layui-btn-normal" id="submit">确认/Confirm</button>
            <button type="button" class="layui-btn layui-btn-normal" id="cancel">取消/Cancel</button>
          </div>
        </div>
      </div>
    </div>
  </article>
</body>

<script src="../../js/index.js" charset="utf-8"></script>
<script src="../../layui/layui.js" charset="utf-8"></script>
<script src="../../js/base.js" charset="utf-8"></script>

<script>
  var BaseUrl = baseUrl()
  layui.use('layedit', function () {
    var layedit = layui.layedit;

    layui.layedit.set({
      uploadImage: {
        url: BaseUrl + '/api/notice/upload?' //接口url
        , type: 'post' //默认post
      }
    });
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
    let value = location.search.substring(1)
    let img
    async function fff() {
      const { data: rese } = await axios.get(BaseUrl + '/api/notice/get_obj', {
        params: {
          notice_id: value
        }
      })
      img = rese.result.obj
      if (rese) {
        title.value = img.title
        layedit.setContent(demo, img.content)
      }

    }
    fff()
    cancel.onclick = function () {
      window.location.replace("./table.jsp")
    }

    // 拿到本地存储的token
    let token = sessionStorage.token

    submit.onclick = async function () {
      let { data: res } = await axios.post(BaseUrl + '/api/notice/set?notice_id=' + value, {
        content: layedit.getContent(demo),
        notice_id: value,
        title: title.value
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
