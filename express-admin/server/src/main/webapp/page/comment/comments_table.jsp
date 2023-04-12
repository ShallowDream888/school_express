<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 测试新闻查看评论 -->
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

    </style>
</head>

<body>
<div class="section1">
    <!-- 内容主体区域 -->
    <div class="manu article" style="padding: 15px;">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div>
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-block block">
                        <input type="text" name="title" required lay-verify="required" autocomplete="off" class="layui-input"
                               id="nickname">
                    </div>
                </div>
                <div>
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block block">
                        <input type="text" name="title" required lay-verify="required" autocomplete="off" class="layui-input" id="content">
                    </div>
                </div>
            </div>
        </form>
        <div class="buts">
            <button type="button" class="layui-btn layui-btn-normal" id="inquire">查询/Query</button>
            <button type="button" class="layui-btn layui-btn-normal" id="reset">重置/Reset</button>
            <button type="button" class="layui-btn layui-btn-normal" id="delete">删除/Del</button>
        </div>
    </div>
    <h1>数据列表</h1>
    <div class="table">
        <table class="layui-hide" id="comments" lay-filter="comments"></table>

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

        // 拿到传递过来的值
        var source_id = location.search.substring(1)
        let token = sessionStorage.token || null


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
            elem: '#comments'
            , url: BaseUrl+'/api/comment/get_list'
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
                , { field: 'nickname', width: '15%', title: '昵称' }
                , { field: 'img', width: '15%', title: '头像', templet: "<div><img src=" + BaseUrl + '{{d.img}}' + "></div>" }
                , { field: 'tag', width: '15%', title: '评论人' , templet:

                        function (d) {
                            let nickname = ""
                            $.ajax({
                                url: BaseUrl + "/api/user/get_obj?user_id=" + d.user_id,
                                type: "get",
                                async: false,
                                success: function (data) {
                                    if (typeof data == "string") {
                                        data = JSON.parse(data)
                                        if (data.result && data.result.obj) {
                                            nickname = data.result.obj.nickname
                                        }
                                    } else {
                                        if (data.result && data.result.obj) {
                                            nickname = data.result.obj.nickname
                                        }
                                    }
                                }
                            });
                            return '<span>' + nickname + '</span>'
                        }}
                , { field: 'create_time', width: '20%', title: '新增时间', sort: true, templet: "<div>{{layui.util.toDateString(d.create_time, 'yyyy-MM-dd HH:mm:ss')}}</div>" }
                , { field: 'update_time', width: '20%', title: '更新时间', sort: true, templet: "<div>{{layui.util.toDateString(d.update_time, 'yyyy-MM-dd HH:mm:ss')}}</div>" }
                , { field: 'operate', width: '15%', title: '操作', sort: true, fixed: 'right', toolbar: '#barDemo' }
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
            where: {
                like: 0,
                size: 10,
                page: 1,
                reply_to_id:source_id
            }
        });
        //监听行工具事件
        table.on('tool(comments)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                window.location.href = "./view_detail.jsp?" + data.comment_id;//参数名称为index
            }
        });
        // 请求参数：
        let request = { like: 0, size: 10, page: 1, nickname: '', content: '', orderby: 'create_time desc' }

        // 重置/Reset参数
        let resetName = { like: 0, size: 10, page: 1 }


        fun('comments', BaseUrl+'/api/comment/del', 'comment_id', request, resetName)
    });
</script>
</body>

</html>
