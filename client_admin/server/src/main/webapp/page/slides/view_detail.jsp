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
                  <span>轮播图</span>
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
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                  <input
                    type="text"
                    name="title"
                    lay-verify="title"
                    autocomplete="off"
                    placeholder="请输入标题"
                    class="layui-input"
                    id="title"
                  />
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
        layer = layui.layer;

      let url;

      let from = {
        content: "",
        hits: 0,
        slides_id: 0,
        url: "",
      };

      let token = localStorage.getItem("token") || null;

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
          from.img = res.result.url;
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
      var slides_id = window.location.href.split("?")[1];

      // 发起请求获取数据
      let { data: res } = await axios.get(BaseUrl + "/api/slides/get_obj", {
        params: {
          slides_id: slides_id,
        },
      });

      console.log(res.result.obj);

      // 数据渲染页面
      let title = document.querySelector("#title");
      let demo1 = document.querySelector("#demo1");
      let submit = document.querySelector("#submit");
      title.value = res.result.obj.title;
      demo1.src = fullUrl(BaseUrl, res.result.obj.img);
      from.img = res.result.obj.img;
      from.content = res.result.obj.content;
      from.hits = res.result.obj.hits;

      // 返回/Back按钮事件
      let cancel = document.querySelector("#cancel");
      cancel.addEventListener("click", function () {
        window.location.replace("./table.jsp");
      });

      /*
    content: ""
hits: 0
img: "/api/upload/433387c3882211ebb6edd017c2d2eca2.jpg"
slides_id: 0
title: "标题是这里"
url: ""
    */
      submit.onclick = async function () {
        from.title = title.value;
        from.slides_id = Number(slides_id);
        from.url = `/article/details?article=${from.slides_id}`;
        const { data: res } = await axios.post(
          BaseUrl + "/api/slides/set?slides_id=" + slides_id,
          from,
          {
            headers: {
              "x-auth-token": token,
              "Content-Type": "application/json",
            },
          }
        );
        if (res.result == 1) {
          layer.msg("确认/Confirm完毕");
          setTimeout(function () {
            window.location.replace("./table.jsp");
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
