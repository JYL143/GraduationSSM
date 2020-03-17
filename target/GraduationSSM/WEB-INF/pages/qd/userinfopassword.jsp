
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">
    <script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/registerk.css">


</head>
<body>

<section id="repasswordfrom">
    <form action="#" style="margin-top: 100px"  method="post" >
        <div style="width: 100%">
            <a href="/yunmi/userinfo"> <img src="<%=path%>/qt_img/logo_top.png" style="width: 65px;height: 65px;margin-left:157px;"></a>
        </div>
        <div style="margin-top: 27px">
            <p style="font-size: 32px;margin-left:-11px;color: black;text-align: center">修改密码</p>
        </div>
        <div class="register-box"  style="margin-top: 51px">
            <label  class="other_label">
                 原 密 码
                <input maxlength="20" type="password" name="password3" placeholder="请输入原密码">
            </label>
            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg1" ></p>
            </div>
        </div>
        <div class="register-box"  >
            <label  class="other_label">
                 新 密 码
                <input maxlength="20" type="password" name="password" placeholder="请输入新密码">
            </label>
            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg2" ></p>
            </div>
        </div>
        <div class="register-box">
            <label  class="other_label">
                确 认 密 码
                <input maxlength="20" type="password" name="password2" placeholder="请再次输入新密码">
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
    var pas;//保存原密码
    //	----------------------------------点击修改按钮	----------------------------------
    $("#submit_btn").click(function(){
        var password3 = $("input[name=password3]").val();
        var password = $("input[name=password]").val();
        var password2 = $("input[name=password2]").val();
        var passwordzzbds= /^[\w~!@#$%^\[\]]{3,16}$/  ;

        if(password3.length==0 ){
            $("#msg1").text("请输入原密码！");
        }else{
            //查询原密码
            $.ajax({
                url:"/login/findPassword",
                type:"get",
                success:function (result) {
                    pas=result;
                    if (password3!=result){
                        alert("原密码输入错误，请重新输入！")
                        $("#msg1").text("原密码输入错误，请重新输入！");
                    } else{
                        $("#msg1").text("");
                        if (password==result){
                            $("#msg2").text("新密码与旧密码相同！");
                        }else if(!passwordzzbds.test(password)){
                            $("#msg2").text("密码必须为3-16位，且不包含空白字符！");
                            $("#msg3").text("");
                        }else  if(password2.length==0 || password!=password2){
                            $("#msg2").text("");
                            $("#msg3").text("两次密码不相同！");
                        }else{
                            $("#msg3").text("");
                            $.ajax({
                                url:"/login/updatePassword?password="+password,
                                type:"get",
                                success:function (result) {
                                    alert("修改密码成功!");
                                    window.location.href="/yunmi/userinfo";
                                }
                            });
                        }
                    }
                }
            });
        }




    });

</script>
</html>