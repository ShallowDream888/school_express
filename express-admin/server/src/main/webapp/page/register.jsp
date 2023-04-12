<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="register">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/diy.css">

    <script src="../js/axios.min.js"></script>
</head>

<body>
<article class="sign_in">
    <div class="warp">
        <div class="layui-container">
            <div class="layui-row">
                <div>
            <span>
              <h1>注册/Register</h1>
            </span>
                </div>
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">账号：</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入账号"
                                   class="layui-input" id="username">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="password" placeholder="5-16个字符" autocomplete="off"
                                   class="layui-input"
                                   id="password">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="password" placeholder="5-16个字符" autocomplete="off"
                                   class="layui-input"
                                   id="confirm_password">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">昵称：</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="请输入昵称"
                                   class="layui-input" id="nickname">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱：</label>
                        <div class="layui-input-block">
                            <input type="email" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="例:test@.com"
                                   class="layui-input" id="email">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号：</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="例:18315652656"
                                   class="layui-input" id="phone">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">身份</label>
                        <div class="layui-input-block">
                            <select name="interest" id="user_group" lay-filter="user_group">
                                <option value=""></option>
                            </select>
                        </div>
                    </div>

                                    
                </form>
                <div class="layui-btn-container">
                    <a href="#" type="button" class="layui-btn layui-btn-normal" id="enroll">注册/Register</a>
                    <a href="../login.jsp" type="button" class="layui-btn layui-btn-normal">返回/Back</a>
                </div>
            </div>
        </div>
    </div>
</article>
</body>

<script src="../layui/layui.js" charset="utf-8"></script>
<script src="../js/index.js"></script>
<script src="../js/base.js"></script>
<script>
    // layui模块导入
    var BaseUrl = baseUrl()
    layui.use(['element', 'layer', 'util', 'jquery'], function () {
        var element = layui.element
                , layer = layui.layer
                , util = layui.util
                , table = layui.table
                , upload = layui.upload
                , laydate = layui.laydate
                , layedit = layui.layedit
                , form = layui.form
                , $ = layui.$;

        let form1 = {
            username: "",
            password: "",
            nickname: "",
            email: "",
            phone: "",
            user_group: ""
        }

        let from_data = {}

        // 获取用户单选框数据
        async function enroll_select() {
            let choose = [];
            const {data: res} = await axios.get(BaseUrl + '/api/user_group/get_list?register_min=1&register_max=2')
            let info = res;
            let chooser = info.result.list;
            for (let i = 0; i < chooser.length; i++) {
                // 拿到单选框的父级节点
                var select = document.getElementById('user_group');
                var op = document.createElement("option");
                op.setAttribute('source_table', chooser[i].source_table)
                op.innerHTML = chooser[i].name
                op.value = i + 1
                // 新增/Add节点
                select.appendChild(op)
                layui.form.render("select");
            }
        }


        let username = document.getElementById("username")
        let password = document.getElementById("password")
        let nickname = document.getElementById("nickname")
        let email = document.getElementById("email")
        let phone = document.getElementById("phone")
        let enroll = document.getElementById("enroll")




                        
        let num = null
        let source_table = null
        let token = null

        // 下拉框的显示隐藏
        layui.form.on('select(user_group)', function (data) {
            from_data = {}
            let text = data.elem[data.elem.selectedIndex].text
            form1['user_group'] = text
            source_table = $(data.elem).find("option:selected").attr("source_table")
            num = data.value
            let item = document.querySelectorAll('.diy_sf')

            for (let i = 0; i < item.length; i++) {
                if (source_table === item[i].id) {
                    item[i].style.display = 'block'
                } else {
                    item[i].style.display = 'none'
                }
            }

        });

        // 数据
                        
        enroll.onclick = async function () {
            form1['username'] = username.value;
            form1['password'] = password.value;
            form1['nickname'] = nickname.value;
            form1['email'] = email.value;
            form1['phone'] = phone.value;


            // 正则判断
            var email_regular = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
            var phone_regular = /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;

            // 表单验证
            if (!username.value) {
                layer.msg('账号不能为空');
            } else if (username.value.length > 16 || username.value.length < 5) {
                layer.msg('账号长度应为5到16个字符之间');
            } else if (!password.value) {
                layer.msg('密码不能为空');
            } else if (password.value.length > 16 || password.value.length < 5) {
                layer.msg('密码长度应为5到16个字符之间');
            } else if (nickname.value && nickname.value.length > 12 || nickname.value.length < 2) {
                layer.msg('昵称长度应为2个字符到12个字符之间');
            } else if (email.value && !email_regular.test(email.value)) {
                layer.msg('请输入正确的邮箱地址 例：test@test.com!');
            } else if (phone.value && !phone_regular.test(phone.value)) {
                layer.msg('请输入正确的手机号码 例：18955552312!');
            } else if (password.value != confirm_password.value) {
                layer.msg('确认密码与密码不一致！');
            } else if (!form1.user_group) {
                layer.msg('请选择用户组!');
            } else if (form1.user_group) {

                                            }
        }

        var list_data = []

        /**
         * 获取路径对应操作权限 鉴权
         * @param {String} action 操作名
         */
        function $check_register_field(action, field , path) {
            let o = $get_power(path);
            let auth;
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
            let list = list_data;
            let obj;
            for (let i = 0; i < list.length; i++) {
                let o = list[i];
                if (o.path === path) {
                    obj = o;
                    break;
                }
            }
            return obj;
        }

        function $get_list_data(){
            if (!sessionStorage.personInfo){
                $.ajax({
                    url: BaseUrl + "/api/auth/get_list",
                    type: "get",
                    async: false,
                    data: {
                        user_group: "游客"
                    },
                    success: function (data) {
                        if (typeof data === 'string'){
                            data = JSON.parse(data)
                        }
                        if (data && data.result && data.result.list){
                            list_data = data.result.list
                            enroll_select();
                            $check_list_data();
                        }
                    }
                });
            }else {
                list_data = JSON.parse(sessionStorage.list_data);
                enroll_select();
                $check_list_data();
            }

        }

        function $check_list_data(){
                                    }

        $get_list_data()
    })

    function getRandomImg() {
        const num = Math.ceil(Math.random() * 5) + '.png'
        return ('../img/' + num)
    }
</script>

</html>
