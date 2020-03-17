
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>找回密码</title>
    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">

    <link href="<%=path %>/css/layout.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/css/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/js.js"></script>


    <style>
        .gt_ajax_tip .ready{right: -56px;}
    </style>
</head>

<body class="login-bg">
<div class="main ">
    <!--登录-->
    <div class="login-dom login-max">
        <div class="logo text-center">
            <a href="#">
                <img src="<%=path %>/images/logo.png" width="180" height="180">
            </a>
        </div>
        <div class="login container " id="login">
            <p class="text-big text-center logo-color">
                创建云米账号，驰骋电子商务
            </p>
            <p class=" text-center margin-small-top logo-color text-small">
                控制台 | 云平台 | 论坛 | 云市场
            </p>
<%--            <form class="register-form" action="#" method="post" autocomplete="off">--%>
                <div class="reg-wrap border">
                    <div class="reg-number border-bottom">
                        <div class="fl reg-area text-gray">+86</div>
                        <input type="text" class="fl reg-phone" name="mobile" id="mobile" placeholder="请输入管理员手机号码" />
                    </div>
                    <div class="reg-number">
                        <input type="text" name="vcode" id="vcode" class="fl padding-big-left reg-code" placeholder="请输入验证码" />
                        <a href="#" class="fl reg-send" id="send">发送验证码</a>
                    </div>
                    <span style="color: red;font-size: 13px" >${msg}</span>
                </div>
                <input type="hidden" name="formhash" value="5abb5d21"/>
                <input type="text" class="btn text-center login-btn"  id="repassword" value="找回密码">
                <div class="forget">
                    <a href="/login/repassword" class="forget-pwd text-small fl">忘记登录密码？</a>
                    <a href="/login/login1" class="forget-new text-small fr" id="forger-login">已有账号，立即登录</a>
                </div>
<%--            </form>--%>
        </div>
    </div>
    <div class="footer text-center text-small ie">
        Copyright 2013-2016 云米科技有限公司 版权所有
        <a href="#" target="_blank">滇ICP备13005806号</a>
        <span class="margin-left margin-right">|</span>
        <script src="#" language="JavaScript"></script>
    </div>
    <div class="popupDom">
        <div class="popup text-default">
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="Js/Validform_v5.3.2_min.js"></script>

<script type="text/javascript">
    var yzm; //保存控制台获取到的正确的验证码然后用来给找回密码做比较
    var phone; //保存输入正确的手机号（而且是管理员的手机号，给重新设置密码修改数据库提供要改的人）
    var status; //保存查询手机号是不是管理员的，状态码 0表示不是，1表示是
//----------------------------------点击发送验证码按钮-----------------------------------------------
    /*发送验证码*/
    $("#send").click(function() {

        var obj = $("input[name=mobile]").val();

        var regmobile = /^1\d{10}$/;  //正则表达式，第一位必须是1，长度为11
        if (obj == "") {
            popup("请输入手机号码");
            obj.focus();
        }else  if(!regmobile.test(obj)){  //校验手机号码信息
            popup("请输入正确的手机号码");
            obj.focus();
        }else{
            //倒计时
            var that = $(this)
            var timeo = 60;
            var timeStop = setInterval(function(){
                timeo--;
                if (timeo>0) {
                    that.text( timeo +'s');
                    that.attr('disabled','disabled');//禁止点击
                }else{
                    timeo = 60;//当减到0时赋值为60
                    that.text('重新获取');
                    clearInterval(timeStop);//清除定时器
                    that.removeAttr('disabled');//移除属性，可点击
                }
            },1000)

            phone=obj;//保存输入正确的手机号（而且是管理员的手机号，给重新设置密码修改数据库提供要改的人）

            $.ajax({
                url:"/login/getlevlelphone?mobile="+obj,  //查询手机号是不是管理员
                type:"GET",
                success:function (result) {
                    if (result==1){
                        $.ajax({
                            url:"/login/sendmessage?mobile="+obj,  //发送短信验证码
                            type:"GET",
                            success:function (result) {
                                yzm=result;
                                popup("发送验证码成功，请接收");
                                obj.focus();

                            }
                        });

                    }else {
                        alert("请输入管理员手机号码！");
                        window.location.href="/login/repassword";
                        // popup("请输入管理员手机号码");
                        // obj.focus();

                    }

                }
            });


        }
    });



//----------------------------------点击找回密码按钮(验证  验证码是否正确)-----------------------------------------------
    $("#repassword").click(function() {

        var vcode = $("input[name=vcode]").val();
        if (vcode == "") {
            popup("请输入验证码");
            vcode.focus();
        }else  if(vcode.length != 6) {
            popup("请输入长度为6的验证码");
            vcode.focus();
        }else if(vcode != yzm){
            popup("验证码不正确，请重新输入");
            vcode.focus();
        }else{
            window.location.href="/login/repassword_succes?phone="+phone;//跳转到重设密码页
        }
    });
</script>
</html>


