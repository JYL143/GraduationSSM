<
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>重设密码</title>
    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">

    <link href="<%=path %>/css/layout.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/css/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=path %>/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/js.js"></script>

</head>
<style>
    .ibar {display: none;}
</style>
<body class="login-bg">
<div class="main ">
    <!--登录-->
    <div class="login-dom login-max">
        <div class="logo text-center">
            <a href="#">
                <img src="<%=path %>/images/logo.png" width="180px" height="180px">
            </a>
        </div>
        <div class="login container " id="login">
            <p class="text-big text-center logo-color">
                同一个账号，连接一切
            </p>
            <p class=" text-center margin-small-top logo-color text-small">
                控制台 | 云平台 | 论坛 | 云市场
            </p>
            <form class="login-form" action="/login/repassword_update/${phone}" method="post" autocomplete="off">
                <div class="login-box border text-small" id="box">
                    <div class="pwd">
                        <input type="text" placeholder="请输入新密码" id="password" name="password" >
                    </div>
                    <div class="pwd">
                        <input type="password" placeholder="请再次输入新密码" id="password2" name="password2" >
                    </div>
                    <span style="color: red;font-size: 13px" >${msg}</span>
                </div>
                <input type="hidden" name="formhash" value="5abb5d21"/>
                <input type="submit" class="btn text-center login-btn" value="确认密码">
            </form>

        </div>
    </div>

    <div class="footer text-center text-small ie">
        Copyright 2013-2016 云米科技有限公司 版权所有 <a href="#" target="_blank">滇ICP备13005806号</a>
        <span class="margin-left margin-right">|</span>
        <script src="#" language="JavaScript"></script>
    </div>
    <div class="popupDom">
        <div class="popup text-default">
        </div>
    </div>
</div>
</body>



</html>