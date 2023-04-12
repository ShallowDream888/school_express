<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 修改密码 -->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <title>Document</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <link rel="stylesheet" href="../css/diy.css">
</head>

<body>
  <article class="sign_in">
    <div class="warp change_password">
      <div class="layui-container">
        <div class="layui-row">
          <div>
            <span>
              <h1>修改密码</h1>
            </span>
          </div>
          <form class="layui-form" action="">
            <div class="layui-form-item">
              <label class="layui-form-label">原密码</label>
              <div class="layui-input-block">
                <input type="password" name="title" lay-verify="title" autocomplete="off" placeholder="请输入原密码"
                  class="layui-input" id="oldPassword">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">新密码</label>
              <div class="layui-input-block">
                <input type="password" name="title" lay-verify="title" autocomplete="off" placeholder="请输入新密码"
                  class="layui-input" id="newPassword1">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">请确认密码</label>
              <div class="layui-input-block">
                <input type="password" name="title" lay-verify="title" autocomplete="off" placeholder="请输入确认新密码"
                  class="layui-input" id="newPassword2">
              </div>
            </div>
          </form>
          <div class="layui-btn-container">
            <a type="button" class="layui-btn layui-btn-normal" id="tijao">确认/Confirm</a>
            <button type="button" class="layui-btn layui-btn-normal" id="cancel">取消/Cancel</button>
          </div>
        </div>
      </div>
    </div>
  </article>
</body>

<script src="../layui/layui.js" charset="utf-8"></script>
<script src="../js/axios.min.js" charset="utf-8"></script>
<script src="../js/base.js" charset="utf-8"></script>

<script>
  var BaseUrl = baseUrl()
  layui.use(['form', 'layedit', 'laydate'], function () {
    var form = layui.form
      , layer = layui.layer
      , layedit = layui.layedit
      , laydate = layui.laydate;

    let cancel = document.querySelector('#cancel')
    cancel.onclick = function () {
      window.history.back(-1)
    }


    let personInfo = JSON.parse(sessionStorage.personInfo)
    // 拿到本地存储的token
    let token = sessionStorage.token
    let tijao = document.querySelector('#tijao')
    let oldPassword = document.querySelector('#oldPassword')
    let newPassword1 = document.querySelector('#newPassword1')
    let newPassword2 = document.querySelector('#newPassword2')

    tijao.addEventListener('click', async function () {
      if (newPassword1.value !== newPassword2.value) {
        layer.msg('密码不一致')
      } else {
        let { data: res } = await axios.post(BaseUrl+'/api/user/change_password', {
          o_password: oldPassword.value,
          password: newPassword1.value,
          username: personInfo.username,
        }, {
          headers: {
            'x-auth-token': token,
            'Content-Type': 'application/json'
          }
        })
        if (res.result) {
          layer.msg('密码修改成功')
          top.location.href = '../login.jsp';
          sessionStorage.clear()
        } else {
          layer.msg(res.error.message)
        }
      }
    })
  });

</script>

</html>
