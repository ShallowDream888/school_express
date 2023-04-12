<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 公告栏 -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/diy.css">
</head>

<body>
<div class="section1">
    <!-- 内容主体区域 -->
    <div class="manu notice" style="padding: 15px;">
        <div class="layui-form-item">
            <div>
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block block">
                    <input type="text" name="title" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="buts">
            <button type="button" class="layui-btn layui-btn-normal" id="inquire">查询/Query</button>
            <button type="button" class="layui-btn layui-btn-normal" id="reset">重置/Reset</button>
            <button type="button" class="layui-btn layui-btn-normal" id="delete" style="display: none">删除/Del</button>
            <a href="./view_add.jsp" target="main_self_frame" type="button" class="layui-btn layui-btn-normal"
               style="display: none" id="add">新增/Add</a>
        </div>
    </div>
    <div class="table">
        <table class="layui-hide" id="bulletinBoard" lay-filter="bulletinBoard"></table>

        <script type="text/html" id="barDemo">
            <button class="layui-btn layui-btn-xs" lay-event="detail">详情/Details</button>
        </script>
    </div>
</div>
</body>
<script src="../../layui/layui.js"></script>
<script src="../../js/axios.min.js" charset="utf-8"></script>
<script src="../../js/index.js"></script>
<script src="../../js/base.js" charset="utf-8"></script>


<script>
    var BaseUrl = baseUrl()
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , table = layui.table
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


        if (user_group == "管理员" || $check_action('/notice/table', 'del')) {
            deletes.style.display = "block"
        }
        if (user_group == "管理员" || $check_action('/notice/view')) {
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
                if (o.path === "/notice/table") {
                    console.log(o.path);
                    path1 = o.path
                    $get_power(o.path)
                }
            }
        }

        getpath()


        // 表单
        table.render({
            elem: '#bulletinBoard'
            , toolbar: true
            , url: BaseUrl + '/api/notice/get_list'
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
                {type: 'checkbox', fixed: 'left'}
                , {field: 'title', width: '20%', title: '标题', sort: true, fixed: 'left'}
                , {
                    field: 'create_time',
                    width: '35%',
                    title: '新增时间',
                    sort: true,
                    templet: "<div>{{layui.util.toDateString(d.create_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"
                }
                , {
                    field: 'update_time',
                    width: '35%',
                    title: '更新时间',
                    sort: true,
                    templet: "<div>{{layui.util.toDateString(d.update_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"
                }
                , {field: 'operate', width: '10%', title: '操作', sort: true, fixed: 'right', toolbar: '#barDemo'}
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
            where: {like: 0, size: 10}
        });

        //监听行工具事件
        table.on('tool(bulletinBoard)', function (obj) {
            var data = obj.data;
            console.log(data)
            window.location.href = "./view_detail.jsp?" + data.notice_id;//参数名称为index
        });

        // 请求参数：

        let request = {like: 0, size: 10, page: 1, title: ''}

        // 重置/Reset参数
        let resetName = {like: 0, size: 10, page: 1}
        fun('bulletinBoard', BaseUrl + '/api/notice/del', 'notice_id', request, resetName)

    })
</script>

</html>
