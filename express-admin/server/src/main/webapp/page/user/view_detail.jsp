<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 管理员详情/Details -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <link rel="stylesheet" href="../../layui/css/layui.css" />
  <link rel="stylesheet" href="../../css/diy.css" />
  <script src="../../js/axios.min.js" charset="utf-8"></script>

  <body>
  <article class="sign_in">
    <div class="warp user">
      <div class="layui-container">
        <div class="layui-row">
          <form class="layui-form" action="">
            <!-- 上传图片开始 -->
            <div class="layui-form-item">
              <div class="layui-upload">
                <span>头像</span>
                <button type="button" class="layui-btn" id="test1">
                  上传图片
                </button>
                <div class="layui-upload-list">
                  <img class="layui-upload-img" id="demo1" />
                  <p id="demoText"></p>
                </div>
                <div style="width: 95px">
                  <div
                          class="layui-progress layui-progress-big"
                          lay-showpercent="yes"
                          lay-filter="demo"
                  >
                    <div class="layui-progress-bar" lay-percent=""></div>
                  </div>
                </div>
              </div>
              <div style="margin-top: 10px"></div>
            </div>
            <!-- 上传图片结束 -->
            <div class="layui-form-item">
              <label class="layui-form-label">用户名</label>
              <div class="layui-input-block">
                <span id="username"></span>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">密码</label>
              <div class="layui-input-block">
                <span id="password"></span>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">昵称</label>
              <div class="layui-input-block">
                <input
                        type="text"
                        name="title"
                        lay-verify="title"
                        autocomplete="off"
                        placeholder="请输入标题"
                        class="layui-input"
                        id="nickname"
                />
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">邮箱</label>
              <div class="layui-input-block">
                <input
                        type="text"
                        name="title"
                        lay-verify="title"
                        autocomplete="off"
                        placeholder="请输入标题"
                        class="layui-input"
                        id="email"
                />
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">手机号码</label>
              <div class="layui-input-block">
                <input
                        type="text"
                        name="title"
                        lay-verify="title"
                        autocomplete="off"
                        placeholder="请输入标题"
                        class="layui-input"
                        id="phone"
                />
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">手机认证</label>
              <div class="layui-input-block">
                <select name="interest" lay-filter="phone_state" id="phone_state">
                  <option value=""></option>
                  <option value="0">未认证</option>
                  <option value="1">审核中</option>
                  <option value="2">已认证</option>
                </select>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">邮箱认证</label>
              <div class="layui-input-block">
                <select name="interest" lay-filter="email_state" id="email_state">
                  <option value=""></option>
                  <option value="0">未认证</option>
                  <option value="1">审核中</option>
                  <option value="2">已认证</option>
                </select>
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">状态</label>
              <div class="layui-input-block">
                <select name="interest" lay-filter="state" id="state">
                  <option value=""></option>
                  <option value="1">可用</option>
                  <option value="2">异常</option>
                  <option value="3">已冻结</option>
                  <option value="4">已注销</option>
                </select>
              </div>
            </div>
          </form>
          <div class="layui-btn-container">
            <button
                    type="button"
                    class="layui-btn layui-btn-normal"
                    id="submit"
            >
              确认/Confirm
            </button>
            <button
                    type="button"
                    class="layui-btn layui-btn-normal"
                    id="cancel"
            >
              取消/Cancel
            </button>
          </div>
        </div>
      </div>
    </div>
  </article>
  </body>
  <script src="../../layui/layui.js"></script>
  <script src="../../js/base.js" charset="utf-8"></script>
  <script src="../../js/index.js" charset="utf-8"></script>
  <script>
    var BaseUrl = baseUrl();
    layui.use(["upload", "element", "layer"], function () {
      var $ = layui.jquery,
              upload = layui.upload,
              element = layui.element,
              layer = layui.layer,
              form = layui.form;

      let token = sessionStorage.token || null;
      var from = {
        avatar: "",
        email: "",
        nickname: "",
        phone: "",
        user_group: "管理员",
        user_id: 0,
        phone_state: 0,
        email_state: 0,
        state: 0,
        username: "",
      };

      var uploadInst = upload.render({
        elem: "#test1",
        url: BaseUrl + "/api/user/upload",
        headers: {
          "x-auth-token": token,
        }, //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
        before: function (obj) {
          //预读本地文件示例，不支持ie8
          obj.preview(function (index, file, result) {
            $("#demo1").attr("src", fullUrl(BaseUrl, result)); //图片链接（base64）
          });

          element.progress("demo", "0%"); //进度条复位
          layer.msg("上传中", { icon: 16, time: 0 });
        },
        done: function (res) {
          //如果上传失败
          if (res.code > 0) {
            return layer.msg("上传失败");
          }
          //上传成功的一些操作
          //……
          from["avatar"] = res.result.url;
          $("#demoText").html(""); //置空上传失败的状态
        },
        error: function () {
          //演示失败状态，并实现重传
          var demoText = $("#demoText");
          demoText.html(
                  '<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>'
          );
          demoText.find(".demo-reload").on("click", function () {
            uploadInst.upload();
          });
        },
        //进度条
        progress: function (n, elem, e) {
          element.progress("demo", n + "%"); //可配合 layui 进度条元素使用
          if (n == 100) {
            layer.msg("上传完毕", { icon: 1 });
          }
        },
      });

      let username = document.querySelector("#username");
      let password = document.querySelector("#password");
      let email = document.querySelector("#email");
      let nickname = document.querySelector("#nickname");
      let phone = document.querySelector("#phone");
      let phone_state = document.querySelector("#phone_state");
      let email_state = document.querySelector("#email_state");
      let state = document.querySelector("#state");

      let value = location.search.substring(1);
      let img;
      async function fff() {
        const { data: rese } = await axios.get(BaseUrl + "/api/user/get_obj", {
          params: {
            user_id: value,
          },
        });
        img = rese.result.obj;
        if (rese) {
          username.innerHTML = img.username;
          password.innerHTML = img.password;
          email.value = img.email;
          nickname.value = img.nickname;
          phone.value = img.phone || "";

          from.state = img.state;
          from.phone_state = img.phone_state;
          from.email_state = img.email_state;

          if (img.avatar){
            $("#demo1").attr("src", fullUrl(BaseUrl, img.avatar))
            from.avatar = img.avatar;
          }

          if (img.phone_state == 2) {
            phone_state.children[3].setAttribute("selected", "1");
          } else if (img.phone_state == 1) {
            phone_state.children[2].setAttribute("selected", "1");
          } else if (img.phone_state == 0) {
            phone_state.children[1].setAttribute("selected", "1");
          }
          layui.form.render("select");

          if (img.email_state == 2) {
            email_state.children[3].setAttribute("selected", "1");
          } else if (img.email_state == 1) {
            email_state.children[2].setAttribute("selected", "1");
          } else if (img.email_state == 0) {
            email_state.children[1].setAttribute("selected", "1");
          }
          layui.form.render("select");

          if (img.state == 1) {
            state.children[1].setAttribute("selected", "1");
          } else if (img.state == 2) {
            state.children[2].setAttribute("selected", "1");
          } else if (img.state == 3) {
            state.children[3].setAttribute("selected", "1");
          } else if (img.state == 4) {
            state.children[4].setAttribute("selected", "1");
          }
          layui.form.render("select");
        }
      }
      fff();
      cancel.onclick = function () {
        window.location = "./table.jsp";
      };

      phone.addEventListener("blur", function () {
        if (!phone_regular.test(phone.value)) {
          layer.msg("请输入正确的手机号码 例：18955552312!");
        } else {
          from.phone = phone.value;
        }
      });

      email.addEventListener("blur", function () {
        if (!phone_regular.test(phone.value)) {
          layer.msg("请输入正确的邮箱地址 例：test@test.com!");
        } else {
          from.email = email.value;
        }
      });

      password.addEventListener("blur", function () {
        if (password.value.length > 16 || password.value.length < 5) {
          layer.msg("密码长度应为5到16个字符之间！");
        } else if (password.value == "") {
          layer.msg("密码不能为空");
        } else {
          from.password = password.value;
        }
      });

      nickname.addEventListener("blur", function () {
        if (
                (nickname.value && nickname.value.length > 12) ||
                nickname.value.length < 2
        ) {
          layer.msg("昵称长度应为2个字符到12个字符之间");
        } else {
          from.nickname = nickname.value;
        }
      });

      username.addEventListener("blur", function () {
        if (username.value.length > 25 || username.value.length < 5) {
          layer.msg("昵称长度应为5个字符到25个字符之间");
        } else if (username.value == "") {
          layer.msg("用户名不能为空");
        } else {
          from.username = username.value;
        }
      });

      form.on("select(phone_state)", function (data) {
        from.phone_state = data.value;
      });
      form.on("select(email_state)", function (data) {
        from.email_state = data.value;
      });
      form.on("select(state)", function (data) {
        from.state = data.value;
      });

      let submit = document.querySelector("#submit");
      submit.addEventListener("click", async function () {
        from.username = username.value;
        from.password = password.value;
        from.email = email.value;
        from.nickname = nickname.value;
        from.phone = phone.value;
        from.user_id = value;
        const { data: res } = await axios.post(
                BaseUrl + "/api/user/set?user_id=" + value,
                from,
                {
                  headers: {
                    "x-auth-token": token,
                    "Content-Type": "application/json",
                  },
                }
        );
        if (res.result == 1) {
          layer.msg("确认/Confirm成功");
          setTimeout(function () {
            window.location.replace("./table.jsp");
          }, 1000);
        }
      });
    });
  </script>
  <style>
    img {
      width: 200px;
      height: 200px;
    }
  </style>
</html>
