<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 管理员 -->

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="../../layui/css/layui.css">
  <link rel="stylesheet" href="../../css/diy.css">
  <style>
    .layui-body {
      overflow-x: scroll;
    }
  </style>
</head>

<body>
  <div class="section1">
    <!-- 内容主体区域 -->
    <div class="manu user" style="padding: 15px;">
      <form class="layui-form" action="">
        <div class="layui-form-item">
          <div>
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block block">
              <input type="text" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
          </div>
        </div>
      </form>
      <div class="buts">
        <button type="button" class="layui-btn layui-btn-normal" id="inquire">查询/Query</button>
        <button type="button" class="layui-btn layui-btn-normal" id="reset">重置/Reset</button>
        <button type="button" class="layui-btn layui-btn-normal" id="delete" style="display: none">删除/Del</button>
        <a href="./view_add.jsp" target="main_self_frame" type="button" class="layui-btn layui-btn-normal" style="display: none" id="add">新增/Add</a>
      </div>
    </div>
    <h1>数据列表</h1>
    <div class="table">
      <table class="layui-hide" id="administrator" lay-filter="administrator"></table>

      <script type="text/html" id="barDemo">
        <button class="layui-btn layui-btn-xs" lay-event="detail">详情/Details</button>
      </script>
    </div>
  </div>
  <script src="../../layui/layui.js"></script>
  <script src="../../js/axios.min.js" charset="utf-8"></script>
  <script src="../../js/index.js"></script>
  <script src="../../js/base.js" charset="utf-8"></script>


  <script>
    var BaseUrl = baseUrl()
    layui.use(['element', 'layer', 'util'], function () {
      var element = layui.element
        , table = layui.table
        , layer = layui.layer
        , util = layui.util
        , $ = layui.$;

      let personInfo = JSON.parse(sessionStorage.personInfo)
      let user_group = personInfo.user_group
      let deletes = document.querySelector("#delete")
      let add = document.querySelector("#add")
      let token = sessionStorage.token || null



      if (user_group == "管理员") {
        deletes.style.display = "block"
      }
      if (user_group == "管理员") {
        add.style.display = "block"
      }

      //头部事件
      util.event('lay-header-event', {
        //左侧菜单事件
        menuLeft: function (othis) {
          layer.msg('展开左侧菜单的操作', { icon: 0 });
        }
        , menuRight: function () {
          layer.open({
            type: 1
            , content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
            , area: ['260px', '100%']
            , offset: 'rt' //右上角
            , anim: 5
            , shadeClose: true
          });
        }
      });

      //  table 事件
      table.render({
        elem: '#administrator'
        , toolbar: true
        , url: BaseUrl+'/api/user/get_list'
        ,headers: {
          'x-auth-token': token,
          'Content-Type': 'application/json'
        }
        , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
          layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
          //,curr: 5 //设定初始在第 5 页
          , groups: 1 //只显示 1 个连续页码
          , first: false //不显示首页
          , last: false //不显示尾页
        }
        , cols: [[
          { type: 'checkbox', fixed: 'left' }
          , { field: 'nickname', width: 150, title: '昵称', fixed: 'left' }
          , { field: 'avatar', width: 150, height: 80, title: '头像',templet: function (d) {return "<div><img src=" + fullUrl(BaseUrl,d.avatar) + "></div>"} }
          , { field: 'username', width: 150, title: '用户名', sort: true }
          , { field: 'user_group', title: '用户组', width: 150, sort: true }
          , { field: 'phone', width: 150, title: '手机号码', sort: true }
          , {
            field: 'phone_state', title: '手机认证', sort: true, templet: function (data) {
              if (data.phone_state == 2) {
                return "<div>已认证</div>"
              } else if (data.phone_state == 0) {
                return "<div>未认证</div>"
              } else if (data.phone_state == 1) {
                return "<div>审核中</div>"
              }
            }
          }
          , { field: 'email', width: 150, title: '邮箱' }
          , {
            field: 'email_state', width: 150, title: '邮箱状态', sort: true, templet: function (data) {
              if (data.email_state == 2) {
                return "<div>已认证</div>"
              } else if (data.email_state == 1) {
                return "<div>未认证</div>"
              } else if (data.email_state == 0) {
                return "<div>审核中</div>"
              }
            }
          }
          , {
            field: 'state', width: 150, title: '状态', sort: true, templet: function (data) {
              if (data.state == 1) {
                return "<div>可用</div>"
              } else if (data.state == 2) {
                return "<div>异常</div>"
              } else if (data.state == 3) {
                return "<div>已冻结</div>"
              } else if (data.state == 4) {
                return "<div>已注销</div>"
              }
            }
          }
          , { field: 'login_time', width: 200, title: '上次登时间', sort: true, templet: "<div>{{layui.util.toDateString(d.login_time, 'yyyy-MM-dd HH:mm:ss')}}</div>" }
          , { field: 'create_time', width: 200, title: '新增时间', sort: true, templet: "<div>{{layui.util.toDateString(d.create_time, 'yyyy-MM-dd HH:mm:ss')}}</div>" }
          , { field: 'operate', width: 80, title: '操作', sort: true, fixed: 'right', toolbar: '#barDemo' }
        ]]
        , page: true,
        request: {
          limitName: 'size'
        },
        response: {
          statusName: 'code', //规定返回/Back的状态码字段为code
          statusCode: 200 //规定成功的状态码味200
        },
        parseData: function (res) {
          return {
            "code": 200,
            "msg": "",
            "count": res.result.count,
            "data": res.result.list
          }
        },
        where: { like: 0, user_group: '管理员' }
      });

      //监听行工具事件
      table.on('tool(administrator)', function (obj) {
        var data = obj.data;
        window.location.href = "./view_detail.jsp?" + data.user_id;//参数名称为index
      });


      // 请求参数：

      let request = { like: 0, size: 10, page: 1, nickname: '', user_group: '管理员' }

      // 重置/Reset参数
      let resetName = { like: 0, size: 10, page: 1, user_group: '管理员' }

      fun('administrator', BaseUrl+'/api/user/del', 'user_id', request, resetName)
    });
  </script>
</body>
<style>
  img {
    width: 200px;
    height: 200px;
  }
</style>

</html>
