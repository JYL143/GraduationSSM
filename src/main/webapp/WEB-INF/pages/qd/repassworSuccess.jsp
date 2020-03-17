
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重置密码</title>
    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">
    <script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/registerk.css">


</head>
<body>

<section id="repasswordfrom">
    <form action="#" style="margin-top: 100px"  method="post" >
        <div style="width: 100%">
            <a href="/yunmi/index"> <img src="<%=path%>/qt_img/logo_top.png" style="width: 65px;height: 65px;margin-left:157px;"></a>
        </div>
        <div style="margin-top: 27px">
            <p style="font-size: 32px;margin-left:-11px;color: black;text-align: center">重置密码</p>
        </div>
        <div class="register-box"  style="margin-top: 51px">
            <label  class="other_label">
                设 置 密 码
                <input maxlength="20" type="password" name="password" placeholder="请输入密码">
            </label>
            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg2" ></p>
            </div>
        </div>
        <div class="register-box">
            <label  class="other_label">
                确 认 密 码
                <input maxlength="20" type="password" name="password2" placeholder="请再次输入密码">
            </label>
            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg3" ></p>
            </div>
        </div>

        <input type="text"   readonly="readonly" id="submit_btn" value="立即修改"style="width: 100%; height: 55px;background-color: #ee7700;
                border: none; color: white;font-size: 18px;text-align: center;">

    </form>
</section>

</body>

<script>

    //	----------------------------------点击修改按钮	----------------------------------
    $("#submit_btn").click(function(){

        var password = $("input[name=password]").val();
        var password2 = $("input[name=password2]").val();
        var passwordzzbds= /^[\w~!@#$%^\[\]]{3,16}$/  ;

        if(password.length==0 ){
            $("#msg1").text("");
            $("#msg2").text("请输入密码！");
            $("#msg3").text("");
        }else if(!passwordzzbds.test(password)){
            $("#msg2").text("密码必须为3-16位，且不包含空白字符！");
            $("#msg3").text("");
        } else  if(password2.length==0 ||password!=password2){
            $("#msg2").text("");
            $("#msg3").text("两次密码不相同！");
        }else{

            $.ajax({
                url:"/login/updatePassword?password="+password,
                type:"get",
                success:function (result) {

                     alert("修改密码成功，请重新登录！");
                    window.location.href="/login/yunlogin";
                }
            });
        }




    });

</script>
</html>