<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 新闻分类新增/Add -->
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
    <div class="warp article_type">
      <div class="layui-container">
        <div class="layui-row">
          <form class="layui-form" action="">
            <div class="layui-form-item">
              <label class="layui-form-label">类型名称</label>
              <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入类型名称"
                  class="layui-input" id="typeName">
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
    let submit = document.querySelector('#submit')
    submit.onclick = async function () {
      let { data: res } = await axios.post(BaseUrl + '/api/article_type/add', {
        description: "",
        father_id: 0,
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
