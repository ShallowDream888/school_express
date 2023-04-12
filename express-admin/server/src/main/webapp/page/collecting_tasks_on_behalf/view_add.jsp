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
                            <select name="interest" lay-filter="publishing_users"
                                    id="publishing_users">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-upload" id="item_picture_box">
                        <button type="button" class="layui-btn" id="item_picture">上传图片</button>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="item_picture_img">
                            <p id="demoText"></p>
                        </div>
                        <div style="width: 95px;">
                            <div class="layui-progress layui-progress-big" lay-showpercent="yes"
                                 lay-filter="item_picture">
                                <div class="layui-progress-bar" lay-percent=""></div>
                            </div>
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
                    <div class="layui-form-item" id="order_quantity_box">
                        <label class="layui-form-label">订单数量</label>
                        <div class="layui-input-block">
                            <select name="interest" lay-filter="order_quantity" id="order_quantity">
                                <option value=""></option>
                            </select>
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


                </form>
                <div class="layui-btn-container">
                    <a href="#" type="button" class="layui-btn layui-btn-normal login" id="submit">确认/Confirm</a>
                    <a href="./table.jsp" target="main_self_frame" type="button"
                       class="layui-btn layui-btn-normal login">取消/Cancel</a>
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
    let collecting_tasks_on_behalf_id = location.search.substring(1)
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
        // if (   user_group == "管理员" ||$check_action('/collecting_tasks_on_behalf/view', 'add') || $check_action('/collecting_tasks_on_behalf/view', 'set')) {
        //    submit.style.display = "block"
        // }
        // style="display: none"


        let field = "collecting_tasks_on_behalf_id";
        let url_add = "collecting_tasks_on_behalf";
        let url_set = "collecting_tasks_on_behalf";
        let url_get_obj = "collecting_tasks_on_behalf";
        let url_upload = "collecting_tasks_on_behalf"
        let query = {
            "collecting_tasks_on_behalf_id": 0,
        }

        let form_data2 = {
            "task_number": $get_stamp(), // 任务编号
            "task_name": '', // 任务名称
            "publishing_users": 0, // 发布用户
            "item_picture": '', // 物品图片
            "item_weight": '', // 物品重量
            "item_type": '', // 物品类型
            "order_quantity": '', // 订单数量
            "pickup_address": '', // 取货地址
            "shipping_address": '', // 送货地址
            "task_commission": '', // 任务佣金
            "collecting_tasks_on_behalf_id": 0, // ID
        }

        layui.layedit.set({
            uploadImage: {
                url: BaseUrl + '/api/collecting_tasks_on_behalf/upload?' //接口url
                , type: 'post' //默认post
            }
        });


        var path1

        function getpath() {
            var list_data = JSON.parse(sessionStorage.list_data)
            for (var i = 0; i < list_data.length; i++) {
                var o = list_data[i];
                if (o.path === "/collecting_tasks_on_behalf/table") {
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
            var o = $get_power("/collecting_tasks_on_behalf/view");
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
            $("#item_picture_box").show()
        } else {
            if ($check_field('add', 'item_picture')) {
                $("#item_picture_box").show()
            } else {
                $("#item_picture_box").hide()
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
            $("#order_quantity_box").show()
        } else {
            if ($check_field('add', 'order_quantity')) {
                $("#order_quantity_box").show()
            } else {
                $("#order_quantity_box").hide()
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

        //常规使用 - 普通图片上传
        var uploadInst = upload.render({
            elem: '#item_picture'
            , url: BaseUrl + '/api/collecting_tasks_on_behalf/upload?' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
            , headers: {
                'x-auth-token': token
            }, before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#item_picture_img').attr('src', fullUrl(BaseUrl, result)); //图片链接（base64）
                });

                element.progress('item_picture', '0%'); //进度条复位
                layer.msg('上传中', {icon: 16, time: 0});
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功的一些操作
                //……
                form_data2.item_picture = res.result.url
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
                element.progress('item_picture', n + '%'); //可配合 layui 进度条元素使用
                if (n == 100) {
                    layer.msg('上传完毕', {icon: 1});
                }
            }
        });


        // 订单数量选项列表
        let order_quantity_data = ['1'];


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


        async function order_quantity() {
            var order_quantity = document.querySelector("#order_quantity")
            var op1 = document.createElement("option");
            op1.value = '0'
            order_quantity.appendChild(op1)
            // 收集数据 长度
            var count
            // 收集数据 数组
            var arr = []
            count = order_quantity_data.length
            arr = order_quantity_data
            for (var i = 0; i < arr.length; i++) {
                var op = document.createElement("option");
                // 给节点赋值
                op.innerHTML = arr[i]
                op.value = arr[i]
                // 新增/Add节点
                order_quantity.appendChild(op)
                if (form_data2.order_quantity == arr[i].order_quantity) {
                    op.selected = true
                }
                layui.form.render("select");
            }
        }

        layui.form.on('select(order_quantity)', function (data) {
            form_data2.order_quantity = data.elem[data.elem.selectedIndex].text;
        })
        order_quantity()


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
        task_number.value = form_data2.task_number
        $("#task_number").attr("disabled", "disabled");
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
                                if (key == 'order_quantity') {
                                    let alls = document.querySelector('#order_quantity').querySelectorAll('option')
                                    let test = form_data2[key]
                                    for (let i = 0; i < alls.length; i++) {
                                        if (alls[i].innerHTML == test) {
                                            alls[i].selected = true
                                            form_data2.order_quantity = alls[i].text
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
                        let alls = document.querySelector('#publishing_users').querySelectorAll('option')
                        let test = res.result.obj.user_id
                        for (let i = 0; i < alls.length; i++) {
                            if (alls[i].value == test) {
                                alls[i].selected = true
                                $('#publishing_users').attr('disabled', 'disabled')
                                form_data2.publishing_users = alls[i].value
                                layui.form.render("select");
                            }
                        }
                    }
                }
            }
        }

        axios_get_4()


        if (collecting_tasks_on_behalf_id !== '') {
            async function axios_get_3() {
                const {data: rese} = await axios.get(BaseUrl + '/api/collecting_tasks_on_behalf/get_obj', {
                    params: {
                        collecting_tasks_on_behalf_id: collecting_tasks_on_behalf_id
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
                    if (key == 'order_quantity') {
                        let alls = document.querySelector('#order_quantity').querySelectorAll('option')
                        let test = data[key]
                        for (let i = 0; i < alls.length; i++) {
                            if (alls[i].innerHTML == test) {
                                alls[i].selected = true
                                form_data2.order_quantity = alls[i].text
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
                    $("#item_picture_box").show()
                } else {
                    if ($check_field('set', 'item_picture') || $check_field('get', 'item_picture')) {
                        $("#item_picture_box").show()
                    } else {
                        $("#item_picture_box").hide()
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
                    $("#order_quantity_box").show()
                } else {
                    if ($check_field('set', 'order_quantity') || $check_field('get', 'order_quantity')) {
                        $("#order_quantity_box").show()
                    } else {
                        $("#order_quantity_box").hide()
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

                // Array.prototype.slice.call(document.getElementsByTagName('input')).map(i => i.disabled = true)
                // Array.prototype.slice.call(document.getElementsByTagName('select')).map(i => i.disabled = true)
                // Array.prototype.slice.call(document.getElementsByTagName('textarea')).map(i => i.disabled = true)
                //文本
                task_number.value = form_data2.task_number
                //文本

                if (user_group === '管理员' || (form_data2['collecting_tasks_on_behalf_id'] && $check_field('set', 'task_number')) || (!form_data2['collecting_tasks_on_behalf_id'] && $check_field('add', 'task_number'))) {
                } else {
                    $("#task_number").attr("disabled", true);
                    $("#task_number > input[name='file']").attr('disabled', true);
                }
                //文本
                task_name.value = form_data2.task_name
                //文本

                if (user_group === '管理员' || (form_data2['collecting_tasks_on_behalf_id'] && $check_field('set', 'task_name')) || (!form_data2['collecting_tasks_on_behalf_id'] && $check_field('add', 'task_name'))) {
                } else {
                    $("#task_name").attr("disabled", true);
                    $("#task_name > input[name='file']").attr('disabled', true);
                }

                if (user_group === '管理员' || (form_data2['collecting_tasks_on_behalf_id'] && $check_field('set', 'publishing_users')) || (!form_data2['collecting_tasks_on_behalf_id'] && $check_field('add', 'publishing_users'))) {
                } else {
                    $("#publishing_users").attr("disabled", true);
                    $("#publishing_users > input[name='file']").attr('disabled', true);
                }

                if (user_group === '管理员' || (form_data2['collecting_tasks_on_behalf_id'] && $check_field('set', 'item_picture')) || (!form_data2['collecting_tasks_on_behalf_id'] && $check_field('add', 'item_picture'))) {
                } else {
                    $("#item_picture").attr("disabled", true);
                    $("#item_picture > input[name='file']").attr('disabled', true);
                }
                //文本
                item_weight.value = form_data2.item_weight
                //文本

                if (user_group === '管理员' || (form_data2['collecting_tasks_on_behalf_id'] && $check_field('set', 'item_weight')) || (!form_data2['collecting_tasks_on_behalf_id'] && $check_field('add', 'item_weight'))) {
                } else {
                    $("#item_weight").attr("disabled", true);
                    $("#item_weight > input[name='file']").attr('disabled', true);
                }
                //文本
                item_type.value = form_data2.item_type
                //文本

                if (user_group === '管理员' || (form_data2['collecting_tasks_on_behalf_id'] && $check_field('set', 'item_type')) || (!form_data2['collecting_tasks_on_behalf_id'] && $check_field('add', 'item_type'))) {
                } else {
                    $("#item_type").attr("disabled", true);
                    $("#item_type > input[name='file']").attr('disabled', true);
                }

                if (user_group === '管理员' || (form_data2['collecting_tasks_on_behalf_id'] && $check_field('set', 'order_quantity')) || (!form_data2['collecting_tasks_on_behalf_id'] && $check_field('add', 'order_quantity'))) {
                } else {
                    $("#order_quantity").attr("disabled", true);
                    $("#order_quantity > input[name='file']").attr('disabled', true);
                }
                //文本
                pickup_address.value = form_data2.pickup_address
                //文本

                if (user_group === '管理员' || (form_data2['collecting_tasks_on_behalf_id'] && $check_field('set', 'pickup_address')) || (!form_data2['collecting_tasks_on_behalf_id'] && $check_field('add', 'pickup_address'))) {
                } else {
                    $("#pickup_address").attr("disabled", true);
                    $("#pickup_address > input[name='file']").attr('disabled', true);
                }
                //文本
                shipping_address.value = form_data2.shipping_address
                //文本

                if (user_group === '管理员' || (form_data2['collecting_tasks_on_behalf_id'] && $check_field('set', 'shipping_address')) || (!form_data2['collecting_tasks_on_behalf_id'] && $check_field('add', 'shipping_address'))) {
                } else {
                    $("#shipping_address").attr("disabled", true);
                    $("#shipping_address > input[name='file']").attr('disabled', true);
                }
                //文本
                task_commission.value = form_data2.task_commission
                //文本

                if (user_group === '管理员' || (form_data2['collecting_tasks_on_behalf_id'] && $check_field('set', 'task_commission')) || (!form_data2['collecting_tasks_on_behalf_id'] && $check_field('add', 'task_commission'))) {
                } else {
                    $("#task_commission").attr("disabled", true);
                    $("#task_commission > input[name='file']").attr('disabled', true);
                }
                let item_picture_img = document.querySelector("#item_picture_img")
                item_picture_img.src = fullUrl(BaseUrl, form_data2.item_picture)
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
            } catch (err) {
                console.log(err)
            }


            let customize_field = []
            customize_field.push({"field_name": "任务编号", "field_value": form_data2.task_number});
            customize_field.push({"field_name": "任务名称", "field_value": form_data2.task_name});
            customize_field.push({"field_name": "发布用户", "field_value": form_data2.publishing_users});
            customize_field.push({
                "field_name": "物品图片",
                "field_value": form_data2.item_picture,
                "type": "image"
            });
            customize_field.push({"field_name": "物品重量", "field_value": form_data2.item_weight});
            customize_field.push({"field_name": "物品类型", "field_value": form_data2.item_type});
            customize_field.push({"field_name": "订单数量", "field_value": form_data2.order_quantity});
            customize_field.push({"field_name": "取货地址", "field_value": form_data2.pickup_address});
            customize_field.push({"field_name": "送货地址", "field_value": form_data2.shipping_address});
            customize_field.push({"field_name": "任务佣金", "field_value": form_data2.task_commission});


            if (collecting_tasks_on_behalf_id == '') {
                console.log("新增/Add")
                const {data: res} = await axios.post(BaseUrl + '/api/collecting_tasks_on_behalf/add?',
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

                const {data: res} = await axios.post(BaseUrl + '/api/collecting_tasks_on_behalf/set?collecting_tasks_on_behalf_id=' + collecting_tasks_on_behalf_id,
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
