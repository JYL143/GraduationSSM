
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>完善用户信息</title>
    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">
    <script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/registerk.css">



</head>
<body>

<section id="userform">
    <form action="#" style="margin-top: 40px"  method="post" >
        <div style="width: 100%">
            <a href="/yunmi/index"> <img src="<%=path%>/qt_img/logo_top.png" style="width: 60px;height: 60px;margin-left:163px;"></a>
        </div>
        <div style="margin-top: 27px">
            <p style="font-size: 26px;margin-left:-13px;color: black;text-align: center">完善用户信息</p>
        </div>
        <div class="register-box" style="margin-top: 30px">
            <label  class="other_label">
                真 实 姓 名:
                <input maxlength="20" type="text"  name="realname"  placeholder="您的真实姓名">
            </label>
            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg1" ></p>
            </div>
        </div>
        <div style="margin-bottom: 32px;width: 400px;height: 52px;border: 1px solid #ddd">
               <p style="font-size: 15px;float: left;margin-left: 60px;margin-top: 16px">性 别：</p>
                <input  type="radio" name="sex"   value="男"  checked="checked" style="margin-top: 20px;margin-left: 15px"> 男
                <input  type="radio" name="sex"   value="女" style="margin-top: 20px;margin-left: 5px">女

        </div>
        <div class="register-box">
            <label  class="other_label">
               身 份 证 号:
                <input maxlength="40" type="text" name="cardid" placeholder="18位身份证号码">
            </label>
            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg2" ></p>
            </div>
        </div>
        <div class="register-box">
            <label  class="other_label">
                收 货 地 址:
                <input maxlength="20"  style="width: 250px" type="text" name="useraddress" placeholder="收货地址">
            </label>
            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg3" ></p>
            </div>
        </div>
        <div class="register-box">
            <label  class="other_label">
                邮 政 编 码:
                <input maxlength="20" type="text" name="zipcode" placeholder="6位邮政编码">
            </label>
            <div class="tips">
                <p style="color: red;font-size: 13px;clear: both;margin-left: 26px" id="msg4" ></p>
            </div>
        </div>
        <input type="text"   readonly="readonly" id="submit_btn" value="填写完毕"style="width: 100%; height: 55px;background-color: #ee7700;
                border: none; color: white;font-size: 18px;text-align: center;">

    </form>
</section>

</body>

<script>





    //	----------------------------------点击注册按钮	----------------------------------
    $("#submit_btn").click(function(){
        var realname = $("input[name=realname]").val();
        var cardid = $("input[name=cardid]").val();
        var useraddress = $("input[name=useraddress]").val();
        var zipcode = $("input[name=zipcode]").val();
        // var realnamezzbds=    /^[\u4e00-\u9fa5\w]{2,4}$/
        var zipcodezzbds= /^[\w~!@#$%^\[\]]{18}$/;


        if (realname.length==0){
            $("#msg1").text("请输入用户名！");
        } else  if(cardid.length==0 ){
            $("#msg1").text("");
            $("#msg2").text("请输入身份证号！");
        }else if(!zipcodezzbds.test(cardid)){
            $("#msg1").text("");
            $("#msg2").text("身份证号码格式不正确");
        }else  if(useraddress.length==0 ){
            $("#msg1").text("");
            $("#msg2").text("");
            $("#msg3").text("请输入收货地址！");
        } else  if(zipcode.length==0 ){
            $("#msg1").text("");
            $("#msg2").text("");
            $("#msg3").text("");
            $("#msg4").text("请输入邮政编码！");
        } else  if(zipcode.length!=6 ){
            $("#msg1").text("");
            $("#msg2").text("");
            $("#msg3").text("");
            $("#msg4").text("邮政编码格式不正确！");
        } else{
            $("#msg1").text("");
            $("#msg2").text("");
            $("#msg3").text("");
            $("#msg4").text("");

            $.ajax({
                url:" /login/adduser",
                type:"post",
                data:$("#userform form").serialize(),
                success:function (result) {
                    alert("完善信息成功！,请重新登录");
                    window.location.href="/login/yunlogin";
                }
            });





        }


    })


</script>
</html>