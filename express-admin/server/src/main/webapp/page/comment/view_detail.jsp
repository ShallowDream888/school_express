<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 轮播图详情/Details -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="../../layui/css/layui.css" />
    <link rel="stylesheet" href="../../css/diy.css" />
  </head>

  <body>
    <article class="sign_in">
      <div class="warp slides">
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
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-block">
                  <input
                    type="text"
                    name="title"
                    lay-verify="title"
                    autocomplete="off"
                    placeholder="请输入用户名"
                    class="layui-input"
                    id="nickname"
                  />
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">正文</label>
                <div class="layui-input-block">
                  <textarea id="demo" style="display: none"></textarea>
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

  <script src="../../layui/layui.js" charset="utf-8"></script>
  <script src="../../js/axios.min.js" charset="utf-8"></script>
  <script src="../../js/base.js" charset="utf-8"></script>
  <script src="../../js/index.js" charset="utf-8"></script>
  <script>
    var BaseUrl = baseUrl();
    layui.use(["upload", "element", "layer"], async function () {
      var $ = layui.jquery,
        upload = layui.upload,
        element = layui.element,
        layer = layui.layer,
        layedit = layui.layedit;

      layui.layedit.set({
        uploadImage: {
          url: BaseUrl + "/api/slides/upload", //接口url
          type: "post", //默认post
        },
      });

      var demo = layedit.build("demo", {
        tool: [
          "strong", //加粗
          "italic", //斜体
          "underline", //下划线
          "del", //删除/Del线

          "|", //分割线

          "left", //左对齐
          "center", //居中对齐
          "right", //右对齐
          "link", //超链接
          "unlink", //清除链接
          "face", //表情
          "image", //插入图片
          "help", //帮助
        ],
      });

      let url;

      let from;

      let token = sessionStorage.token || null;

      //常规使用 - 普通图片上传
      var uploadInst = upload.render({
        elem: "#test1",
        url: BaseUrl + "/api/slides/upload",
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
          from.avatar = res.result.url;
          console.log(res.result.url);
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
      // 拿到传递过来的值
      var comment_id = location.search.substring(1);

      // 发起请求获取数据
      let { data: res } = await axios.get(BaseUrl + "/api/comment/get_obj", {
        params: {
          comment_id: comment_id,
        },
        headers: {
          "x-auth-token": token,
          "Content-Type": "application/json",
        },
      });
      let data = res.result.obj;
      from = {
        avatar: "",
        comment_id: comment_id,
        content: "",
        nickname: "",
        reply_to_id: data.reply_to_id,
      };

      // 数据渲染页面
      let nickname = document.querySelector("#nickname");
      let demo1 = document.querySelector("#demo1");
      let submit = document.querySelector("#submit");
      nickname.value = data.nickname;
      demo1.src = fullUrl(BaseUrl, res.result.obj.avatar);
      layedit.setContent(demo, data.content);

      // 返回/Back按钮事件
      let cancel = document.querySelector("#cancel");
      cancel.addEventListener("click", function () {
        window.location.replace("./view_comments.jsp?" + data.source_id);
      });

      submit.onclick = async function () {
        from.content = layedit.getContent(demo);
        from.nickname = nickname.value;
        const { data: res } = await axios.post(
          BaseUrl + "/api/comment/set?comment_id=" + comment_id,
          from,
          {
            headers: {
              "x-auth-token": token,
              "Content-Type": "application/json",
            },
          }
        );
        if (res.result) {
          layer.msg("确认/Confirm完毕");
          setTimeout(function () {
            window.location.replace("./view_comments.jsp?" + data.source_id);
          }, 1000);
        }
      };
    });
  </script>

  <style>
    img {
      width: 178px;
      height: 178px;
    }
  </style>
</html>
