<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 新闻分类详情/Details -->
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
    <div class="warp article_type">
      <div class="layui-container">
        <div class="layui-row">
          <form class="layui-form" action="">
            <div class="layui-form-item">
              <label class="layui-form-label">类型名称</label>
              <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入用户名"
                  class="layui-input" id="orgName">
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

<script src="../../layui/layui.js"></script>
<script src="../../js/base.js" charset="utf-8"></script>

<script>
  var BaseUrl = baseUrl()
  layui.use(['upload', 'element', 'layer'], async function () {
    var $ = layui.jquery
      , upload = layui.upload
      , element = layui.element
      , layer = layui.layer;

    let token = localStorage.getItem('token') || null

    let orgName = document.querySelector('#orgName')
    let demo1 = document.querySelector('#demo1')
    let cancel = document.querySelector('#cancel')
    let submit = document.querySelector('#submit')


    let value = location.search.substring(1)
    let img

    const { data: rese } = await axios.get(BaseUrl+'/api/article_type/get_obj', {
      params: {
        type_id: value
      }
    })
    img = rese.result.obj
    if (rese) {
      orgName.value = img.name
    }

    let set_data = {
      father_id
        :
        0,
      description
        :
        ""
    }
    submit.addEventListener('click', async function () {
      set_data['name'] = orgName.value
      set_data['url'] = img.url
      set_data['type_id'] = value
      set_data['icon'] = img.icon

      const { data: res } = await axios.post(BaseUrl+'/api/article_type/set?type_id=' + value, set_data, {
        headers: {
          'x-auth-token': token,
          'Content-Type': 'application/json'
        }
      })
      if (res.result == 1) {
        layer.msg('确认/Confirm成功');
        setTimeout(function () { window.location.replace("./table.jsp"); }, 1000)
      }
    })
    cancel.onclick = function () {
      window.location = ('./table.jsp')
    }
  })
</script>

<style>
</style>

</html>
