<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 新增/Add -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/diy.css">
    <script src="../../js/axios.min.js"></script>

    <style>
        img {
            width: 200px;
        }
    </style>
</head>

<body>
<article class="sign_in">
    <div class="warp">
        <div class="layui-container">
            <div class="layui-row">
                <form class="layui-form" action="">
                    <div class="layui-form-item" id="task_number_box">
                        <label class="layui-form-label">任务编号</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入任务编号"
                                   class="layui-input" id="task_number">
                        </div>
                    </div>
                    <div class="layui-form-item" id="task_name_box">
                        <label class="layui-form-label">任务名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入任务名称"
                                   class="layui-input" id="task_name">
                        </div>
                    </div>
                    <div class="layui-form-item" id="publishing_users_box">
                        <label class="layui-form-label">发布用户</label>
                        <div class="layui-input-block">
                            <select name="interest" lay-filter="publishing_users" id="publishing_users">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item" id="item_weight_box">
                        <label class="layui-form-label">物品重量</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入物品重量"
                                   class="layui-input" id="item_weight">
                        </div>
                    </div>
                    <div class="layui-form-item" id="item_type_box">
                        <label class="layui-form-label">物品类型</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入物品类型"
                                   class="layui-input" id="item_type">
                        </div>
                    </div>
                    <div class="layui-form-item" id="pickup_address_box">
                        <label class="layui-form-label">取货地址</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入取货地址"
                                   class="layui-input" id="pickup_address">
                        </div>
                    </div>
                    <div class="layui-form-item" id="shipping_address_box">
                        <label class="layui-form-label">送货地址</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入送货地址"
                                   class="layui-input" id="shipping_address">
                        </div>
                    </div>
                    <div class="layui-form-item" id="task_commission_box">
                        <label class="layui-form-label">任务佣金</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入任务佣金"
                                   class="layui-input" id="task_commission">
                        </div>
                    </div>
                    <div class="layui-form-item" id="quantity_received_box">
                        <label class="layui-form-label">领取数量</label>
                        <div class="layui-input-block">
                            <select name="interest" lay-filter="quantity_received" id="quantity_received">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item" id="pickup_code_box">
                        <label class="layui-form-label">取货码</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入取货码"
                                   class="layui-input" id="pickup_code">
                        </div>
                    </div>
                    <div class="layui-form-item" id="runner_box">
                        <label class="layui-form-label">跑腿用户</label>
                        <div class="layui-input-block">
                            <select name="interest" lay-filter="runner"
                                    id="runner">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item" id="full_name_box">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入姓名"
                                   class="layui-input" id="full_name">
                        </div>
                    </div>
                    <div class="layui-form-item" id="order_status_box">
                        <label class="layui-form-label">订单状态</label>
                        <div class="layui-input-block">
                            <select name="interest" lay-filter="order_status" id="order_status">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>


                </form>
                <div class="layui-btn-container">
                    <a href="#" type="button" class="layui-btn layui-btn-normal login" id="submit">确认</a>
                    <a href="./table.jsp" target="main_self_frame" type="button"
                       class="layui-btn layui-btn-normal login">取消</a>
                </div>
            </div>
        </div>
    </div>
</article>
</body>
<script src="../../layui/layui.js"></script>
<script src="../../js/base.js"></script>
<script src="../../js/index.js"></script>
<script>
    var BaseUrl = baseUrl()
    let picking_order_id = location.search.substring(1)
    layui.use(['upload', 'element', 'layer', 'laydate', 'layedit'], function () {
        var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , layer = layui.layer
            , laydate = layui.laydate
            , layedit = layui.layedit
            , form = layui.form;

        let url

        let token = sessionStorage.token || null
        let personInfo = JSON.parse(sessionStorage.personInfo)
        let user_group = personInfo.user_group
        let use_id = personInfo.user_id

        function $get_stamp() {
            return new Date().getTime();
        }

        function $get_rand(len) {
            var rand = Math.random();
            return Math.ceil(rand * 10 ** len);
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
         * 是否有显示或操作字段的权限
         * @param {String} action 操作名
         * @param {String} field 查询的字段
         */
        function $check_field(action, field, path1) {
            var o = $get_power(path1);
            var auth;
            if (o && o[action] != 0 && o[action] != false) {
                auth = o["field_" + action];
            }
            if (auth) {
                return auth.indexOf(field) !== -1;
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

        let submit = document.querySelector('#submit')
        // 提交按钮校验权限
        // if (   user_group == "管理员" ||$check_action('/picking_order/view', 'add') || $check_action('/picking_order/view', 'set')) {
        //    submit.style.display = "block"
        // }
        // style="display: none"


        let field = "picking_order_id";
        let url_add = "picking_order";
        let url_set = "picking_order";
        let url_get_obj = "picking_order";
        let url_upload = "picking_order"
        let query = {
            "picking_order_id": 0,
        }

        let form_data2 = {
            "task_number": '', // 任务编号
            "task_name": '', // 任务名称
            "publishing_users": 0, // 发布用户
            "item_weight": '', // 物品重量
            "item_type": '', // 物品类型
            "pickup_address": '', // 取货地址
            "shipping_address": '', // 送货地址
            "task_commission": '', // 任务佣金
            "quantity_received": '', // 领取数量
            "pickup_code": '', // 取货码
            "runner": 0, // 跑腿用户
            "full_name": '', // 姓名
            "order_status": '', // 订单状态
            "picking_order_id": 0, // ID
        }

        layui.layedit.set({
            uploadImage: {
                url: BaseUrl + '/api/picking_order/upload?' //接口url
                , type: 'post' //默认post
            }
        });


        var path1

        function getpath() {
            var list_data = JSON.parse(sessionStorage.list_data)
            for (var i = 0; i < list_data.length; i++) {
                var o = list_data[i];
                if (o.path === "/picking_order/table") {
                    path1 = o.path
                    $get_power(o.path)
                }
            }
        }

        getpath()

        /**
         * 注册时是否有显示或操作字段的权限
         * @param {String} action 操作名
         * @param {String} field 查询的字段
         * @param {String} path 路径
         */
        function $check_register_field(action, field, path1) {
            var o = $get_power(path1);
            var auth;
            if (o && o[action] != 0 && o[action] != false) {
                auth = o["field_" + action];
            }
            if (auth) {
                return auth.indexOf(field) !== -1;
            }
            return false;
        }

        /**
         * 是否有显示或操作字段的权限
         * @param {String} action 操作名
         * @param {String} field 查询的字段
         */
        function $check_field(action, field) {
            var o = $get_power("/picking_order/view");
            var auth;
            if (o && o[action] != 0 && o[action] != false) {
                auth = o["field_" + action];
            }
            if (auth) {
                return auth.indexOf(field) !== -1;
            }
            return false;
        }

        /**
         * 获取路径对应操作权限 鉴权
         * @param {String} action 操作名
         */
        function $check_exam(path1, action = "get") {
            var o = $get_power(path1);
            if (o) {
                var option = JSON.parse(o.option);
                if (option[action])
                    return true
            }
            return false;
        }

        /**
         * 是否有审核字段的权限
         */
        function $check_examine() {
            var url = window.location.href;
            var url_ = url.split("/")
            var pg_url = url_[url_.length - 2]
            let path = "/" + pg_url + "/table"
            var o = $get_power(path);
            if (o) {
                var option = JSON.parse(o.option);
                if (option.examine)
                    return true
            }
            return false;
        }

        if (user_group === '管理员') {
            $("#task_number_box").show()
        } else {
            if ($check_field('add', 'task_number')) {
                $("#task_number_box").show()
            } else {
                $("#task_number_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#task_name_box").show()
        } else {
            if ($check_field('add', 'task_name')) {
                $("#task_name_box").show()
            } else {
                $("#task_name_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#publishing_users_box").show()
        } else {
            if ($check_field('add', 'publishing_users')) {
                $("#publishing_users_box").show()
            } else {
                $("#publishing_users_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#item_weight_box").show()
        } else {
            if ($check_field('add', 'item_weight')) {
                $("#item_weight_box").show()
            } else {
                $("#item_weight_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#item_type_box").show()
        } else {
            if ($check_field('add', 'item_type')) {
                $("#item_type_box").show()
            } else {
                $("#item_type_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#pickup_address_box").show()
        } else {
            if ($check_field('add', 'pickup_address')) {
                $("#pickup_address_box").show()
            } else {
                $("#pickup_address_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#shipping_address_box").show()
        } else {
            if ($check_field('add', 'shipping_address')) {
                $("#shipping_address_box").show()
            } else {
                $("#shipping_address_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#task_commission_box").show()
        } else {
            if ($check_field('add', 'task_commission')) {
                $("#task_commission_box").show()
            } else {
                $("#task_commission_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#quantity_received_box").show()
        } else {
            if ($check_field('add', 'quantity_received')) {
                $("#quantity_received_box").show()
            } else {
                $("#quantity_received_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#pickup_code_box").show()
        } else {
            if ($check_field('add', 'pickup_code')) {
                $("#pickup_code_box").show()
            } else {
                $("#pickup_code_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#runner_box").show()
        } else {
            if ($check_field('add', 'runner')) {
                $("#runner_box").show()
            } else {
                $("#runner_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#full_name_box").show()
        } else {
            if ($check_field('add', 'full_name')) {
                $("#full_name_box").show()
            } else {
                $("#full_name_box").hide()
            }
        }
        if (user_group === '管理员') {
            $("#order_status_box").show()
        } else {
            if ($check_field('add', 'order_status')) {
                $("#order_status_box").show()
            } else {
                $("#order_status_box").hide()
            }
        }


        // 领取数量选项列表
        let quantity_received_data = ['1'];


        // 订单状态选项列表
        let order_status_data = ['取货中', '送货中', '已完成'];


        async function list_publishing_users() {
            var publishing_users = document.querySelector("#publishing_users")
            var op1 = document.createElement("option");
            op1.value = '0'
            publishing_users.appendChild(op1)
            // 收集数据 长度
            var count
            // 收集数据 数组
            var arr = []
            $.ajax({
                url: BaseUrl + '/api/user/get_list?user_group=雇主用户',
                type: 'GET',
                contentType: 'application/json; charset=UTF-8',
                async: false,
                dataType: 'json',
                success: function (response) {
                    count = response.result.count
                    arr = response.result.list
                }
            })
            for (var i = 0; i < arr.length; i++) {
                var op = document.createElement("option");
                // 给节点赋值
                op.innerHTML = arr[i].username + "--" + arr[i].nickname
                op.value = arr[i].user_id
                // 新增/Add节点
                publishing_users.appendChild(op)
                if (form_data2.publishing_users == arr[i].publishing_users) {
                    op.selected = true
                }
                layui.form.render("select");
            }
        }

        layui.form.on('select(publishing_users)', function (data) {
            form_data2.publishing_users = Number(data.elem[data.elem.selectedIndex].value);
        })
        list_publishing_users()


        async function quantity_received() {
            var quantity_received = document.querySelector("#quantity_received")
            var op1 = document.createElement("option");
            op1.value = '0'
            quantity_received.appendChild(op1)
            // 收集数据 长度
            var count
            // 收集数据 数组
            var arr = []
            count = quantity_received_data.length
            arr = quantity_received_data
            for (var i = 0; i < arr.length; i++) {
                var op = document.createElement("option");
                // 给节点赋值
                op.innerHTML = arr[i]
                op.value = arr[i]
                // 新增/Add节点
                quantity_received.appendChild(op)
                if (form_data2.quantity_received == arr[i].quantity_received) {
                    op.selected = true
                }
                layui.form.render("select");
            }
        }

        layui.form.on('select(quantity_received)', function (data) {
            form_data2.quantity_received = data.elem[data.elem.selectedIndex].text;
        })
        quantity_received()


        async function list_runner() {
            var runner = document.querySelector("#runner")
            var op1 = document.createElement("option");
            op1.value = '0'
            runner.appendChild(op1)
            // 收集数据 长度
            var count
            // 收集数据 数组
            var arr = []
            $.ajax({
                url: BaseUrl + '/api/user/get_list?user_group=跑腿用户',
                type: 'GET',
                contentType: 'application/json; charset=UTF-8',
                async: false,
                dataType: 'json',
                success: function (response) {
                    count = response.result.count
                    arr = response.result.list
                }
            })
            for (var i = 0; i < arr.length; i++) {
                var op = document.createElement("option");
                // 给节点赋值
                op.innerHTML = arr[i].username + "--" + arr[i].nickname
                op.value = arr[i].user_id
                // 新增/Add节点
                runner.appendChild(op)
                if (form_data2.runner == arr[i].runner) {
                    op.selected = true
                }
                layui.form.render("select");
            }
        }

        layui.form.on('select(runner)', function (data) {
            form_data2.runner = Number(data.elem[data.elem.selectedIndex].value);
        })
        list_runner()

        async function order_status() {
            var order_status = document.querySelector("#order_status")
            var op1 = document.createElement("option");
            op1.value = '0'
            order_status.appendChild(op1)
            // 收集数据 长度
            var count
            // 收集数据 数组
            var arr = []
            count = order_status_data.length
            arr = order_status_data
            for (var i = 0; i < arr.length; i++) {
                var op = document.createElement("option");
                // 给节点赋值
                op.innerHTML = arr[i]
                op.value = arr[i]
                // 新增/Add节点
                order_status.appendChild(op)
                if (form_data2.order_status == arr[i].order_status) {
                    op.selected = true
                }
                layui.form.render("select");
            }
        }

        layui.form.on('select(order_status)', function (data) {
            form_data2.order_status = data.elem[data.elem.selectedIndex].text;
        })
        order_status()


        //文本
        let task_number = document.querySelector("#task_number")
        task_number.onkeyup = function (event) {
            form_data2.task_number = event.target.value
        }
        //文本
        //文本
        let task_name = document.querySelector("#task_name")
        task_name.onkeyup = function (event) {
            form_data2.task_name = event.target.value
        }
        //文本
        //文本
        let item_weight = document.querySelector("#item_weight")
        item_weight.onkeyup = function (event) {
            form_data2.item_weight = event.target.value
        }
        //文本
        //文本
        let item_type = document.querySelector("#item_type")
        item_type.onkeyup = function (event) {
            form_data2.item_type = event.target.value
        }
        //文本
        //文本
        let pickup_address = document.querySelector("#pickup_address")
        pickup_address.onkeyup = function (event) {
            form_data2.pickup_address = event.target.value
        }
        //文本
        //文本
        let shipping_address = document.querySelector("#shipping_address")
        shipping_address.onkeyup = function (event) {
            form_data2.shipping_address = event.target.value
        }
        //文本
        //文本
        let task_commission = document.querySelector("#task_commission")
        task_commission.onkeyup = function (event) {
            form_data2.task_commission = event.target.value
        }
        //文本
        //文本
        let pickup_code = document.querySelector("#pickup_code")
        pickup_code.onkeyup = function (event) {
            form_data2.pickup_code = event.target.value
        }
        //文本
        //文本
        let full_name = document.querySelector("#full_name")
        full_name.onkeyup = function (event) {
            form_data2.full_name = event.target.value
        }
        //文本
        var data = sessionStorage.data || ''
        if (data !== '') {
            var data2 = JSON.parse(data)
            Object.keys(form_data2).forEach(key => {
                Object.keys(data2).forEach(dbKey => {
                    if (key === dbKey) {
                        if (key !== 'examine_state' && key !== 'examine_reply') {
                            $('#' + key).val(data2[key])
                            form_data2[key] = data2[key]
                            $('#' + key).attr('disabled', 'disabled')


                            for (let key in form_data2) {
                                if (key == 'publishing_users') {
                                    let alls = document.querySelector('#publishing_users').querySelectorAll('option')
                                    let test = form_data2[key]
                                    for (let i = 0; i < alls.length; i++) {
                                        layui.form.render("select");
                                        if (alls[i].value == test) {
                                            alls[i].selected = true
                                            form_data2.publishing_users = alls[i].value
                                            layui.form.render("select");
                                        }
                                    }
                                }
                            }


                            for (let key in form_data2) {
                                if (key == 'quantity_received') {
                                    let alls = document.querySelector('#quantity_received').querySelectorAll('option')
                                    let test = form_data2[key]
                                    for (let i = 0; i < alls.length; i++) {
                                        if (alls[i].innerHTML == test) {
                                            alls[i].selected = true
                                            form_data2.quantity_received = alls[i].text
                                            layui.form.render("select");
                                        }
                                    }
                                }
                            }


                            for (let key in form_data2) {
                                if (key == 'runner') {
                                    let alls = document.querySelector('#runner').querySelectorAll('option')
                                    let test = form_data2[key]
                                    for (let i = 0; i < alls.length; i++) {
                                        layui.form.render("select");
                                        if (alls[i].value == test) {
                                            alls[i].selected = true
                                            form_data2.runner = alls[i].value
                                            layui.form.render("select");
                                        }
                                    }
                                }
                            }


                            for (let key in form_data2) {
                                if (key == 'order_status') {
                                    let alls = document.querySelector('#order_status').querySelectorAll('option')
                                    let test = form_data2[key]
                                    for (let i = 0; i < alls.length; i++) {
                                        if (alls[i].innerHTML == test) {
                                            alls[i].selected = true
                                            form_data2.order_status = alls[i].text
                                            layui.form.render("select");
                                        }
                                    }
                                }
                            }

                        }
                    }
                })
            })
            sessionStorage.removeItem("data");
        }

        async function axios_get_4() {
            if (user_group != '管理员') {
                const {data: rese} = await axios.get(BaseUrl + '/api/user/get_list?user_group=' + user_group)
                let data = rese.result.list

                const {data: ress} = await axios.get(BaseUrl + '/api/user_group/get_obj?name=' + user_group)
                const {data: res} = await axios.get(BaseUrl + '/api/' + ress.result.obj.source_table + '/get_obj?user_id=' + use_id)
                Object.keys(form_data2).forEach(key => {
                    Object.keys(res.result.obj).forEach(dbKey => {
                        if (key === dbKey) {
                            if (key !== 'examine_state' && key !== 'examine_reply') {
                                $('#' + key).val(res.result.obj[key])
                                form_data2[key] = res.result.obj[key]
                                $('#' + key).attr('disabled', 'disabled')
                            }
                        }
                    })
                })

                for (let key in res.result.obj) {
                    if (key == 'user_id') {
                        let alls = document.querySelector('#runner').querySelectorAll('option')
                        let test = res.result.obj.user_id
                        for (let i = 0; i < alls.length; i++) {
                            if (alls[i].value == test) {
                                alls[i].selected = true
                                $('#runner').attr('disabled', 'disabled')
                                form_data2.runner = alls[i].value
                                layui.form.render("select");
                            }
                        }
                    }
                }
            }
        }

        axios_get_4()


        if (picking_order_id !== '') {
            async function axios_get_3() {
                const {data: rese} = await axios.get(BaseUrl + '/api/picking_order/get_obj', {
                    params: {
                        picking_order_id: picking_order_id
                    }, headers: {
                        'x-auth-token': token
                    }
                })

                let data = rese.result.obj
                Object.keys(form_data2).forEach((key) => {
                    form_data2[key] = data[key];
                    $("#" + key).val(form_data2[key])
                });


                for (let key in data) {
                    if (key == 'publishing_users') {
                        let alls = document.querySelector('#publishing_users').querySelectorAll('option')
                        let test = data[key]
                        for (let i = 0; i < alls.length; i++) {
                            layui.form.render("select");
                            if (alls[i].value == test) {
                                alls[i].selected = true
                                form_data2.publishing_users = alls[i].value
                                layui.form.render("select");
                            }
                        }
                    }
                }


                for (let key in data) {
                    if (key == 'quantity_received') {
                        let alls = document.querySelector('#quantity_received').querySelectorAll('option')
                        let test = data[key]
                        for (let i = 0; i < alls.length; i++) {
                            if (alls[i].innerHTML == test) {
                                alls[i].selected = true
                                form_data2.quantity_received = alls[i].text
                                layui.form.render("select");
                            }
                        }
                    }
                }


                for (let key in data) {
                    if (key == 'runner') {
                        let alls = document.querySelector('#runner').querySelectorAll('option')
                        let test = data[key]
                        for (let i = 0; i < alls.length; i++) {
                            layui.form.render("select");
                            if (alls[i].value == test) {
                                alls[i].selected = true
                                form_data2.runner = alls[i].value
                                layui.form.render("select");
                            }
                        }
                    }
                }


                for (let key in data) {
                    if (key == 'order_status') {
                        let alls = document.querySelector('#order_status').querySelectorAll('option')
                        let test = data[key]
                        for (let i = 0; i < alls.length; i++) {
                            if (alls[i].innerHTML == test) {
                                alls[i].selected = true
                                form_data2.order_status = alls[i].text
                                layui.form.render("select");
                            }
                        }
                    }
                }

                if (user_group === '管理员') {
                    $("#task_number_box").show()
                } else {
                    if ($check_field('set', 'task_number') || $check_field('get', 'task_number')) {
                        $("#task_number_box").show()
                    } else {
                        $("#task_number_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#task_name_box").show()
                } else {
                    if ($check_field('set', 'task_name') || $check_field('get', 'task_name')) {
                        $("#task_name_box").show()
                    } else {
                        $("#task_name_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#publishing_users_box").show()
                } else {
                    if ($check_field('set', 'publishing_users') || $check_field('get', 'publishing_users')) {
                        $("#publishing_users_box").show()
                    } else {
                        $("#publishing_users_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#item_weight_box").show()
                } else {
                    if ($check_field('set', 'item_weight') || $check_field('get', 'item_weight')) {
                        $("#item_weight_box").show()
                    } else {
                        $("#item_weight_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#item_type_box").show()
                } else {
                    if ($check_field('set', 'item_type') || $check_field('get', 'item_type')) {
                        $("#item_type_box").show()
                    } else {
                        $("#item_type_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#pickup_address_box").show()
                } else {
                    if ($check_field('set', 'pickup_address') || $check_field('get', 'pickup_address')) {
                        $("#pickup_address_box").show()
                    } else {
                        $("#pickup_address_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#shipping_address_box").show()
                } else {
                    if ($check_field('set', 'shipping_address') || $check_field('get', 'shipping_address')) {
                        $("#shipping_address_box").show()
                    } else {
                        $("#shipping_address_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#task_commission_box").show()
                } else {
                    if ($check_field('set', 'task_commission') || $check_field('get', 'task_commission')) {
                        $("#task_commission_box").show()
                    } else {
                        $("#task_commission_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#quantity_received_box").show()
                } else {
                    if ($check_field('set', 'quantity_received') || $check_field('get', 'quantity_received')) {
                        $("#quantity_received_box").show()
                    } else {
                        $("#quantity_received_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#pickup_code_box").show()
                } else {
                    if ($check_field('set', 'pickup_code') || $check_field('get', 'pickup_code')) {
                        $("#pickup_code_box").show()
                    } else {
                        $("#pickup_code_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#runner_box").show()
                } else {
                    if ($check_field('set', 'runner') || $check_field('get', 'runner')) {
                        $("#runner_box").show()
                    } else {
                        $("#runner_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#full_name_box").show()
                } else {
                    if ($check_field('set', 'full_name') || $check_field('get', 'full_name')) {
                        $("#full_name_box").show()
                    } else {
                        $("#full_name_box").hide()
                    }
                }
                if (user_group === '管理员') {
                    $("#order_status_box").show()
                } else {
                    if ($check_field('set', 'order_status') || $check_field('get', 'order_status')) {
                        $("#order_status_box").show()
                    } else {
                        $("#order_status_box").hide()
                    }
                }

                // Array.prototype.slice.call(document.getElementsByTagName('input')).map(i => i.disabled = true)
                // Array.prototype.slice.call(document.getElementsByTagName('select')).map(i => i.disabled = true)
                // Array.prototype.slice.call(document.getElementsByTagName('textarea')).map(i => i.disabled = true)
                //文本
                task_number.value = form_data2.task_number
                //文本

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'task_number')) || (!form_data2['picking_order_id'] && $check_field('add', 'task_number'))) {
                } else {
                    $("#task_number").attr("disabled", true);
                    $("#task_number > input[name='file']").attr('disabled', true);
                }
                //文本
                task_name.value = form_data2.task_name
                //文本

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'task_name')) || (!form_data2['picking_order_id'] && $check_field('add', 'task_name'))) {
                } else {
                    $("#task_name").attr("disabled", true);
                    $("#task_name > input[name='file']").attr('disabled', true);
                }

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'publishing_users')) || (!form_data2['picking_order_id'] && $check_field('add', 'publishing_users'))) {
                } else {
                    $("#publishing_users").attr("disabled", true);
                    $("#publishing_users > input[name='file']").attr('disabled', true);
                }
                //文本
                item_weight.value = form_data2.item_weight
                //文本

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'item_weight')) || (!form_data2['picking_order_id'] && $check_field('add', 'item_weight'))) {
                } else {
                    $("#item_weight").attr("disabled", true);
                    $("#item_weight > input[name='file']").attr('disabled', true);
                }
                //文本
                item_type.value = form_data2.item_type
                //文本

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'item_type')) || (!form_data2['picking_order_id'] && $check_field('add', 'item_type'))) {
                } else {
                    $("#item_type").attr("disabled", true);
                    $("#item_type > input[name='file']").attr('disabled', true);
                }
                //文本
                pickup_address.value = form_data2.pickup_address
                //文本

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'pickup_address')) || (!form_data2['picking_order_id'] && $check_field('add', 'pickup_address'))) {
                } else {
                    $("#pickup_address").attr("disabled", true);
                    $("#pickup_address > input[name='file']").attr('disabled', true);
                }
                //文本
                shipping_address.value = form_data2.shipping_address
                //文本

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'shipping_address')) || (!form_data2['picking_order_id'] && $check_field('add', 'shipping_address'))) {
                } else {
                    $("#shipping_address").attr("disabled", true);
                    $("#shipping_address > input[name='file']").attr('disabled', true);
                }
                //文本
                task_commission.value = form_data2.task_commission
                //文本

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'task_commission')) || (!form_data2['picking_order_id'] && $check_field('add', 'task_commission'))) {
                } else {
                    $("#task_commission").attr("disabled", true);
                    $("#task_commission > input[name='file']").attr('disabled', true);
                }

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'quantity_received')) || (!form_data2['picking_order_id'] && $check_field('add', 'quantity_received'))) {
                } else {
                    $("#quantity_received").attr("disabled", true);
                    $("#quantity_received > input[name='file']").attr('disabled', true);
                }
                //文本
                pickup_code.value = form_data2.pickup_code
                //文本

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'pickup_code')) || (!form_data2['picking_order_id'] && $check_field('add', 'pickup_code'))) {
                } else {
                    $("#pickup_code").attr("disabled", true);
                    $("#pickup_code > input[name='file']").attr('disabled', true);
                }

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'runner')) || (!form_data2['picking_order_id'] && $check_field('add', 'runner'))) {
                } else {
                    $("#runner").attr("disabled", true);
                    $("#runner > input[name='file']").attr('disabled', true);
                }
                //文本
                full_name.value = form_data2.full_name
                //文本

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'full_name')) || (!form_data2['picking_order_id'] && $check_field('add', 'full_name'))) {
                } else {
                    $("#full_name").attr("disabled", true);
                    $("#full_name > input[name='file']").attr('disabled', true);
                }

                if (user_group === '管理员' || (form_data2['picking_order_id'] && $check_field('set', 'order_status')) || (!form_data2['picking_order_id'] && $check_field('add', 'order_status'))) {
                } else {
                    $("#order_status").attr("disabled", true);
                    $("#order_status > input[name='file']").attr('disabled', true);
                }
                layui.form.render("select");
            }

            axios_get_3()
        }


        submit.onclick = async function () {
            try {
                //文本
                form_data2.task_number = task_number.value
                //文本
                //文本
                form_data2.task_name = task_name.value
                //文本
                //文本
                form_data2.item_weight = item_weight.value
                //文本
                //文本
                form_data2.item_type = item_type.value
                //文本
                //文本
                form_data2.pickup_address = pickup_address.value
                //文本
                //文本
                form_data2.shipping_address = shipping_address.value
                //文本
                //文本
                form_data2.task_commission = task_commission.value
                //文本
                //文本
                form_data2.pickup_code = pickup_code.value
                //文本
                //文本
                form_data2.full_name = full_name.value
                //文本
            } catch (err) {
                console.log(err)
            }


            let customize_field = []
            customize_field.push({"field_name": "任务编号", "field_value": form_data2.task_number});
            customize_field.push({"field_name": "任务名称", "field_value": form_data2.task_name});
            customize_field.push({"field_name": "发布用户", "field_value": form_data2.publishing_users});
            customize_field.push({"field_name": "物品重量", "field_value": form_data2.item_weight});
            customize_field.push({"field_name": "物品类型", "field_value": form_data2.item_type});
            customize_field.push({"field_name": "取货地址", "field_value": form_data2.pickup_address});
            customize_field.push({"field_name": "送货地址", "field_value": form_data2.shipping_address});
            customize_field.push({"field_name": "任务佣金", "field_value": form_data2.task_commission});
            customize_field.push({"field_name": "领取数量", "field_value": form_data2.quantity_received});
            customize_field.push({"field_name": "取货码", "field_value": form_data2.pickup_code});
            customize_field.push({"field_name": "跑腿用户", "field_value": form_data2.runner});
            customize_field.push({"field_name": "姓名", "field_value": form_data2.full_name});
            customize_field.push({"field_name": "订单状态", "field_value": form_data2.order_status});


            if (picking_order_id == '') {
                console.log("新增/Add")
                const {data: res} = await axios.post(BaseUrl + '/api/picking_order/add?',
                    form_data2, {
                        headers: {
                            'x-auth-token': token,
                            'Content-Type': 'application/json'
                        }
                    })
                if (res.result == 1) {
                    layer.msg('确认/Confirm完毕');
                    setTimeout(function () {
                        window.location.replace("./table.jsp");
                    }, 1000)
                } else {
                    layer.msg(res.error.message);
                }
            } else {
                console.log("详情/Details")

                const {data: res} = await axios.post(BaseUrl + '/api/picking_order/set?picking_order_id=' + picking_order_id,
                    form_data2, {
                        headers: {
                            'x-auth-token': token,
                            'Content-Type': 'application/json'
                        }
                    })
                if (res.result == 1) {
                    layer.msg('确认/Confirm完毕');
                    setTimeout(function () {
                        window.location.replace("./table.jsp");
                    }, 1000)
                } else {
                    layer.msg(res.error.message);
                }
            }
        }

    })
    ;
</script>

</html>
