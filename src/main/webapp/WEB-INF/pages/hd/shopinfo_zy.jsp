
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>店铺信息</title>

    <% String path = request.getContextPath();%>
    <link rel="shortcut icon" href="<%=path %>/qt_img/logo_top.png">

    <link   rel="stylesheet" type="text/css"  href="<%=path %>/css/bootstrap.min.css"  >
    <script src="<%=path %>/js/bootstrap.min.js"></script>

    <link href="<%=path %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="<%=path %>/css/style.css" rel='stylesheet' type='text/css' />
    <link href="<%=path %>/css/font-awesome.css" rel="stylesheet">
    <link href='<%=path %>/css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
    <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
    <script src="<%=path %>/js/modernizr.custom.js"></script>
    <script src="<%=path %>/js/Chart.js"></script>
    <script src="<%=path %>/js/metisMenu.min.js"></script>
    <script src="<%=path %>/js/custom.js"></script>
    <link href="<%=path %>/css/custom.css" rel="stylesheet">
    <!--//Metis Menu -->
    <style>
        #chartdiv {
            width: 100%;
            height: 295px;
        }
    </style>
    <!--pie-chart --><!-- index page sales reviews visitors pie chart -->
    <script src="<%=path %>/js/pie-chart.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('#demo-pie-1').pieChart({
                barColor: '#2dde98',
                trackColor: '#eee',
                lineCap: 'round',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('#demo-pie-2').pieChart({
                barColor: '#8e43e7',
                trackColor: '#eee',
                lineCap: 'butt',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });

            $('#demo-pie-3').pieChart({
                barColor: '#ffc168',
                trackColor: '#eee',
                lineCap: 'square',
                lineWidth: 8,
                onStep: function (from, to, percent) {
                    $(this.element).find('.pie-value').text(Math.round(percent) + '%');
                }
            });


        });

    </script>
    <!-- //pie-chart --><!-- index page sales reviews visitors pie chart -->

    <!-- requried-jsfiles-for owl -->
    <link href="<%=path %>/css/owl.carousel.css" rel="stylesheet">
    <script src="<%=path %>/js/owl.carousel.js"></script>
    <script>
        $(document).ready(function() {
            $("#owl-demo").owlCarousel({
                items : 3,
                lazyLoad : true,
                autoPlay : true,
                pagination : true,
                nav:true,
            });
        });
    </script>
    <!-- //requried-jsfiles-for owl -->
</head>
<body class="cbp-spmenu-push">
<div class="main-content">
    <div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
        <!--left-fixed -navigation-->
        <aside class="sidebar-left">
            <nav class="navbar navbar-inverse">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1><a class="navbar-brand" href="/tz/index-hd"><span class="fa fa-area-chart"></span>云米后台<span class="dashboard_text">欢迎进入云米管理系统</span></a></h1>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>
                        <li class="treeview">
                            <a href="/tz/index-hd">
                                <i class="fa fa-dashboard"></i> <span>云米主页</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-laptop"></i>
                                <span>我的商品</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="/cat/findAll"><i class="fa fa-angle-right"></i> 添加商品</a></li>
                                <li><a href="/commodity/findAll"><i class="fa fa-angle-right"></i> 管理商品</a></li>
                                <li><a href="/commodity/commodity_status"><i class="fa fa-angle-right"></i> 商品状态</a></li>
                            </ul>
                        </li>

                        <li class="treeview">
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-laptop"></i>
                                <span>我的订单</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="/order/findAll"><i class="fa fa-angle-right"></i> 订单列表</a></li>
                                <li><a href="/order/orders_status0"><i class="fa fa-angle-right"></i> 未受理订单</a></li>
                                <li><a href="/order/orders_status1"><i class="fa fa-angle-right"></i> 未发货订单</a></li>
                                <li><a href="/order/orders_status2"><i class="fa fa-angle-right"></i> 已发货订单</a></li>
                                <li><a href="/order/orders_status3"><i class="fa fa-angle-right"></i> 已完成订单</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/user/findAll">
                                <i class="fa fa-th"></i> <span>用户管理</span>
                                <small class="label pull-right label-info">${userNumber}</small>
                            </a>
                        </li>

                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-table"></i> <span>我的分类</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="/cat/findAllcat"><i class="fa fa-angle-right"></i> 已有商品分类</a></li>
                                <li><a href="/cat/findcs2"><i class="fa fa-angle-right"></i> 无商品分类</a></li>
                            </ul>
                        </li>

                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-envelope"></i> <span>催单提醒 </span>
                                <i class="fa fa-angle-left pull-right"></i>
                                <c:if test="${number1!=0}">
                                    <small class="label pull-right label-info1">${number1}</small>
                                </c:if>
                                <c:if test="${number0!=0}">
                                    <span class="label label-primary1 pull-right">${number0}</span>
                                </c:if>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="/remind/remind0"><i class="fa fa-angle-right"></i>受理提醒</a></li>
                                <li><a href="/remind/remind1"><i class="fa fa-angle-right"></i>发货提醒 </a></li>
                            </ul>
                        </li>

                        <li class="treeview">
                            <a href="/shopinfo/shopinfo_zy">
                                <i class="fa fa-edit"></i> <span>我的信息</span>

                            </a>

                        </li>

                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>
        </aside>
    </div>
    <!--left-fixed -navigation-->


    <div class="sticky-header header-section ">
        <div class="header-left">
            <!--toggle button start-->
            <button id="showLeftPush" style="margin-left: 15px"><i class="fa fa-bars"></i></button>
            <!--toggle button end-->
            <div class="profile_details_left"><!--notifications of menu start -->
                <!-- 提醒受理 提醒发货 -->
                <ul class="nofitications-dropdown">
                    <li class="dropdown head-dpdn">
                        <a href="/remind/remind0" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-envelope"></i><span class="badge">${number0}</span></a>
                    </li>

                    <li class="dropdown head-dpdn">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-bell"></i><span class="badge blue">${number1}</span></a>
                    </li>

                </ul>
                <div class="clearfix"> </div>
            </div>
            <!--notification menu end -->
            <div class="clearfix"> </div>
        </div>
        <div class="header-right">




            <div class="profile_details">
                <ul>
                    <li class="dropdown profile_details_drop">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <div class="profile_img">
                                <span class="prfil-img">
                                    <img src="#" id="shopimagesk2" style="width: 50px;height: 50px">
                                </span>
                                <div class="user-name">
                                    <p>店铺名</p>
                                    <p  style="color: black;font-size: 13px;margin-top: 5px" id="shopnamek2"></p>
                                </div>
                                <i class="fa fa-angle-down lnr"></i>
                                <i class="fa fa-angle-up lnr"></i>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                        <ul class="dropdown-menu drp-mnu">
                            <li> <a href="/shopinfo/shopinfo_zy"><i class="fa fa-user"></i> 我的信息</a> </li>
                            <li> <a href="/login/login1"><i class="fa fa-sign-out"></i> 退出</a> </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
    </div>
    <!-- //header-ends -->
    <!-- main content start-->	</div>

<!----------------------------------------------------------写在这里空白---------------------------------------------------------->
<div id="page-wrapper">



    <div class="container" >
        <p style="margin-left: 350px;font-size: 15px">您填写的信息将在店铺前台展示给买家，请认真填写！</p>
        <span style="color: black;font-size: 15px">基础信息</span>

        <form class="form-horizontal" action="/shopinfo/update?shopinfoid=${shopinfo.shopinfoid}" method="post"  enctype="multipart/form-data">

            <div class="form-group">
                <label  class="col-sm-2 control-label">店铺名称:</label>
                <div class="col-sm-2">
                    <input type="text" name="shopname" value="${shopinfo.shopname}" class="form-control"placeholder="店铺名称">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 control-label">店铺标志:</label>
                <div class="col-sm-1">
                <img src="<%=path%>/upload/${shopinfo.shopimage}" style="width: 80px;height: 80px" class="img-circle">
                </div>
                <div class="col-sm-4">
                <input style="margin-top: 20px" type="file"  name="file"/>
                </div>
            </div>


            <div class="form-group">
                <label  class="col-sm-2 control-label">信誉等级:</label>
                <div class="col-sm-1 control-label">
                    <p style="margin-right: 30px">${shopinfo.shopblue}星</p>
                </div>

            </div>
            <div class="form-group">
            <label  class="col-sm-2 control-label">粉丝数:</label>
            <div class="col-sm-1 control-label">
                <p>${shopinfo.shopfs}万</p>
            </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">发货地:</label>
                <div class="col-sm-4" style="width: 120px">
                    <select class="form-control"  name="shopaddress" id="shopaddress" >

                        <%--           可以放option里面     ${shopinfo.shopaddress eq "北京"?"selected":"}"--%>
                        <option value="天津">天津</option>
                        <option value="河北">河北</option>
                        <option value="山西">山西</option>
                        <option value="内蒙古">内蒙古</option>
                        <option value="北京">北京</option>
                        <option value="辽宁">辽宁</option>
                        <option value="吉林">吉林</option>
                        <option value="黑龙江">黑龙江</option>
                        <option value="上海">上海</option>
                        <option value="江苏">江苏</option>
                        <option value="浙江">浙江</option>
                        <option value="安徽">安徽</option>
                        <option value="福建">福建</option>
                        <option value="江西">江西</option>
                        <option value="山东">山东</option>
                        <option value="河南">河南</option>
                        <option value="湖北">湖北</option>
                        <option value="湖南">湖南</option>
                        <option value="广东">广东</option>
                        <option value="广西">广西</option>
                        <option value="海南">海南</option>
                        <option value="重庆">重庆</option>
                        <option value="四川">四川</option>
                        <option value="贵州">贵州</option>
                        <option value="云南">云南</option>
                        <option value="西藏">西藏</option>
                        <option value="陕西">陕西</option>
                        <option value="甘肃">甘肃</option>
                        <option value="青海">青海</option>
                        <option value="宁夏">宁夏</option>
                        <option value="新疆">新疆</option>
                        <option value="台湾">台湾</option>
                        <option value="香港">香港</option>
                        <option value="澳门">澳门</option>
                        <option value="海外">海外</option>
                    </select>
                </div>
            </div>


            <div class="form-group">
                <label  class="col-sm-2 control-label">店铺介绍:</label>
                <div class="col-sm-10">

                    <textarea style="height: 130px" name="shopjs" class="form-control" >${shopinfo.shopjs}</textarea>
                </div>
            </div>
            </c>
            <div class="form-group">
                <label  class="col-sm-2 control-label"></label>
                <div class="col-sm-10">
                    <input  type="checkbox" id="checkbox1"/>
                    <span>我声明，此页面所填写内容均真实有效，特别是经营地址为店铺最新可联系到的地址。同时可以作为行政机关和司法机关送达法律文件的地址。
                        如果上述地址信息有误，愿意承担由此带来的行政监管和司法诉讼风险。</span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" id="shopinfo_edit_btn" class="btn btn-default disabled">保存</button>
                </div>
            </div>

        </form>
    </div>

</div>



<script>
    var shopaddress="${shopinfo.shopaddress}";  //获取当前发货地址
    $("#shopaddress").val(shopaddress);              //下拉框显示发货地址为上面获取的发货地址

    //点击复选框才可以点击保存按钮方法
    $("#checkbox1").click(function () {
        if ($("#checkbox1").prop("checked")==true){
            $("#shopinfo_edit_btn").removeClass("disabled");
        }else {
            $("#shopinfo_edit_btn").addClass("disabled");
        }

    });




</script>
<!--显示店铺名和图片到右上角导航栏-->
<script>
    $.ajax({
        url:"/shopinfo/shopinfo_NameAndTp",
        type:"Get",
        success:function(result){
            var shopk=result.map.shopinfoNameAndTp;
            $("#shopnamek2").text(shopk.shopname);
            document.getElementById("shopimagesk2").src=<%=path%>/upload/+shopk.shopimage;
        }
    });
</script>
<!--主菜单关闭功能-->
<script src="<%=path %>/js/classie.js"></script>
<script>
    var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
        showLeftPush = document.getElementById( 'showLeftPush' ),
        body = document.body;

    showLeftPush.onclick = function() {
        classie.toggle( this, 'active' );
        classie.toggle( body, 'cbp-spmenu-push-toright' );
        classie.toggle( menuLeft, 'cbp-spmenu-open' );
        disableOther( 'showLeftPush' );
    };


    function disableOther( button ) {
        if( button !== 'showLeftPush' ) {
            classie.toggle( showLeftPush, 'disabled' );
        }
    }
</script>
<script src="<%=path %>/js/jquery.nicescroll.js"></script>
<script src="<%=path %>/js/scripts.js"></script>
<script src='<%=path %>/js/SidebarNav.min.js' type='text/javascript'></script>
<script>
    $('.sidebar-menu').SidebarNav()
</script>
<script src="<%=path %>/js/SimpleChart.js"></script>
<script src="<%=path %>/js/bootstrap.js"> </script>

</body>
</html>
