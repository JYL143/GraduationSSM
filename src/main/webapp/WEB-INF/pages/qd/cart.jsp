<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的购物车</title>
    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">
    <link rel="stylesheet" type="text/css"  href="<%=path %>/css/bootstrap.min.css"  >
    <link rel="stylesheet" href="<%=path %>/css/reset.css">
    <link rel="stylesheet" href="<%=path %>/css/carts.css">
    <style>
        label.mark{
            background: url("<%=path %>/qt_img/mark1.png") no-repeat -1px -1px;
        }
    </style>
</head>
<body>

<div>

    <div style="height:77px;width: 100%;margin-bottom: 30px;padding-top: 20px" >
        <a href="/yunmi/index" style="margin-left: 155px;float: left"><img src="<%=path %>/qt_img/logo_top.png" alt=""></a>
        <span style="font-size: 26px;color: black;margin-left: 47px;margin-top: 15px;float: left">我的购物车</span>
        <span style="font-size: 14px;color:#808080 ;margin-left: 11px;margin-top: 26px;float: left">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</span>
        <a href="#"  style="font-size: 13px;color: #808080 ;margin-left: 810px;margin-top: -15px;float: left">${yunUser2}</a>
        <span style="margin-left: 910px;margin-top: -13px;float: left">|</span>
        <a href="/yunmi/order/5" style="font-size: 13px;color:#808080;margin-top: -15px;margin-left: 920px;float: left">我的订单</a>

    </div>
    <div style="clear: both"></div>
    <div style="  border-top: solid  #ff6700 3px;width:100%;height: 3px;margin-top: 14px;margin-bottom: 20px"></div>

</div>

<!--购物车-->
<section class="cartMain">
    <div class="cartMain_hd">
        <ul class="order_lists cartTop">
            <li class="list_chk" style="margin-left: 15px" >
                <!--所有商品全选-->
                <input type="checkbox" id="all" class="whole_check">
                <label for="all"></label> 全选

            </li>
            <li style="margin-left: -10px ;width: 40px;" >图片</li>
            <li style="margin-left: 42px ;width: 60px;" >商品名称</li>
            <li style="margin-left:93px ;width: 60px;">商品参数</li>
            <li style="margin-left: 128px ;width: 60px;">单价</li>
            <li  style="margin-left: 80px ;width: 60px;">邮费</li>
            <li  style="margin-left: 56px ;width: 60px;">数量</li>
            <li  style="margin-left: 42px ;width: 60px;">小计</li>
            <li  style="margin-left: 76px ;width: 60px;">操作</li>
        </ul>
    </div>

    <div class="cartBox">

        <div class="order_content">
            <c:forEach items="${carts}" var="carts" begin="0" end="${carts.size()}"  varStatus="xh">
            <%--varStatus代表当前变量的状态,其中包含了index,count等属性.${xh.index}表示当前索引--%>

            <ul class="order_lists">
                <li class="list_chk">
                    <input type="checkbox" id="${carts.cartid}" class="son_check" >
                    <label for="${carts.cartid}"></label>    <%--本来复选框id可以用索引，我这里改成购物车id，这样就可以获取购物车id给支付的时候--%>
                </li>
                <li class="list_con" style="width: 249px;">
                    <div class="list_img"><a href="javascript:;"><img src="<%=path %>/upload/${carts.commoditys[0].images}" alt=""></a></div>
                    <div style="font-size: 15px;margin-top: 60px;margin-left:114px"> ${carts.commoditys[0].name}</div>
                </li>
                <li class="list_info" style="width: 200px;">
                    <p style="font-size: 16px;margin-top: 40px">${carts.commoditys[0].subtitle}</p>
                </li>
                <li class="list_price" >
                    <p class="price" style="margin-top:60px">￥${carts.commoditys[0].price}</p>
                </li>
                <li class="list_price" style="margin-left: 10px ;width: 103px" >
                    <p class="postage" style="margin-top:60px" id="postage">￥${carts.commoditys[0].postage}</p>
                </li>
                <li class="list_amount" >
                    <div class="amount_box"  style="margin-top: 60px">
                        <a href="javascript:;" onclick="reduce(${carts.cartid})" class="reduce reSty"  style="height: 13px;"><span  style="display: block;margin-top: -5px">-</span></a>
                        <input type="text" value="${carts.quantity}" class="sum">
                        <a href="javascript:;" onclick="add(${carts.cartid},${carts.commodityid})"  class="plus" style="height: 13px;"><span  style="display: block;margin-top: -5px">+</span></a>
                    </div>

                </li>
                <li class="list_sum " >
                    <p class="sum_price" style="margin-top: 60px">￥${(carts.commoditys[0].price*carts.quantity)+carts.commoditys[0].postage}</p>
                </li>
                <li class="list_op" >
                    <p class="del" style="margin-top: 60px">
                        <a  href="javascript:;" onclick="a(${carts.cartid})" class="delBtn">移除商品</a></p>
                </li>

            </ul>
            </c:forEach>

        </div>

    </div>
    <!-- 隐藏的提交手段-->
    <form action="/alipay/goAlipay" id="cs"  method="post" style=" display:none" >
        <input type="text"  id="zj"  name="price" />
        <input type="text"  id="cartids"   name="cartids"  >
        <input class="calBtn" type="submit" />
    </form>


    <!--底部-->
    <div class="bar-wrapper">
        <div class="bar-right">
                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                <div class="calBtn"><a id="zf" >结算</a></div>
        </div>
    </div>
</section>

<section class="model_bg"></section>
<section class="my_model" style="height: 140px">
    <p class="title" >删除宝贝<span class="closeModel">X</span></p>
    <p style="margin-left: 80px;">您确认要删除该宝贝吗？</p>
    <div class="opBtn" style="margin-left: 80px;">
        <a href="javascript:;" class="dialog-sure" id="b">确定</a>
        <a href="javascript:;" class="dialog-close"  style="margin-left: 10px;">关闭</a></div>
</section>


<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>

<script>
    //js里还写了个结算

    /**
     * Created by Administrator on 2017/5/24.
     */

    var  total_money=0; //保存购物车总价格
    //购物车代码
    $(function () {

        //全局的checkbox选中和未选中的样式
        var $allCheckbox = $('input[type="checkbox"]'),     //全局的全部checkbox
            $wholeChexbox = $('.whole_check'),
            $cartBox = $('.cartBox'),                       //每个商铺盒子
            $shopCheckbox = $('.shopChoice'),               //每个商铺的checkbox
            $sonCheckBox = $('.son_check');                 //每个商铺下的商品的checkbox
        $allCheckbox.click(function () {
            if ($(this).is(':checked')) {
                $(this).next('label').addClass('mark');
            } else {
                $(this).next('label').removeClass('mark')
            }
        });

        //===============================================全局全选与单个商品的关系================================
        $wholeChexbox.click(function () {
            var $checkboxs = $cartBox.find('input[type="checkbox"]');
            if ($(this).is(':checked')) {
                $checkboxs.prop("checked", true);
                $checkboxs.next('label').addClass('mark');
            } else {
                $checkboxs.prop("checked", false);
                $checkboxs.next('label').removeClass('mark');
            }
            totalMoney();
        });

        var str="";   //全局变量 ，保存复选框选中的购物车id 格式为x-x-x-
        $sonCheckBox.each(function () {
            $(this).click(function () {

                if ($(this).is(':checked')) {
                    //判断：所有单个商品是否勾选
                    var len = $sonCheckBox.length;
                    var num = 0;
                    var id;


                    id=$(this).attr("id");  //获取当前购物车id，因为我吧购物车id设置为复选框id
                    str=str+id+"-";

                    //这个是判断是不是全部都选中的
                    $sonCheckBox.each(function () {
                        if ($(this).is(':checked')) {
                            num++;
                        }
                    });
                    if (num == len) {
                        $wholeChexbox.prop("checked", true);
                        $wholeChexbox.next('label').addClass('mark');
                    }
                } else {

                    var str2="";
                    var id2=$(this).attr("id"); //获取复选框取消的购物车id
                    var str2=str2+id2+"-";      //要去除的字符串
                    str=str.replace(str2,"");

                    //单个商品取消勾选，全局全选取消勾选
                    $wholeChexbox.prop("checked", false);
                    $wholeChexbox.next('label').removeClass('mark');
                }

                $("#cartids").val(str);           //隐藏提交手段,将选中的购物车id传递到隐藏提交框

            })
        })

        //=======================================每个店铺checkbox与全选checkbox的关系/每个店铺与其下商品样式的变化===================================================

        //店铺有一个未选中，全局全选按钮取消对勾，若店铺全选中，则全局全选按钮打对勾。
        $shopCheckbox.each(function () {
            $(this).click(function () {

                if ($(this).is(':checked')) {
                    //判断：店铺全选中，则全局全选按钮打对勾。
                    var len = $shopCheckbox.length;
                    var num = 0;
                    $shopCheckbox.each(function () {
                        if ($(this).is(':checked')) {
                            num++;
                        }
                    });
                    if (num == len) {
                        $wholeChexbox.prop("checked", true);
                        $wholeChexbox.next('label').addClass('mark');
                    }

                    //店铺下的checkbox选中状态
                    $(this).parents('.cartBox').find('.son_check').prop("checked", true);
                    $(this).parents('.cartBox').find('.son_check').next('label').addClass('mark');
                } else {
                    //否则，全局全选按钮取消对勾
                    $wholeChexbox.prop("checked", false);
                    $wholeChexbox.next('label').removeClass('mark');

                    //店铺下的checkbox选中状态
                    $(this).parents('.cartBox').find('.son_check').prop("checked", false);
                    $(this).parents('.cartBox').find('.son_check').next('label').removeClass('mark');
                }
                totalMoney();
            });
        });


        //========================================每个店铺checkbox与其下商品的checkbox的关系======================================================

        //店铺$sonChecks有一个未选中，店铺全选按钮取消选中，若全都选中，则全选打对勾
        $cartBox.each(function () {
            var $this = $(this);
            var $sonChecks = $this.find('.son_check');
            $sonChecks.each(function () {
                $(this).click(function () {

                    if ($(this).is(':checked')) {
                        //判断：如果所有的$sonChecks都选中则店铺全选打对勾！
                        var len = $sonChecks.length;
                        var num = 0;
                        $sonChecks.each(function () {
                            if ($(this).is(':checked')) {
                                num++;
                            }
                        });
                        if (num == len) {
                            $(this).parents('.cartBox').find('.shopChoice').prop("checked", true);
                            $(this).parents('.cartBox').find('.shopChoice').next('label').addClass('mark');
                        }

                    } else {
                        //否则，店铺全选取消
                        $(this).parents('.cartBox').find('.shopChoice').prop("checked", false);
                        $(this).parents('.cartBox').find('.shopChoice').next('label').removeClass('mark');
                    }
                    totalMoney();
                });
            });
        });


        //=================================================商品数量==============================================
        var $plus = $('.plus'),
            $reduce = $('.reduce'),
            $all_sum = $('.sum');
        //没用的
        $plus.click(function () {  //点击加号
            console.log("k2k2k2k")
            var $inputVal = $(this).prev('input'),
                $count = parseInt($inputVal.val())+1,
                $obj = $(this).parents('.amount_box').find('.reduce'),
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $postage= $(this).parents('.order_lists').find('.postage').html(),//邮费
                $priceTotal = $count*parseInt($price.substring(1)) +parseInt($postage.substring(1));

            $inputVal.val($count);
            $priceTotalObj.html('￥'+$priceTotal);
            if($inputVal.val()>1 && $obj.hasClass('reSty')){
                $obj.removeClass('reSty');
            }

            totalMoney();
        });

        $reduce.click(function () {  //点击减号
            var $inputVal = $(this).next('input'),
                $count = parseInt($inputVal.val())-1,
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $postage= $(this).parents('.order_lists').find('.postage').html(),//邮费
                $priceTotal = $count*parseInt($price.substring(1)) +parseInt($postage.substring(1));
            if($inputVal.val()>1){
                $inputVal.val($count);
                $priceTotalObj.html('￥'+$priceTotal);
            }
            if($inputVal.val()==1 && !$(this).hasClass('reSty')){
                $(this).addClass('reSty');
            }
            totalMoney();
        });

        $all_sum.keyup(function () {

            var $count = 0,
                $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
                $price = $(this).parents('.order_lists').find('.price').html(),  //单价
                $priceTotal = 0;
            if($(this).val()==''){
                $(this).val('1');
            }
            $(this).val($(this).val().replace(/\D|^0/g,''));
            $count = $(this).val();
            $priceTotal = $count*parseInt($price.substring(1));
            $(this).attr('value',$count);
            $priceTotalObj.html('￥'+$priceTotal);
            totalMoney();
        })

        //======================================移除商品========================================

        var $order_lists = null;
        var $order_content = '';
        $('.delBtn').click(function () {
            $order_lists = $(this).parents('.order_lists');
            $order_content = $order_lists.parents('.order_content');
            $('.model_bg').fadeIn(300);
            $('.my_model').fadeIn(300);
        });

        //关闭模态框
        $('.closeModel').click(function () {
            closeM();
        });
        $('.dialog-close').click(function () {
            closeM();
        });
        function closeM() {
            $('.model_bg').fadeOut(300);
            $('.my_model').fadeOut(300);
        }
        //确定按钮，移除商品
        $('.dialog-sure').click(function () {
            $order_lists.remove();
            if($order_content.html().trim() == null || $order_content.html().trim().length == 0){
                $order_content.parents('.cartBox').remove();
            }
            closeM();
            $sonCheckBox = $('.son_check');
            totalMoney();
        })

        //======================================总计==========================================

        function totalMoney() {

            total_money=0;
            var total_count = 0;
            var calBtn = $('.calBtn a');
            $sonCheckBox.each(function () {
                if ($(this).is(':checked')) {
                    var goods = parseInt($(this).parents('.order_lists').find('.sum_price').html().substring(1)); //获取小计
                    var num =  parseInt($(this).parents('.order_lists').find('.sum').val());
                    total_money += goods;
                    total_count += num;
                    $("#zj").val(total_money);//隐藏提交手段
                }
            });
            $('.total_text').html('￥'+total_money);
            $('.piece_num').html(total_count);

            if(total_money!=0 && total_count!=0){
                if(!calBtn.hasClass('btn_sty')){
                    calBtn.addClass('btn_sty');
                }
            }else{
                if(calBtn.hasClass('btn_sty')){
                    calBtn.removeClass('btn_sty');
                }
            }

        }
    })


    //结算
    var cs = document.getElementById('cs');
    //点击结算按钮  隐藏的提交方法
    $("#zf").click(function () {
        cs.submit();
    });

    //删除购物车
    var  cartid;
    //点击移除商品 传递购物车订单id给 确定按钮，以供删除
    function a(cartid2) {
        cartid=cartid2;

    }
    //点击确定按钮
    $("#b").click(function () {
        $.ajax({
            url:"  /cart/delete/"+cartid,
            type:"post",
        });
    });

    //添加商品数量
    function add(cartid3,commodityid) {
        $.ajax({
            url:" /cart/addQuantity/"+cartid3+"&"+commodityid,
            type:"post",
        });
    }
    //添加商品数量
    function reduce(cartid3) {
        $.ajax({
            url:" /cart/reduceQuantity/"+cartid3,
            type:"post",
        });
    }
</script>
</body>
</html>