<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>云米商城</title>
    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">

    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style2.css">

    <link rel="stylesheet" href="<%=path %>/css/index.css">

    <script type="text/javascript">
        function stops(){
            return false;
        }
        document.oncontextmenu=stops;
    </script>
</head>
<body>
<!-- start header -->

<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="/yunmi/index">云米商城</a></li>
                <li>|</li>
                <li><a href="">MIUI</a></li>
                <li>|</li>
                <li><a href="">云服务</a></li>
                <li>|</li>
                <li><a href="">金融</a></li>
                <li>|</li>
                <li><a href="">有品</a></li>
                <li>|</li>
                <li><a href="">资质证照</a></li>
                <li>|</li>
                <li><a href="">协议规则</a></li>
                <li>|</li>
                <li><a href="">问题反馈</a></li>
                <li>|</li>
                <li><a href="">Select Region</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <div class="gouwuche fr"><a href="/cart/carts" style="font-size: 15px">购物车</a></div>
            <div class="fr">
                <ul>

                        <c:if test="${yunUser2 != null && !yunUser2.equals('')}">
                            <li  id="li_username" style="margin-right: 8px">${yunUser2}</li>
                            <li style="margin-right: 40px"><a href="/yunmi/signOut">退出 </a>  </li>
                        </c:if>
                        <c:if test="${yunUser2 == null || yunUser2.equals('')}">
                          <li><a href="/login/yunlogin">登录 </a>  </li>
                            <li>|</li>
                            <li><a href="/login/yunregister" >注册</a></li>
                            <li>|</li>

                        </c:if>
                    <li ><a href="/yunmi/userinfo">个人中心</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<!--end header -->

<!-- start banner_x -->
<div class="banner_x center">
    <a href="/yunmi/index" ><div class="logo fl" style="background: url('<%=path%>/qt_img/logo_top.png') no-repeat center center;margin-left: 20px;margin-top: 0px"></div></a>
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
    <div class="fr clear nav-rt" style="margin-top: -65px;">
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
<!-- end banner_x -->
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

<!-- start banner_y -->
<div class="banner_y center" >
    <div style="width: 1226px;height: 460px;float: left;position:absolute" >
        <a href="/yunmi/commodity?commodityid=15"><img src="<%=path%>/qt_img/banner1.webp" style="width: 1226px;height: 460px;"></a>
    </div>
    <div class="nav" style="background: rgb(152,159,162);margin-left: 0px;position:relative">
        <ul>
            <li>
                <a href="" >手机</a>
                <a href="">电话卡</a>
                <div class="pop" style="width: 1110px">
                    <div class="left fl" style="width: 265px">
                        <c:forEach items="${list3}" var="list"  begin="0" end="5" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl"style="width: 275px">
                        <c:forEach items="${list3}" var="list"  begin="6" end="11" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl"style="width: 275px">
                        <c:forEach items="${list3}" var="list"  begin="12" end="17" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl"style="width: 275px">
                        <c:forEach items="${list3}" var="list"  begin="18" end="23" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>



                </div>
            </li>
            <li>
                <a href="">电视</a>
                <a href="">盒子</a>
                <div class="pop" style="width: 1100px">
                    <div class="left fl" style="width: 270px">
                        <c:forEach items="${list1}" var="list"  begin="0" end="5" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl"style="width: 270px">
                        <c:forEach items="${list1}" var="list"  begin="6" end="11" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl"style="width: 270px">
                        <c:forEach items="${list1}" var="list"  begin="12" end="17" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl"style="width: 270px">
                        <c:forEach items="${list1}" var="list"  begin="18" end="23" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>



                </div>
            </li>
            <li>
                <a href="">平板</a>
                <a href="">笔记本</a>
                <div class="pop"  style="width: 880px">

                    <div class="left fl">
                        <c:forEach items="${list5}" var="list"  begin="0" end="5" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="left fl">
                        <c:forEach items="${list5}" var="list"  begin="6" end="11" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl">
                        <c:forEach items="${list5}" var="list"  begin="12" end="17" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </li>
            <li>
                <a href="">家电</a>
                <a href="">插线板</a>
                <div class="pop"  style="width: 1060px">
                    <div class="left fl" style="width: 260px">
                        <c:forEach items="${list7}" var="list"  begin="0" end="5" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl" style="width: 260px">
                        <c:forEach items="${list7}" var="list"  begin="6" end="11" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl" style="width: 260px">
                        <c:forEach items="${list7}" var="list"  begin="12" end="17" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl" style="width: 260px">
                        <c:forEach items="${list7}" var="list"  begin="18" end="23" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </li>
            <li>
                <a href="">出行</a>
                <a href="">穿戴</a>
                <div class="pop"  style="width: 880px">

                    <div class="left fl">
                        <c:forEach items="${list9}" var="list"  begin="0" end="5" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="left fl">
                        <c:forEach items="${list9}" var="list"  begin="6" end="11" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl">
                        <c:forEach items="${list9}" var="list"  begin="12" end="17" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </li>
            <li>
                <a href="">智能</a>
                <a href="">路由器</a>
                <div class="pop"  style="width: 880px">

                    <div class="left fl">
                        <c:forEach items="${list11}" var="list"  begin="0" end="5" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="left fl">
                        <c:forEach items="${list11}" var="list"  begin="6" end="11" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl">
                        <c:forEach items="${list11}" var="list"  begin="12" end="17" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </li>
            <li>
                <a href="">电源</a>
                <a href="">配件</a>
                <div class="pop"  style="width: 880px">

                    <div class="left fl">
                        <c:forEach items="${list13}" var="list"  begin="0" end="5" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="left fl">
                        <c:forEach items="${list13}" var="list"  begin="6" end="11" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl">
                        <c:forEach items="${list13}" var="list"  begin="12" end="17" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </li>
            <li>
                <a href="">健康</a>
                <a href="">儿童</a>
                <div class="pop"  style="width: 880px">

                    <div class="left fl">
                        <c:forEach items="${list15}" var="list"  begin="0" end="5" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="left fl">
                        <c:forEach items="${list15}" var="list"  begin="6" end="11" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl">
                        <c:forEach items="${list15}" var="list"  begin="12" end="17" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </li>
            <li>
                <a href="">耳机</a>
                <a href="">音箱</a>
                <div class="pop"  style="width: 880px">

                    <div class="left fl">
                        <c:forEach items="${list17}" var="list"  begin="0" end="5" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="left fl">
                        <c:forEach items="${list17}" var="list"  begin="6" end="11" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl">
                        <c:forEach items="${list17}" var="list"  begin="12" end="17" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </li>
            <li>
                <a href="">生活</a>
                <a href="">箱包</a>
                <div class="pop"  style="width: 880px">

                    <div class="left fl">
                        <c:forEach items="${list19}" var="list"  begin="0" end="5" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="left fl">
                        <c:forEach items="${list19}" var="list"  begin="6" end="11" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="left fl">
                        <c:forEach items="${list19}" var="list"  begin="12" end="17" >
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="/yunmi/commodity?commodityid=${list.commodityid}">
                                        <div class="img fl"><img src="<%=path %>/upload/${list.images}"  style="width: 35px;height: 35px"  alt=""></div>
                                        <span class="fl">  ${list.name}</span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/yunmi/commodity?commodityid=${list.commodityid}">选购</a></div>
                                <div class="clear"></div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </li>
        </ul>

    </div>

</div>

<div class="sub_banner center">
    <div class="sidebar fl">
        <div class="fl"><a href=""><img src="<%=path %>/qt_img/hjh_01.gif"></a></div>
        <div class="fl"><a href=""><img src="<%=path %>/qt_img/hjh_02.gif"></a></div>
        <div class="fl"><a href=""><img src="<%=path %>/qt_img/hjh_03.gif"></a></div>
        <div class="fl"><a href=""><img src="<%=path %>/qt_img/hjh_04.gif"></a></div>
        <div class="fl"><a href=""><img src="<%=path %>/qt_img/hjh_05.gif"></a></div>
        <div class="fl"><a href=""><img src="<%=path %>/qt_img/hjh_06.gif"></a></div>
        <div class="clear"></div>
    </div>

    <div class="datu fl"><a href="/yunmi/commodity?commodityid=11"><img src="<%=path %>/qt_img/tj1.jpg" alt=""></a></div>
    <div class="datu fl"><a href="/yunmi/commodity?commodityid=8"><img src="<%=path %>/qt_img/tj2.jpg" alt=""></a></div>
    <div class="datu fr"><a href="/yunmi/commodity?commodityid=866"><img src="<%=path %>/qt_img/tj3.jpg" alt=""></a></div>
    <div class="clear"></div>


</div>

<!-- start danpin -->
<div class="danpin center" style="background: rgb(250,250,250)">

    <div class="biaoti center">小米明星单品</div>
    <div class="main center" style="width: 1226px;height: 380px">
        <div class="mingxing fl"  style="background: #ffffff">
            <div class="sub_mingxing"><a href="/yunmi/commodity?commodityid=15"><img src="<%=path %>/upload/a5fdd4821cc648c0974f41ce662290c7redmik20prok.jpg" alt=""></a></div>
            <div class="pinpai"><a href="/yunmi/commodity?commodityid=15">Redmi K20 Pro 尊享版</a></div>
            <div class="youhui">高通骁龙855 Plus处理器 </div>
            <div class="jiage">2399元</div>
        </div>
        <div class="mingxing fl"  style="background: #ffffff">
            <div class="sub_mingxing"><a href="/yunmi/commodity?commodityid=12"><img src="<%=path %>/upload/39b09b9463df48918f4ee55787fca30axiaomimax3.jpg" alt=""></a></div>
            <div class="pinpai"><a href="/yunmi/commodity?commodityid=12">小米Max3</a></div>
            <div class="youhui">骁龙845 AIE 旗舰处理器</div>
            <div class="jiage">2599元</div>
        </div>
        <div class="mingxing fl"  style="background: #ffffff">
            <div class="sub_mingxing"><a href="/yunmi/commodity?commodityid=77"><img src="<%=path %>/upload/04c880775607440abf9fd2fbb164e371DS4A58YC2.jpg" alt=""></a></div>
            <div class="pinpai"><a href="/yunmi/commodity?commodityid=77">小米电视4A 58英寸</a></div>
            <div class="youhui">4K超高清+HDR</div>
            <div class="jiage">1999元</div>
        </div>
        <div class="mingxing fl"  style="background: #ffffff">
            <div class="sub_mingxing"><a href="/yunmi/commodity?commodityid=862"><img src="<%=path %>/upload/bb3072d100b94f4ab6e304c8ac85c21fdylg.jpg" alt=""></a></div>
            <div class="pinpai"><a href="/yunmi/commodity?commodityid=862">电压力锅</a></div>
            <div class="youhui"> 全新 OLED 触控交互体验</div>
            <div class="jiage">499元</div>
        </div>
        <div class="mingxing fl" style="background: #ffffff">
            <div class="sub_mingxing"><a href="/yunmi/commodity?commodityid=892"><img src="<%=path %>/upload/7912ca13fac94dada4f563395302d5c3xayxhd.jpg" alt=""></a></div>
            <div class="pinpai"><a href="/yunmi/commodity?commodityid=892">小爱音箱HD</a></div>
            <div class="youhui">360° 全向音效 / 澎湃低音 / 精准拾音</div>
            <div class="jiage">549元</div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!--横条-->

    <div  style="width: 1226px;height: 120px;margin-left:145px;margin-top: 20px;" >
        <a href="/yunmi/commodity?commodityid=7"><img src="<%=path %>/qt_img/ht1.webp"  style="width: 1226px;height: 120px;"></a>
    </div>

<div class="peijian w">
    <div class="biaoti center">手机</div>
    <div class="main center" >

        <div class="content">
            <div class=" fl" style="width: 220px;height: 612px;">
                <div class="tu"><a href="/yunmi/commodity?commodityid=5"><img src="<%=path %>/qt_img/sj0.webp"  style="width: 220px;height: 612px"></a></div>
            </div>
            <div class="remen fl" style="margin-left: 10px;">
                <div class="xinpin"><span>新品</span></div>
                <div class="tu"><a href="/yunmi/commodity?commodityid=1"><img src="<%=path %>/qt_img/sj1.webp" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=1">Redmi K30</a></div>
                 <div class="pingjia">120Hz流速屏， 全速热爱</div>
                <div class="jiage">2199元</div>

            </div>
            <div class="remen fl">
                <div class="xinpin"><span>新品</span></div>
                <div class="tu"><a href="/yunmi/commodity?commodityid=2"><img src="<%=path %>/qt_img/sj2.webp" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=2">Redmi K30 5G</a></div>
                <div class="pingjia">双模5G， 120Hz流速屏</div>
                <div class="jiage">2699元</div>

            </div>
            <div class="remen fl">
                <div class="tu"><a href="/yunmi/commodity?commodityid=18"><img src="<%=path %>/qt_img/sj3.webp" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=18">小米CC9 Pro</a></div>
                <div class="pingjia">1亿像素 五摄四闪</div>
                <div class="jiage">2799元</div>

            </div>
            <div class="remen fl">
                <div class="tu"><a href="/yunmi/commodity?commodityid=7"><img src="<%=path %>/qt_img/sj4.webp" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=7">小米9 Pro 5G</a></div>
                <div class="pingjia">5G双卡全网通，骁龙855Plus</div>
                <div class="jiage">4299元</div>

            </div>
            <div class="clear"></div>
        </div>
        <div class="content">

            <div class="remen fl"  style="margin-left: 10px">
                <div class="tu"><a href="/yunmi/commodity?commodityid=4"><img src="<%=path %>/qt_img/sj5.webp" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=4">Redmi 8</a></div>
                <div class="pingjia">5000mAh超长续航</div>
                <div class="jiage">899元</div>

            </div>
            <div class="remen fl">
                <div class="tu"><a href="/yunmi/commodity?commodityid=3"><img src="<%=path %>/qt_img/sj6.webp" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=3">Redmi 8A</a></div>
                <div class="pingjia">5000mAh超长续航</div>
                <div class="jiage">699元</div>

            </div>
            <div class="remen fl">
                <div class="tu"><a href="/yunmi/commodity?commodityid=19"><img src="<%=path %>/qt_img/sj7.webp" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=19">Redmi Note 8 Pro</a></div>
                <div class="pingjia">6400万全场景四摄</div>
                <div class="jiage">1299元起</div>

            </div>
            <div class="remen fl">
                <div class="tu"><a href="/yunmi/commodity?commodityid=8"><img src="<%=path %>/qt_img/sj8.webp" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=8">Redmi Note 8</a></div>
                <div class="pingjia">千元4800万四摄</div>
                <div class="jiage">1099元</div>

            </div>
            <div class="clear"></div>
        </div>

    </div>
    <!--横条-->
    <div  style="width: 1226px;height: 120px;margin-top: 20px" >
        <a href="#"><img src="<%=path %>/qt_img/ht2.webp"  style="width: 1226px;height: 120px;"></a>
    </div>
</div>


<div class="peijian w">
    <div class="biaoti center">家电</div>
    <div class="main center">
        <div class="content">

    <div class="remen fl"><a href="/yunmi/commodity?commodityid=845"><img src="<%=path %>/qt_img/jd1.png"></a>
    </div>
            <div class="remen fl" >
                <div class="tu"><a href="/yunmi/commodity?commodityid=953"><img src="<%=path %>/qt_img/jd2.webp" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=953">米家互联网空调C1</a></div>
                <div class="pingjia">变频节能省电，自清洁</div>
                <div class="jiage">2599元</div>

            </div>
            <div class="remen fl">
                <div class="tu"><a href="/yunmi/commodity?commodityid=842"><img src="<%=path %>/qt_img/jd3.jpg" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=842">米家空调</a></div>
                <div class="pingjia">出众静音，快速制冷热</div>
                <div class="jiage">2599元</div>

            </div>
            <div class="remen fl">
                <div class="tu"><a href="/yunmi/commodity?commodityid=843"><img src="<%=path %>/qt_img/jd4.webp" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=843">滚筒洗衣机</a></div>
                <div class="pingjia">一级能效，省水省电</div>
                <div class="jiage">2299元</div>

            </div>
            <div class="remen fl">
                <div class="tu"><a href="/yunmi/commodity?commodityid=66"><img src="<%=path %>/qt_img/jd5.jpg" ></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=66">小米电视4A 32英寸</a></div>
                <div class="pingjia">人工智能系统，高清液晶屏</div>
                <div class="jiage">699元</div>

            </div>
            <div class="clear"></div>
        </div>
        <div class="content">
            <div class="remen fl"><a href="/yunmi/commodity?commodityid=848"><img src="<%=path %>/qt_img/jd6.png"></a>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href="/yunmi/commodity?commodityid=844"><img src="<%=path %>/qt_img/jd7.webp"></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=844"></a>全自动波轮洗衣机1A 8kg</div>
                <div class="pingjia">一键操作，父母都爱用</div>
                <div class="jiage">899元</div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href="/yunmi/commodity?commodityid=73"><img src="<%=path %>/qt_img/jd8.webp"></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=73">小米全面屏电视E55A</a></div>
                <div class="pingjia">全面屏设计，人工智能语音</div>
                <div class="jiage">1799元</div>
            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href="/yunmi/commodity?commodityid=100"><img src="<%=path %>/upload/fa9a99b0dbca48f6b7fba4f73ec88e83yxb.jpg"></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=100">小米游戏本15.6"</a></div>
                <div class="pingjia">全面均衡的国民轻薄本</div>
                <div class="jiage">7999元</div>

            </div>
            <div class="remen fl">
                <div class="xinpin"><span style="background:#fff"></span></div>
                <div class="tu"><a href="/yunmi/commodity?commodityid=97"><img src="<%=path %>/upload/90b5c67704784d78b70805d33806322bair13.3.jpg"></a></div>
                <div class="miaoshu"><a href="/yunmi/commodity?commodityid=97">Air 13.3" 2019款</a></div>
                <div class="pingjia">兼顾办公娱乐与轻薄的高性能笔记本</div>
                <div class="jiage">5699元</div>

            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<footer class="mt20 center">
    <div class="mt20">云米商城|MIUI|米聊|多看书城|云米路由器|视频电话|云米天猫店|云米淘宝直营店|云米网盟|云米移动|隐私政策|Select Region</div>
    <div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div>
    <div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
</footer>
<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/indexk.js"></script>

<script>
    $("#search").click(function () {
        var inputText=$("#searchinput").val();            //获取输入框内容
        var name = encodeURI(encodeURI(inputText)); //解码ajax发送的中文参数
        $.ajax({
            url:" /yunmi/searchCommodityname?name="+name,
            type:"post",
            success:function (result) {

                switch (result.code) {
                    case 100:           //表示查询成功（多个商品）
                        var ids=result.map.commodityIds;
                        window.location.href="/yunmi/commodityByCat?ids="+ids;
                        break;
                    case 200:           //表示查询不到商品
                        alert("暂时还没有与【"+inputText+"】有关的商品，请重新查询！")
                        break;
                    case 300:         //表示查询成功（单个商品）
                        var list=result.map.commodityIds;
                        window.location.href="/yunmi/commodity?commodityid="+list;
                        break;
                }
            }
        });
    })
</script>

</body>
</html>