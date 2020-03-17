
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">
    <script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/registerk.css">


</head>
<body>

<section id="repasswordfrom">
    <form action="#" style="margin-top: 100px"  method="post" >
        <div style="width: 100%">
            <a href="/yunmi/login"> <img src="<%=path%>/qt_img/logo_top.png" style="width: 65px;height: 65px;margin-left:157px;"></a>
        </div>
        <div style="margin-top: 27px">
            <p style="font-size: 32px;margin-left:-11px;color: black;text-align: center">找回密码</p>
        </div>
        <div class="register-box" style="margin-top: 51px">
            <label  class="username_label">
                用 户 名
                <input maxlength="20" type="text" id="username"  name="username"  placeholder="您的用户名">
            </label>
            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg1" ></p>
            </div>
        </div>

        <div class="register-box">
            <label  class="other_label" >
                        <span>
                            中国 +086
                        </span>
                <input class="phone" maxlength="20"  type="text" name="phone" placeholder="请输入绑定的手机号">
                <a href="#" style="margin-left: 15px;flood-color: black"  id="send" >获取验证码</a>
            </label>

            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg4" ></p>
            </div>
        </div>
        <div class="register-box">
            <label  class="other_label">
                验 证 码 :
                <input maxlength="20"  name="vcode" type="text" placeholder="请输入验证码">
            </label>
            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg5" ></p>
            </div>

        </div>

        <input type="text"   readonly="readonly" id="submit_btn" value="立即找回"style="width: 100%; height: 55px;background-color: #ee7700;
                border: none; color: white;font-size: 18px;text-align: center;">

    </form>
</section>

</body>

<script>
    var yzm; //保存控制台获取到的正确的验证码
    var obj;//保存输入框的手机号
    var yzmstock=0;//保存是否发送验证码 0表示没有发送，1表示已经发送
    var username;//保存用户名传到修改密码页
    //----------------------------------点击发送验证码按钮-----------------------------------------------
    /*发送验证码*/
    $("#send").click(function() {

         username = $("input[name=username]").val();
        if (username.length==0){
            $("#msg1").text("请输入用户名！");
        }else{
            $("#msg1").text("");
            obj = $("input[name=phone]").val();

            var regmobile = /^1\d{10}$/;  //正则表达式，第一位必须是1，长度为11
            if (obj == "") {
                $("#msg4").text("请输入手机号！");
            }else  if(!regmobile.test(obj)){  //校验手机号码信息
                $("#msg4").text("手机号码格式不正确！");

            }else{
                $("#msg4").text(""); //成功就清空之前可能错误的提示消息

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
                    url:"/login/getphone?mobile="+obj,  //查询手机号是否已经注册
                    type:"GET",
                    success:function (result) {
                        if (result==1){
                            $.ajax({
                                url:"/login/findUserNameByPhone",  //查询该手机号的用户名是不是输入框上的用户名
                                type:"POST",
                                data:$("#repasswordfrom form").serialize(),
                                success:function (result) {

                                    if (result==1){

                                        $.ajax({
                                            url:"/login/sendmessage?mobile="+obj,  //发送短信验证码
                                            type:"GET",
                                            success:function (result) {
                                                yzm=result;
                                                yzmstock=1;
                                                alert("发送验证码成功，请接收！");
                                            }
                                        });
                                    }else{
                                        alert("该手机号绑定的用户账号不是："+username+",请重新输入正确的用户名与手机号！");
                                        window.location.href="/login/repassword2";
                                    }
                                }
                            });

                        }else {
                            alert("该手机号还未注册，请先注册！");
                            window.location.href="/login/repassword2";

                        }

                    }
                });

            }
        }

    });


    //	----------------------------------点击找回密码按钮	----------------------------------
    $("#submit_btn").click(function(){
        if (yzmstock==0){//还没发送验证码

            alert("您还没发送验证码，请先发送验证码！");
        } else{
            //判断验证码是否正确
            var vcode = $("input[name=vcode]").val();
            if (vcode == "") {
                $("#msg5").text("请输入验证码！");

            }else  if(vcode.length != 6) {

                $("#msg5").text("请输入长度为6的验证码！");
            }else if(vcode != yzm){

                $("#msg5").text("验证码不正确，请重新输入！");
            }else{
                $("#msg5").text("");
                window.location.href="/login/repassworSuccess?username="+username;//跳转到修改密码页
            }
        }


    })

</script>
</html>