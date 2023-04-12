<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 新闻分类 -->
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
    <div class="manu article_type" style="padding: 15px;">
      <form class="layui-form" action="">
        <div class="layui-form-item">
          <div>
            <label class="layui-form-label">频道名称</label>
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
      <table class="layui-hide" id="newsClassification" lay-filter="newsClassification"></table>

      <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
          <button class="layui-btn layui-btn-sm" lay-event="add">详情/Details</button>
        </div>
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
      let token = sessionStorage.token || null


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
      let deletes = document.querySelector("#delete")
      let add = document.querySelector("#add")


      if (user_group == "管理员" || $check_action('/article_type/table','del')) {
        deletes.style.display = "block"
      }
      if (user_group == "管理员" || $check_action('/article_type/view')) {
        add.style.display = "block"
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

      var path1

      function getpath() {
        var list_data = JSON.parse(sessionStorage.list_data)
        for (var i = 0; i < list_data.length; i++) {
          var o = list_data[i];
          if (o.path === "/article_type/table") {
            console.log(o.path);
            path1 = o.path
            $get_power(o.path)
          }
        }
      }

      getpath()

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
        elem: '#newsClassification'
        , toolbar: true
        , url: BaseUrl+'/api/article_type/get_list'
        , headers: {
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
          { type: 'checkbox' }
          , { field: 'name', width: '15%', title: '频道名称' }
          , { field: 'create_time', width: '35%', title: '新增时间', sort: true, templet: "<div>{{layui.util.toDateString(d.create_time, 'yyyy-MM-dd HH:mm:ss')}}</div>" }
          , { field: 'update_time', width: '35%', title: '更新时间', sort: true, templet: "<div>{{layui.util.toDateString(d.update_time, 'yyyy-MM-dd HH:mm:ss')}}</div>" }
          , { field: 'operate', width: '11%', title: '操作', toolbar: "#toolbarDemo" }
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
        where: { like: 0, size: 10 }
      });

      layui.table.on('tool(newsClassification)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        var data = obj.data; //获得当前行数据
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
        var tr = obj.tr; //获得当前行 tr 的DOM对象
        if (layEvent == "add") {
          let slides_id = data.type_id
          window.location = ('./view_detail.jsp?' + slides_id)
          console.log(slides_id);
        }
      });

      // 请求参数：
      let request = { like: 0, size: 10, page: 1, name: '', orderby: 'create_time desc' }

      // 重置/Reset参数
      let resetName = { like: 0, size: 10, page: 1 }

      fun('newsClassification', BaseUrl+'/api/article_type/del', 'type_id', request, resetName)
    });
  </script>
</body>

</html>
