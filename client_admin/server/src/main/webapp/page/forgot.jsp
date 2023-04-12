<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 密码找回/Retrieve password -->
<!DOCTYPE html>
<html lang="en" class="forgot">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <link rel="stylesheet" href="../css/diy.css">
</head>

<body>
  <article class="sign_in">
    <div class="warp warp-forgot">
      <div class="layui-container">
        <div class="layui-row">
          <div>
            <span>
              <h1>密码找回/Retrieve password</h1>
            </span>
          </div>
          <form class="layui-form" action="">
            <div class="layui-form-item">
              <label class="layui-form-label">用户名：</label>
              <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="用户名"
                  class="layui-input" id="username">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">找回方式</label>
              <div class="layui-input-block">
                <select name="interest" lay-filter="aihao">
                  <option value=""></option>
                  <option value="0">手机号</option>
                  <option value="1">邮箱</option>
                </select>
              </div>
            </div>
            <div id="phone" style="display: none;">
              <div class="layui-form-item">
                <label class="layui-form-label" id="lable">手机号</label>
                <div class="layui-input-block">
                  <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入手机号"
                    class="layui-input" id="phone">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">验证码</label>
                <div class="layui-input-block">
                  <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="验证码"
                    class="layui-input" id="codice1">
                  <button type="button" class="layui-btn layui-btn-normal" id="verificare1">发送验证码</button>
                </div>
              </div>
            </div>
            <div id="email" style="display: none;">
              <div class="layui-form-item">
                <label class="layui-form-label" id="lable">邮箱</label>
                <div class="layui-input-block">
                  <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入邮箱"
                    class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">验证码</label>
                <div class="layui-input-block">
                  <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="验证码"
                    class="layui-input" id="codice2">
                  <button type="button" class="layui-btn layui-btn-normal" id="verificare2">发送验证码</button>
                </div>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">新密码</label>
              <div class="layui-input-block">
                <input type="password" name="title" lay-verify="title" autocomplete="off" placeholder="新密码"
                  class="layui-input" id="password">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">确认密码</label>
              <div class="layui-input-block">
                <input type="password" name="title" lay-verify="title" autocomplete="off" placeholder="确认密码"
                  class="layui-input" id="confirmPasssword">
              </div>
            </div>
          </form>
          <div class="layui-btn-container">
            <button type="button" class="layui-btn layui-btn-normal" id="btn">确认/Confirm</button>
            <a type="button" class="layui-btn layui-btn-normal" href="../login.jsp">取消/Cancel</a>
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
  layui.use(['element', 'layer', 'util'], function () {
    var element = layui.element
      , layer = layui.layer
      , util = layui.util
      , table = layui.table
      , form = layui.form
      , $ = layui.$;

    let token = localStorage.getItem('token') || null
    //常规使用 - 普通图片上传

    let from = {
      email: "",
      phone: "",
    }
    let phone = document.querySelector('#phone')
    let lable = document.querySelector('#lable')
    let verificare1 = document.querySelector('#verificare1')
    let codice1 = document.querySelector('#codice1')
    let verificare2 = document.querySelector('#verificare2')
    let codice2 = document.querySelector('#codice2')
    let dataText
    // 下拉框的选择
    layui.form.on('select', function (data) {
      if (data.elem[data.elem.selectedIndex].text == '手机号') {
        phone.style.display = 'block'
        email.style.display = 'none'
      } else if (data.elem[data.elem.selectedIndex].text == '邮箱') {
        phone.style.display = 'none'
        email.style.display = 'block'
      } else {
        phone.style.display = 'none'
        email.style.display = 'none'
      }
      dataText = data.elem[data.elem.selectedIndex].text
    });

    verificare1.addEventListener('click', function () {
      let random = Math.floor(Math.random() * 9999);
      for (var i = random.length; i < 4; i++) {
        random = "0" + random;
      }
      let code = random.toString();
      codice1.value = code
      from['code'] = codice1.value
    })

    verificare2.addEventListener('click', function () {
      let random = Math.floor(Math.random() * 9999);
      for (var i = random.length; i < 4; i++) {
        random = "0" + random;
      }
      let code = random.toString();
      codice2.value = code
      from['code'] = codice2.value
    })

    // 获取数据
    let btn = document.querySelector('#btn')
    let username = document.querySelector('#username')
    let password = document.querySelector('#password')


    btn.addEventListener('click', async function () {
      if (username.value == '') {
        layer.msg('请输入用户名')
      } else if (password.value == '') {
        layer.msg('请输入密码')
      } else if (dataText == '手机号' && codice1.value == '') {
        layer.msg('请输入验证码')
      } else if (dataText == '邮箱' && codice2.value == '') {
        layer.msg('请输入验证码')
      } else if (confirmPasssword.value != password.value) {
        layer.msg('两次密码输入不一致')
      } else {
        if (dataText == '手机号') {
          code = codice1.value
        } else if (dataText == '邮箱') {
          code = codice2.value
        }
        from['code'] = code
        from['email'] = ''
        from['username'] = username.value
        from['password'] = password.value
        from['phone'] = ''

        /* let form2
        form2 = JSON.stringify(form)  */

        /* {
          code: code,
          email: '',
          username: username.value,
          password: password.value,
          phone: ''
        } */
        let { data: res } = await axios.post(BaseUrl+'/api/user/forget_password', from, {
          headers: {
            'x-auth-token': token,
            'Content-Type': 'application/json'
          }
        })
        if (res.result) {
          layer.msg('密码修改成功')
          setTimeout(function () {
            window.location.replace("../login.jsp");
          }, 1000)
        } else if (res.error.message) {
          layer.msg(res.error.message)
        }
      }
    })
  })



</script>

</html>
