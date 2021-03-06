<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>支付成功页</title>
    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">
    <!--这3个头部特效-->
    <link rel="stylesheet" href="<%=path %>/css/commodity.css">
    <link rel="stylesheet" href="<%=path %>/css/common.css">
    <link rel="stylesheet" href="<%=path %>/css/index.css">


    <script type="text/javascript">
        function stops(){
            return false;
        }
        document.oncontextmenu=stops;
    </script>

</head>
<body>
<!--headerTop-->
<div class="header-top">
    <div class="container clear">
        <div class="fl">
            <ul class="clear">
                <li class="fl navbar-nav" style="padding: 0"><a href="/yunmi/index">小米商城</a> <span>|</span></li>
                <li class="fl navbar-nav"><a href="javascript:">MIII </a><span>|</span></li>
                <li class="fl navbar-nav"><a href="javascript:">我聊 </a> <span>|</span></li>
                <li class="fl navbar-nav"><a href="javascript:">游戏 </a><span>|</span></li>
                <li class="fl navbar-nav"><a href="javascript:">多看阅读 </a><span>|</span></li>
                <li class="fl navbar-nav"><a href="javascript:">云服务 </a><span>|</span></li>
                <li class="fl navbar-nav"><a href="javascript:">金融 </a><span>|</span></li>
                <li class="fl navbar-nav"><a href="javascript:">小米网移动版 </a><span>|</span></li>
                <li class="fl navbar-nav"><a href="javascript:">问题反馈 </a><span>|</span></li>
                <li class="fl navbar-nav"><a href="javascript:">Select Region</a></li>
            </ul>
        </div>
        <div class="fr">

            <c:if test="${yunUser2 != null && !yunUser2.equals('')}">
                <span  id="li_username" style="margin-right: 8px">${yunUser2}</span>
                <a href="/yunmi/signOut"  style="margin-right: 40px">退出 </a>
            </c:if>
            <c:if test="${yunUser2 == null || yunUser2.equals('')}">

                <a  href="/yunmi/login" class="register">登陆</a>
                <span>|</span>
                <a href="login/yunregister" class="login">注册</a>
                <span>|</span>
            </c:if>

            <a href="/yunmi/userinfo" class="tz">个人中心</a>
            <a href="/cart/carts" class="cart">
                <i class="iconfont cart-mini">&#xe621;</i>
                购物车（${cartnum}）
                <%--                <div class="cart-menu">购物车中还没有商品，赶紧选购吧！</div>--%>
            </a>
        </div>
    </div>
</div>
<!--end header -->

<!-- 横条下拉加搜索栏 -->

<div class="header-navbar container">
    <a href="/yunmi/index" class="logo fl">
        <img class="center" src="<%=path%>/qt_img/logo_top.png" alt="">
    </a>
    <div class="nav fl">
        <ul class="clear nav-item">
            <li class="fl "><a class="link" href="javascript:"><span class="text">小米手机</span></a></li>
            <li class="fl"><a class="link" href="javascript:"><span class="text">红米</span></a></li>
            <li class="fl"><a class="link" href="javascript:"><span class="text">笔记本</span></a></li>
            <li class="fl"><a class="link" href="javascript:"><span class="text">电视</span></a></li>
            <li class="fl"><a class="link" href="javascript:"><span class="text">家电</span></a></li>
            <li class="fl"><a class="link" href="javascript:"><span class="text">健康儿童</span></a></li>
            <li class="fl"><a class="link" href="javascript:"><span class="text">智能硬件</span></a></li>
            <li class="fl"><a class="link" href="https://www.mi.com/service"><span class="text">服务</span></a></li>
            <li class="fl"><a class="link" href="https://www.xiaomi.cn/"><span class="text">社区</span></a></li>
        </ul>
    </div>
    <div class="fr clear nav-rt">
        <form class="search-form">
            <label for="search">
            </label>
            <input id="searchinput" class="search-text" style="width: 245px">
            <a href="javascript:"  id="search">
                <img src="<%=path%>/qt_img/search.png" style="margin-left: 245px;height: 48px;width: 48px">
            </a>

            <div class="search-words">
                <a href="/yunmi/commodity?commodityid=1">Redmi K30</a>
                <a href="/yunmi/commodity?commodityid=893">充电宝</a>
            </div>

        </form>
    </div>
</div>
<!--下拉框-->
<div class="header-nav-menu header-nav-menu-active">
    <ul class="children-list clear">
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=6">
                    <img src="<%=path%>/upload/f8087e5197a345bb977a825f67fe6c8bxiaomi9.jpg" alt="" style=" width: 126px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px" >
                <a href="javascript:">小米9</a>
            </div>
            <p class="price">2699元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=7">
                    <img src="<%=path%>/qt_img/sj4.webp" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:"> 小米9 Pro 5G</a>
            </div>
            <p class="price">4299元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=9">
                    <img src="<%=path%>/upload/ecd27f2c66f54dd680a6bd02a4697cf8xiaomicc9.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:"> 小米CC9</a>
            </div>
            <p class="price">1699元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=11">
                    <img src="<%=path%>/upload/d35c53e98a67490fabdeb97c0256b391xiaomicc9e.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:"> 小米CC9e</a>
            </div>
            <p class="price">1299元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=10">
                    <img src="<%=path%>/upload/cee44a7e39f74b79b867e0066d49e613xiaomicc9mtu.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:"> 小米CC9 美图定制版</a>
            </div>
            <p class="price">1999元</p>
        </li>

        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=12">
                    <img src="<%=path%>/upload/39b09b9463df48918f4ee55787fca30axiaomimax3.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:"> 小米MIX 3</a>
            </div>
            <p class="price">2599元</p>
        </li>
    </ul>
    <ul class="children-list clear">
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=1">
                    <img src="<%=path%>/upload/0fab0d749c5e40eaabdb044811781dcbRedmi%20K30.jpg" alt="" style=" width: 126px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px" >
                <a href="javascript:">Redmi K30</a>
            </div>
            <p class="price">2199元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=2">
                    <img src="<%=path%>/upload/c8906eec3c56457a9d69028576f71d68Redmi%20K30%205G.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">Redmi K30 5G</a>
            </div>
            <p class="price">2899元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=3">
                    <img src="<%=path%>/upload/58dfe433fa55487895a57ec3aa88bb75redmi8A.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">Redmi 8A</a>
            </div>
            <p class="price">699元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=8">
                    <img src="<%=path%>/upload/d39c50fa59a2407d8aa80edcf4c9b162RedmiNote8.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">Redmi Note 8</a>
            </div>
            <p class="price">1099元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=15">
                    <img src="<%=path%>/upload/a5fdd4821cc648c0974f41ce662290c7redmik20prok.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">Redmi K20 Pro 尊享版</a>
            </div>
            <p class="price">2399元</p>
        </li>

        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=4">
                    <img src="<%=path%>/upload/1db863fbe1914553ae118304f6ec3503Redmi8.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">Redmi 8</a>
            </div>
            <p class="price">899元</p>
        </li>
    </ul>
    <ul class="children-list clear">
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=100">
                    <img src="<%=path%>/upload/fa9a99b0dbca48f6b7fba4f73ec88e83yxb.jpg" alt="" style=" width: 126px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px" >
                <a href="javascript:">小米游戏本 15.6"</a>
            </div>
            <p class="price">7999元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=94">
                    <img src="<%=path%>/upload/26c3059080e44e9c8af3498ff2f265beredmibook13.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">RedmiBook 13 独显</a>
            </div>
            <p class="price">5499元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=95">
                    <img src="<%=path%>/upload/f3b10c91e47745ab891d6de912b0d677redmiBook14zqb.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">RedmiBook 14 增强版</a>
            </div>
            <p class="price">4999元</p>
        </li>

        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=96">
                    <img src="<%=path%>/upload/ea9993b46b1449f0a557d1662b1527f1air12.5.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">Air 12.5" 2019款</a>
            </div>
            <p class="price">4299元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=97">
                    <img src="<%=path%>/upload/90b5c67704784d78b70805d33806322bair13.3.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">Air 13.3" 2019款</a>
            </div>
            <p class="price">5699元</p>
        </li>


    </ul>
    <ul class="children-list clear">
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=81">
                    <img src="<%=path%>/upload/dc76f3210fb84a6ab416947acf33fd7eRedmiDS70YC2.jpg" alt="" style=" width: 126px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px" >
                <a href="javascript:">Redmi电视 70英寸</a>
            </div>
            <p class="price">3599元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=75">
                    <img src="<%=path%>/upload/8e3f886ba4334854bfb4bb2ac2496956qpmDS65YCE56C2.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">全面屏电视E65C</a>
            </div>
            <p class="price">2999元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=73">
                    <img src="<%=path%>/upload/f87a321389954fb4b0e3900ad22daef8qmpDCE55A2.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">小米全面屏电视E55A</a>
            </div>
            <p class="price">1799元</p>
        </li>

        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=84">
                    <img src="<%=path%>/upload/752aa027b1014486afb278218c9f7675pmpDSproE43S43YC2.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">全面屏电视proE43S</a>
            </div>
            <p class="price">1499元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=77">
                    <img src="<%=path%>/upload/04c880775607440abf9fd2fbb164e371DS4A58YC2.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">小米电视4A 58英寸</a>
            </div>
            <p class="price">1999元</p>
        </li>

        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=86">
                    <img src="<%=path%>/upload/109d85d72a98491c8790db55cf93dc3eqmpDSproE65S65YC2.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">全面屏电视proE65S</a>
            </div>
            <p class="price">3399元</p>
        </li>
    </ul>
    <ul class="children-list clear">
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=847">
                    <img src="<%=path%>/upload/d5fc27a553b84889ad3d3915fd5c719edkx.jpg" alt="" style=" width: 126px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px" >
                <a href="javascript:">米家电烤箱</a>
            </div>
            <p class="price">299元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=842">
                    <img src="<%=path%>/upload/e6024f301f7a4c2eb2e9aabbbc408d2fkt2.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">壁挂空调</a>
            </div>
            <p class="price">2599元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=844">
                    <img src="<%=path%>/upload/5dbaca4736e644208ab59797b84c4eceredmixyj.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">全自动洗衣机</a>
            </div>
            <p class="price">899元</p>
        </li>

        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=843">
                    <img src="<%=path%>/upload/5ed92d0030d746e5b088a8525b0dc59fxyj.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">滚筒洗衣机</a>
            </div>
            <p class="price">2299元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=845">
                    <img src="<%=path%>/upload/7e070a823dd74a36a0c99762c560a4f7jsq.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">小米净水器</a>
            </div>
            <p class="price">2499元</p>
        </li>

        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=848">
                    <img src="<%=path%>/upload/1a4599607cd34ce9aceeef8e8ad23344sdjqr.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">扫地机器人</a>
            </div>
            <p class="price">1999元</p>
        </li>
    </ul>
    <ul class="children-list clear">
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=918">
                    <img src="<%=path%>/upload/eb27ac7afbb24ceca9e3a1ff12ef549azbj.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">走步机</a>
            </div>
            <p class="price">1699元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=903">
                    <img src="<%=path%>/upload/cf98ff35661a44b28a7f52230c8f70e4xsj.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">自动洗手机</a>
            </div>
            <p class="price">69元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=911">
                    <img src="<%=path%>/upload/c86e2d9b43fe421593152e7f33dc0435etsb.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">米兔儿童电话手表</a>
            </div>
            <p class="price">349元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=909">
                    <img src="<%=path%>/upload/8146cc020b0b4091beb1d34a2bb8859fzngsj.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">米兔智能故事机</a>
            </div>
            <p class="price">169元</p>
        </li>


        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=914">
                    <img src="<%=path%>/upload/eef6fbc34ddf403da875fc6eb35e9bdcmtetsb.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">米兔儿童书包</a>
            </div>
            <p class="price">169元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=908">
                    <img src="<%=path%>/upload/d9ecc4832b1e4429bde5dae6232e8c16tzc.jpg" alt="" style=" width: 126px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px" >
                <a href="javascript:">体重秤</a>
            </div>
            <p class="price">59元</p>
        </li>

    </ul>
    <ul class="children-list clear">
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=886">
                    <img src="<%=path%>/upload/1f0262da67244cbf910954849ac1961eznsxj.jpg" alt="" style=" width: 126px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px" >
                <a href="javascript:">智能摄像机</a>
            </div>
            <p class="price">169元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=890">
                    <img src="<%=path%>/upload/1e94b3bf721f44c092c41f44d39bfa9bxals.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">小爱老师</a>
            </div>
            <p class="price">429元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=888">
                    <img src="<%=path%>/upload/60a93890be274e1f9b4d5894c5be4838znms.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">智能门锁</a>
            </div>
            <p class="price">1499元</p>
        </li>

        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=930">
                    <img src="<%=path%>/upload/b25ed5ccd3064a55ae9571ef140d3668xacpyx.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">触屏音箱</a>
            </div>
            <p class="price">199元</p>
        </li>
        <li class="first" style=" padding: 15px 12px 0;">
            <div class="figure-thumb figure">
                <a href="/yunmi/commodity?commodityid=929">
                    <img src="<%=path%>/upload/586c866f4a57431d89313cb5ee8181e7redmixayx.jpg" alt="" style=" width: 136px; height: 136px;margin-left: 12px">
                </a>
            </div>
            <div class="title" style=" line-height: 22px;margin-top: 34px">
                <a href="javascript:">Redmi小爱音箱 Play</a>
            </div>
            <p class="price">79元</p>
        </li>


    </ul>

</div>
<!-- 横条下拉加搜索栏  -->

<!--支付成功条-->
<div style="width: 100%;height: 390px;background: rgb(250,250,250);">
    <div style="padding-top: 105px">
        <div style="width: 70px;height: 70px;margin-left: 140px;padding-top: 30px;float: left;">
            <img style="width: 70px;height: 70px;" src="<%=path%>/qt_img/success.png" />
        </div>
        <div style="width: 260px;height: 60px;margin-left: 30px;padding-top: 40px;float: left;">
            <div style="width: 260px;height: 30px;font-size: 22px;color: black;">已成功加入购物车!</div>
            <div style="width: 260px;height: 30px;font-size: 13px;color: #000000;padding-left: 2px;margin-top: 5px">Redimi K30 6GB+128GB 黑色</div>
        </div>
        <div style="width: 380px;height: 60px;margin-left: 490px;padding-top: 40px;float: left;">
            <a href="/yunmi/index"><div style="width: 180px;height: 30px;background:rgb(250,250,250);;text-align: center;font-size: 15px;color: #000000;padding-top: 10px;float: left;border: 1px solid #000000;">
                返回主页面</div></a>
            <a href="/cart/carts"><div style="width: 180px;height: 30px;background: #FF6700;text-align: center;font-size: 15px;color: #FFFFFF;padding-top: 10px;float: left;margin-left: 15px;">
                继续购物</div></a>
        </div>
    </div>

</div>

<!--footer-->
<div class="footer">
    <div class="container">
        <div class="site-footer">
            <div class="footer-service">
                <ul class="list-service clear">
                    <li>
                        <a  href="javascript:"><span class="iconfont">&#xe603;</span>1小时快修服务</a>
                    </li>
                    <li>
                        <a  href="javascript:"><span class="iconfont">&#xe638;</span>7天无理由退货</a>
                    </li>
                    <li>
                        <a  href="javascript:"><span class="iconfont">&#xe605;</span>15天免费换货</a>
                    </li>
                    <li>
                        <a  href="javascript:"><span class="iconfont">&#xe607;</span>满150元包邮</a>
                    </li>
                    <li>
                        <a  href="javascript:"><span class="iconfont">&#xe606;</span>520余家售后网点</a>
                    </li>
                </ul>
            </div>
            <div class="footer-links clear">
                <dl class="col-links ">
                    <dt>帮助中心</dt>
                    <dd><a  href="javascript:">购物指南</a></dd>
                    <dd><a  href="javascript:">支付方式</a></dd>
                    <dd><a  href="javascript:">配送方式</a></dd>
                </dl>
                <dl class="col-links ">
                    <dt>服务支持</dt>
                    <dd><a  href="javascript:">售后政策</a></dd>
                    <dd><a  href="javascript:">自助服务</a></dd>
                    <dd><a  href="javascript:">相关下载</a></dd>
                </dl>
                <dl class="col-links ">
                    <dt>小米之家</dt>
                    <dd><a  href="javascript:">小米之家</a></dd>
                    <dd><a  href="javascript:">服务网点</a></dd>
                    <dd><a  href="javascript:">预约服务</a></dd>
                </dl>
                <dl class="col-links ">
                    <dt>关于小米</dt>
                    <dd><a  href="javascript:">了解小米</a></dd>
                    <dd><a  href="javascript:">加入小米</a></dd>
                    <dd><a  href="javascript:">联系我们</a></dd>
                </dl>
                <dl class="col-links ">
                    <dt>关注我们</dt>
                    <dd> <a  href="javascript:">新浪微博</a></dd>
                    <dd><a  href="javascript:">小米部落</a></dd>
                    <dd><a  href="javascript:">官方微信</a></dd>

                </dl>
                <dl class="col-links ">
                    <dt>特色服务</dt>
                    <dd><a  href="javascript:">F 码通道</a></dd>
                    <dd><a  href="javascript:">小米移动</a></dd>
                    <dd><a  href="javascript:">防伪查询</a></dd>
                </dl>
                <div class="col-contact">
                    <p class="phone">400-000-0000</p>
                    <p>
                        <span class="J_serviceTime-normal" style="">周一至周日 8:00-18:00</span>
                        <br>（仅收市话费）
                    </p>
                    <a class="btn  btn-small" href="javascript:"><span class="iconfont">&#xe615;</span> 24小时在线客服</a>
                </div>
            </div>
        </div>

    </div>
</div>

<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/indexk.js"></script>


</body>
</html>
