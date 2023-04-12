<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 个人信息 -->
<!DOCTYPE html>
<html lang="en">

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
  <div class="warp userInfo">
    <div class="layui-container">
      <div class="layui-row">
        <div>
            <span>
              <h1>个人信息</h1>
            </span>
        </div>
        <form class="layui-form" action="">
          <!-- 上传图片开始 -->
          <div class="layui-form-item">
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
            <div style="margin-top: 10px;"></div>
          </div>
          <!-- 上传图片结束 -->
          <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
              <span id="username"></span>
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
              <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="" class="layui-input"
                     id="nickname">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">用户组</label>
            <div class="layui-input-block">
              <span id="userGroups">管理员</span>
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
              <input type="text" name="title" lay-verify="title" autocomplete="off"
                     placeholder="用户的手机号码，用于找回密码时或登录/Login时" class="layui-input" id="number">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
              <span id="state"></span>
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
              <input type="text" name="title" lay-verify="title" autocomplete="off"
                     placeholder="用户的邮箱，用于找回密码时或登录/Login时" class="layui-input" id="email">
            </div>
          </div>
        </form>
        <div class="layui-btn-container">
          <button type="button" class="layui-btn layui-btn-normal" id="submit">确认/Confirm</button>
          <button type="button" class="layui-btn layui-btn-normal" id="cancel">取消/Cancel</button>
          <button type="button" class="layui-btn layui-btn-normal" id="detail">详情/Detail</button>
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
  layui.use(['upload', 'element', 'layer'], function () {
    var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , layer = layui.layer;

    let from = {
      avatar: "",
      email: "",
      nickname: "",
      phone: "",
      user_id: 1,
      username: "",
    }

    // 拿到本地存储的token
    let token = sessionStorage.token
    //常规使用 - 普通图片上传
    //常规使用 - 普通图片上传
    var uploadInst = upload.render({
      elem: '#test1'
      , url: BaseUrl+'/api/user/upload' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
      , headers: {
        'x-auth-token': token
      }
      , before: function (obj) {
        //预读本地文件示例，不支持ie8
        obj.preview(function (index, file, result) {
          $('#demo1').attr('src', result); //图片链接（base64）
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
        from.avatar = res.result.url
        console.log(res.result.url)
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
    let obj = JSON.parse(sessionStorage.getItem('personInfo'))

    from.avatar = obj.avatar

    // 赋值
    let username = document.querySelector('#username')
    username.innerHTML = obj.username || ''

    let nickname = document.querySelector('#nickname')
    nickname.value = obj.nickname || ''

    let userGroups = document.querySelector('#userGroups')
    userGroups.innerHTML = obj.user_group || ''

    let number = document.querySelector('#number')
    number.value = obj.phone || ''

    let state = document.querySelector('#state')
    if (obj.state === 1) {
      state.innerHTML = '可用'
    } else if (obj.state === 2) {
      state.innerHTML = '异常'
    } else if (obj.state === 3) {
      state.innerHTML = '已冻结'
    } else if (obj.state === 4) {
      state.innerHTML = '已注销'
    }

    let email = document.querySelector('#email')
    email.value = obj.email


    let demo1 = document.querySelector('#demo1')
    demo1.src = BaseUrl + obj.avatar


    let submit = document.querySelector('#submit')

    /*
    avatar: '/api/upload/bug.jpg',
          email: '3527960549@qq.com',
          nickname: "admin",
          phone: '15170844121',
          user_id: 1,
          username: 'admin'
    */

    // 测试确认/Confirm
    submit.onclick = async function () {
      from.email = email.value
      from.nickname = nickname.value
      from.phone = Number(number.value) || ''
      from.username = username.innerHTML
      from.user_id = obj.user_id


      let { data: res } = await axios.post(BaseUrl+'/api/user/set?user_id=' + obj.user_id, from, {
        headers: {
          'x-auth-token': token,
          'Content-Type': 'application/json'
        }
      })
      if (from.avatar == obj.avatar && res.result == 1) {
        layer.msg('确认/Confirm成功');
        setTimeout(function () {
          window.history.go(-1)
        }, 1000)
      } else if (from.avatar !== obj.avatar && res.result == 1) {
        layer.msg('确认/Confirm成功,头像已更新，请退出重进后查看')
        setTimeout(function () {
          window.history.go(-1)
        }, 2000)
      }
    }

    let cancel = document.querySelector('#cancel')
    cancel.onclick = function () {
      window.history.go(-1)
    }

    /* history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
      history.pushState(null, null, document.URL);
    }); */

    let detail = document.querySelector('#detail')

    var source_table = ""
    var user_group = obj.user_group;
    var source_table_check_url = "";
    var source_table_url = ""

    $.ajax({
      url: BaseUrl + "/api/user_group/get_obj?name="+user_group,
      type: "get",
      async: false,
      success: function (data) {
        if (data.result && data.result.obj) {
          source_table = data.result.obj.source_table
          source_table_check_url = "/"+source_table +"/view";
          source_table_url = "./"+source_table+"/view_add.jsp"+"?"+obj.user_id
          if (!source_table){
            detail.style.display = "none"
          }else{
            if ($check_action(source_table_check_url,'get') || $check_action(source_table_check_url,'set')){
            }else {
              detail.style.display = "none"
            }
          }
        }
      }
    });

    detail.onclick = async function () {
      window.location.href = source_table_url;
    }

    // 权限判断
    /**
     * 获取路径对应操作权限 鉴权
     * @param {String} action 操作名
     */
    function $check_action(path1, action = "get") {
      var o = $get_power(path1);
      if (o && o[action] != 0 && o[action] != false) {
        return true;
      }
      return false;
    }
    /**
     * 获取权限
     * @param {String} path 路由路径
     */
    function $get_power(path) {
      var list_data = JSON.parse(sessionStorage.list_data)
      var list = list_data;
      var obj;
      for (var i = 0; i < list.length; i++) {
        var o = list[i];
        if (o.path === path) {
          obj = o;
          break;
        }
      }
      return obj;
    }
  })


</script>

<style>
  #demo1 {
    width: 100px;
    height: 100px;
  }
</style>

</html>
