<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>云米商城-登录</title>

    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">
    <script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
    <link   rel="stylesheet" type="text/css"  href="<%=path %>/css/bootstrap.min.css"  >
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/public.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/page.css" />

    <style>
        .show {
            display: block;
        }
        .close{
            display:none;
        }
    </style>
</head>
<body>


<!-- 登录页面头部 -->
<div class="logHead">
    <a href="/yunmi/index"> <img src="<%=path %>/images/yunmilogo.jpg" style="height:70px;width: 205px;"/></a>
</div>
<!-- 登录页面头部结束 -->

<div class="logDiv" >
    <img class="logBanner" src="<%=path %>/images/loginbg.jpg" />

    <div class="logGet " style="height: 500px">
        <!-- 头部提示信息 -->
        <div class="logD logDtip"  >
            <p class="p1" >账号登录</p>
        </div>
        <!-- 默认显示的 -->
        <div class="show"  id="k1" >
            <form class="login-form" action="/login/yundl" method="post" autocomplete="off">
            <!-- 输入框 -->
            <div class="lgD">
                <img class="img1" src="<%=path %>/images/logName.png" />
                <input style="background:rgb(250,255,189);" type="text"placeholder="输入用户名"  name="username"/>
            </div>
            <div class="lgD">
                <img class="img1" src="<%=path %>/images/logPwd.png" />
                <input style="background: rgb(250,255,189);" type="password"placeholder="输入用户密码" name="password" />
                <span style="color: red;font-size: 13px" >${msg}</span>

                <span style="color: forestgreen;font-size: 13px" >${msg2}</span>
            </div>

            <div class="logC">
                <input type="submit" class="btn text-center login-btn" value="登录" style="width: 100%; height: 45px;background-color: #ee7700;
                border: none; color: white;font-size: 18px;">
            </div>
            </form>
            <div style="margin-top: 10px;">
                <a href="#" onclick="a()" style="color: #EE7700;font-size: 14px;margin-left: 28px">手机短信登录</a>
                <a href="/login/yunregister" style="color: darkgrey;font-size: 13px;margin-left: 90px">立即注册</a>
                &nbsp; |&nbsp;
                <a href="/login/repassword2" style="color: darkgrey;font-size: 13px;">忘记密码?</a>
            </div>
        </div>

        <!-- 隐藏的，切换后的 -->
        <div id="k2" class="close">


            <!-- 输入框 -->
            <div style="float: left;margin-bottom: 20px; margin-left: 26px;" >
                <input  style="background: rgb(250,255,189);width: 305px; height: 39px;" type="text" name="mobile" id="mobile" placeholder="手机号码" />
            </div>

            <div   style="float: left;margin-bottom: 20px; margin-left: 26px;">

                <input  style="background: rgb(250,255,189);width: 200px; height: 39px;"  name="vcode" id="vcode" type="text" placeholder="短信验证码" />
                <a href="#" style="margin-left: 5px;height: 40px;width: 100px;flood-color: black"  id="send" >获取验证码</a>

            </div>

            <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msgp" ></p>
            <div class="logC">
                <input type="text" readonly="readonly" class="btn text-center login-btn"  id="modeldl" value="立即登录" style="width: 100%; height: 45px;background-color: #ee7700;
                border: none; color: white;font-size: 18px;">
            </div>

            <div style="margin-top: 10px;">
                <a href="#" onclick="b()" style="color: #EE7700;font-size: 14px;margin-left: 28px">用户名密码登录</a>
            </div>

        </div>


<%--        <!-- 其他方式登录-->--%>
<%--        <div style="margin-top: 90px;">--%>

<%--            <div style="border-bottom: 1px solid darkgrey;width:105px;margin-left: 30px;float: left;margin-top: 10px;"></div>--%>
<%--            <div style="float: left;">--%>
<%--                <span style="color: darkgrey;">用其他方式登录</span>--%>
<%--            </div>--%>
<%--            <div style="border-bottom: 1px solid darkgrey;width:105px;float: left;margin-top: 10px;"></div>--%>
<%--        </div>--%>

<%--        <div style="clear:both">--%>
<%--            <a href="#"><img src="<%=path %>/images/qqlogo.png" style="width: 33px;height: 33px;margin-left: 130px;margin-top: 30px; border-radius:100%; overflow:hidden;" /></a>--%>
<%--            <a href="#"><img src="<%=path %>/images/wxlogo.png" style="width: 33px;height: 33px;margin-left: 30px;margin-top: 30px; border-radius:100%; overflow:hidden;" /></a>--%>
<%--        </div>--%>


    </div>


</div>

<!--底部国际化-->
<div class="logFoot" style="margin-top: 60px;">
<%--    <a href="#">简体</a> &nbsp; &nbsp;|&nbsp; &nbsp;--%>
<%--    <a href="#">English</a>--%>
    <p class="p2" style="color: darkgrey;font-size: 15px;margin-top: 10px;">云米科技有限公司版权所有-浙ICP备10046444-浙东网安备11010802020134号-浙ICP证110579号</p>
</div>


<script >

    //点击手机登录
    function a() {
        var divEle1= document.getElementById('k1');
        divEle1.className='close';
        var divEle2= document.getElementById('k2');
        divEle2.className='show';
    }
    function b() {
        var divEle2= document.getElementById('k2');
        divEle2.className='close';
        var divEle1= document.getElementById('k1');
        divEle1.className='show';

    }


    var yzm; //保存控制台获取到的正确的验证码然后用来给找回密码做比较
    var status; //保存查询手机号是不是注册用户的 状态码 0表示不是，1表示是
    var obj;     //保存输入框的手机号
    //----------------------------------点击发送验证码按钮-----------------------------------------------
    /*发送验证码*/
    $("#send").click(function() {
         obj = $("input[name=mobile]").val();

        var regmobile = /^1\d{10}$/;  //正则表达式，第一位必须是1，长度为11
        if (obj == "") {
         $("#msgp").text("请输入手机号！");
        }else  if(!regmobile.test(obj)){  //校验手机号码信息
            $("#msgp").text("手机号码格式不正确！");

        }else{
            $("#msgp").text("");//成功就清空之前可能错误的提示消息
            //倒计时
            var that = $(this);
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
            },1000);



            $.ajax({
                url:"/login/getphone?mobile="+obj,  //查询手机号是不是管理员
                type:"GET",
                success:function (result) {
                    if (result==1){

                        $.ajax({
                            url:"/login/sendmessage?mobile="+obj,  //发送短信验证码
                            type:"GET",
                            success:function (result) {
                                yzm=result;

                                alert("发送验证码成功，请接收！");
                            }
                        });

                    }else {
                        alert("此手机号还未注册，请输入正确的手机号，如未有账户，请先注册")
                        window.location.href="/login/yunlogin";

                    }

                }
            });

        }
    });


    //----------------------------------点击立即登录(验证  验证码是否正确)-----------------------------------------------
    $("#modeldl").click(function() {

        var vcode = $("input[name=vcode]").val();
        if (vcode == "") {
            $("#msgp").text("请输入验证码！");

        }else  if(vcode.length != 6) {

            $("#msgp").text("请输入长度为6的验证码！");
        }else if(vcode != yzm){

            $("#msgp").text("验证码不正确，请重新输入！");
        }else{

            window.location.href="/login/phonedl?phone="+obj;//跳转到手机号登录
        }
    });

</script>
</body>
</html>