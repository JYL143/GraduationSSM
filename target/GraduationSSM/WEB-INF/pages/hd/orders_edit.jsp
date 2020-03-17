<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品管理</title>

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
	</div>
<!-- ----------------------------------------快速发货的模态框-------------------------------------------------------------- -->
<div class="modal fade" id="Quickdelivery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >快速发货</h4>
            </div>
            <div class="modal-body">
                <!------------------ 表单------------------>
                <%--  springmvc会自动封装表单提交的数据，前提就是表单对应的name和javabean实体类想对应--%>
                <form class="form-horizontal" >


                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品名字:</label>
                        <div class="col-sm-10">
                            <p  id="commodity_status2" class="form-control-static" ></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品图片:</label>
                        <div class="col-sm-10">
                            <img src="#"  width="45px" height="45px" id="images2">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品数量:</label>
                        <div class="col-sm-10">
                            <p  id="quantity2" class="form-control-static" >1</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">收货人:</label>
                        <div class="col-sm-10">
                            <p  id="realname2" class="form-control-static" ></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">联系电话</label>
                        <div class="col-sm-10">
                            <p  id="phone" class="form-control-static" ></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">收货地址:</label>
                        <div class="col-sm-10">
                            <p  id="useraddress2" class="form-control-static" ></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮编:</label>
                        <div class="col-sm-10">
                            <p  id="zipcode2" class="form-control-static" ></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">快递:</label>
                        <div class="col-sm-4"  >
                        <select  name="kd">
                            <option value="1">中通快递</option>
                            <option value="2">圆通快递</option>
                            <option value="3">申通快递</option>
                            <option value="4">顺丰快递</option>
                            <option value="5">韵达快递</option>
                            <option value="6">天天快递</option>
                            <option value="7">宅急送</option>
                        </select>
                        </div>
                    </div>

                    <div class="form-group">
                    <label class="col-sm-2 control-label" >单号:</label>
                    <div class="col-sm-5"  >
                        <input type="text"  name="orderbh"  id="orderbh" class="form-control" placeholder="单号">
                    </div>
                        <div class="col-sm-5"  >
                        <button type="button" class="btn btn-primary btn-sm control-label" id="orders_bh">快速生成</button>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary disabled" id="orderstatusedit2">发货</button>
            </div>
        </div>
    </div>
</div>
<!-- ----------------------------------------查看订单详情的模态框-------------------------------------------------------------- -->
<div class="modal fade" id="findAllOrdersItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">订单详情</h4>
            </div>
            <div class="modal-body">
                <!------------------ 表单------------------>
                <%--  springmvc会自动封装表单提交的数据，前提就是表单对应的name和javabean实体类想对应--%>
                <form class="form-horizontal" >


                    <div class="form-group">
                        <label class="col-sm-2 control-label">单号:</label>
                        <div class="col-sm-4">
                            <p  id="orderbh2" class="form-control-static" ></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">下单时间:</label>
                        <div class="col-sm-4">
                            <p  id="ordertimeStr" class="form-control-static" ></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品名:</label>
                        <div class="col-sm-4">
                            <p  id="commodity_status" class="form-control-static" ></p>
                        </div>
                        <label class="col-sm-2 control-label">商品图片:</label>
                        <div class="col-sm-4">
                            <img src="#"  width="45px" height="45px" id="images">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品数量:</label>
                        <div class="col-sm-4">
                            <p  id="quantity" class="form-control-static" ></p>
                        </div>
                        <label class="col-sm-2 control-label">商品价格:</label>
                        <div class="col-sm-4">
                            <p  id="price" class="form-control-static" ></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">运费:</label>
                        <div class="col-sm-4">
                            <p  id="postage" class="form-control-static" ></p>
                        </div>
                        <label class="col-sm-2 control-label">订单总额:</label>
                        <div class="col-sm-4">
                            <p  id="money" class="form-control-static" ></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">收货人:</label>
                        <div class="col-sm-4">
                            <p  id="realname" class="form-control-static" ></p>
                        </div>
                        <label class="col-sm-2 control-label">邮编:</label>
                        <div class="col-sm-4">
                            <p  id="zipcode" class="form-control-static" ></p>
                        </div>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-2 control-label">收货地址:</label>
                    <div class="col-sm-10">
                        <p  id="useraddress" class="form-control-static" ></p>
                    </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单状态:</label>
                        <div class="col-sm-4">
                            <p  id="orderstatus" class="form-control-static" ></p>
                        </div>
                        <label class="col-sm-2 control-label">快递公司:</label>
                        <div class="col-sm-4">
                            <p  id="kd" class="form-control-static" ></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">发货时间:</label>
                        <div class="col-sm-4">
                            <p  id="sendtimeStr" class="form-control-static" ></p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">成交时间:</label>
                        <div class="col-sm-4">
                            <p  id="closetimeStr" class="form-control-static" ></p>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!----------------------------------------------------------写在这里空白---------------------------------------------------------->
<div id="page-wrapper">
    <div class="container" >




        <div>
            <span style="color: black;font-size: 25px">订单管理</span>
        </div>
        <div style="margin-top: 20px;margin-left: 20px">

            <form  action="/order/Search?status=99" method="post">

                <div style="float: left">
                    <span style="padding-top: 10px ;display: inline-block">单号查询(含时间查询):</span>
                </div>

                <div class="search-box" style="width: 240px;margin-left: 20px">
                    <input class=" input__field--madoka"  style="width: 240px;" name="bh" type="text" id="input-31" />
                    <label class="input__label" for="input-31">
                        <svg class="graphic" width="100%" height="100%" viewBox="0 0 404 77" preserveAspectRatio="none">
                            <path d="m0,0l404,0l0,77l-404,0l0,-77z"/>
                        </svg>
                    </label>
                </div>

                <div>
                    <div style="float: left">
                    <span style="padding-top: 10px ;margin-left:50px;display: inline-block">订单金额:</span>
                </div>
                    <div class="search-box" style="width: 90px;margin-left: 20px">
                        <input class=" input__field--madoka"  style="width: 90px;" name="je1" type="text" id="input-34" placeholder="最小值" />
                        <label class="input__label" for="input-34">
                            <svg class="graphic" width="100%" height="100%" viewBox="0 0 404 77" preserveAspectRatio="none">
                                <path d="m0,0l404,0l0,77l-404,0l0,-77z"/>
                            </svg>
                        </label>
                    </div>
                    <div>
                        <div style="float: left">
                            <span style="padding-top: 10px ;display: inline-block">——</span>
                        </div>
                    <div class="search-box" style="width: 90px;">
                        <input class=" input__field--madoka"  style="width: 90px;" name="je2" type="text" id="input-35"  placeholder="最大值"/>
                        <label class="input__label" for="input-35">
                            <svg class="graphic" width="100%" height="100%" viewBox="0 0 404 77" preserveAspectRatio="none">
                                <path d="m0,0l404,0l0,77l-404,0l0,-77z"/>
                            </svg>
                        </label>
                    </div>
                        <div style="float: left">
                            <input  style="width: 70px;height: 35px;margin-top: 7px;margin-left: 60px;" type="submit" class="btn btn-primary"value="搜索"  />
                            <a  style="width: 90px;height: 35px;margin-top: 7px;margin-left: 10px;"  href="/order/findAll" class="btn btn-primary"  >返回查询</a>
                        </div>

                </div>
                </div>
            </form>

        </div>

        <!-- 显示表格信息,使用jq放组件-->
        <div class="row" style="margin-top: 30px" >
            <div class="col-md-12">
                <table class="table table-hover" >
                    <thead>
                    <tr>
                        <th>单号</th>
                        <th>商品图片</th>
                        <th>商品数量</th>
                        <th >订单总额</th>
                        <th>收货人</th>
                        <th>下单时间</th>
                        <th>订单状态</th>
                        <th >操作</th>

                    </tr>

                    <c:forEach items="${pageinfo.list}" var="orders">
                        <tr>
                            <th>
                             <c:if test="${orders.orderbh==null }">
                                 该订单还未发货，暂无订单编号！
                            </c:if>
                                <c:if test="${orders.orderbh!=null}">
                                    ${orders.orderbh}
                                </c:if>
                            </th>
                            <th>  <img src="<%=path%>/upload/${orders.orderItems.images}"  width="45px" height="45px"></th>
                            <th>${orders.orderItems.quantity}</th>
                            <th>${orders.money}</th>
                            <th>${orders.users.realname}</th>
                            <th>${orders.ordertimeStr}</th>

                            <th>
                                <c:if test="${orders.orderstatus==0}">
                                    <p style="color: red">未处理</p>
                                </c:if>
                                <c:if test="${orders.orderstatus==1}">
                                    <p style="color: orange">未发货</p>
                                </c:if>
                                <c:if test="${orders.orderstatus==2}">
                                    <p style="color: dodgerblue">已发货</p>
                                </c:if>
                                <c:if test="${orders.orderstatus==3}">
                                    <p style="color: #9b58b5">已收货</p>
                                </c:if>
                            </th>
                            <th>
                                <button  onclick="findAll_orderitem(${orders.orderid})" class="btn btn-success btn-sm"  >查看详情</button>
                                <c:if test="${orders.orderstatus==3 ||orders.orderstatus==2}">

                                </c:if>
                                <c:if test="${orders.orderstatus==1}">

                                    <button  class="btn btn-primary btn-sm" onclick="orders_status_edit2(${orders.orderid})">快速发货</button>
                                </c:if>
                                <c:if test="${orders.orderstatus==0}">
                                    <a  href="/order/orders_status_edit1?orderid=${orders.orderid}&pageNum=${pageinfo.pageNum}" id="sl" class="btn btn-warning btn-sm "   >确认受理</a>
                                    <button  class="btn btn-primary btn-sm disabled" onclick="orders_status_edit2(${orders.orderid})">快速发货</button>
                                </c:if>
                            </th>

                        </tr>

                    </c:forEach>

                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>


        <!-- 显示分页信息-->
        <div class="row">
            <!-- 分页文字信息-->
            <div class="col-md-6" id="page_info_area">
                当前${pageinfo.pageNum}页,总${pageinfo.pages}页,总${pageinfo.total}条记录
            </div>
            <!-- 分页条信息-->
            <div class="col-md-6" id="page_nav_area">
                <nav aria-label="Page navigation">
                    <ul class="pagination">

                        <c:if test="${!pageinfo.hasPreviousPage}"> <%-- 是否有上一页，没有就显示禁用状态--%>
                            <li class="disabled"><a   href="/order/findAll">首页</a></li>
                            <li class="disabled" >
                                <a  href="/order/findAll?pn=${pageinfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageinfo.hasPreviousPage}"> <%-- 是否有上一页，有就显示正常--%>
                            <li><a  href="/order/findAll">首页</a></li>
                            <li>
                                <a href="/order/findAll?pn=${pageinfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>


                        <c:forEach items="${pageinfo.navigatepageNums}" var="page_Num">
                            <%-- 这里就是判断当前循环读出的页码是不是你查询的页码，是就高亮，不是就不高亮，然后点击页码跳转查询该页面--%>
                            <c:if test="${page_Num==pageinfo.pageNum}">
                                <li class="active"><a id="pageNUM" href="#">${page_Num}</a></li>
                            </c:if>
                            <c:if test="${page_Num!=pageinfo.pageNum}">
                                <li><a href="/order/findAll?pn=${page_Num}">${page_Num}</a></li>
                            </c:if>


                        </c:forEach>


                        <c:if test="${!pageinfo.hasNextPage}">
                            <li class="disabled">
                                <a href="/order/findAll?pn=${pageinfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li class="disabled"><a href="/order/findAll?pn=${pageinfo.pages}">末页</a></li>
                        </c:if>

                        <c:if test="${pageinfo.hasNextPage}">
                            <li>
                                <a href="/order/findAll?pn=${pageinfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li><a href="/order/findAll?pn=${pageinfo.pages}">末页</a></li>
                        </c:if>


                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<script>


    var k3; //全局变量保存点击发货时的订单id
    //---------------------------------------点击查看详情按钮------------------------------------------------------
    function findAll_orderitem(orderid) {

         getOrdersItem(orderid);    //查询订单详情信息显示到查看模态框上

        $("#findAllOrdersItem").modal({
            backdrop:"static"
        });
    }
    function getOrdersItem(orderid) {
        $.ajax({
            url:"/order/findAllbyorderid?orderid="+orderid,
            type:"GET",
            success:function (result) {

                var orders=result.map.orders[0];
                $("#orderbh2").text(orders.orderbh);                               //单号
                $("#ordertimeStr").text(orders.ordertimeStr);                     //下单时间
                $("#commodity_status").text(orders.orderItems.name);              //商品名字
                document.getElementById("images").src="<%=path%>/upload/"+orders.orderItems.images;  //商品图片
                $("#quantity").text(orders.orderItems.quantity);                  //商品数量
                $("#price").text(orders.orderItems.price);                        //商品价格
                $("#money").text(orders.money);                                   //订单总额
                $("#zipcode").text(orders.users.zipcode);                         //邮编
                $("#realname").text(orders.users.realname);                       //收货人
                $("#useraddress").text(orders.users.useraddress);                 //收货地址
                if (orders.postage==0){
                    $("#postage").text("包邮");                                   //运费
                }else{
                    $("#postage").text(orders.postage);
                }
                if (orders.orderstatus==0){                                       //订单状态 0未处理，1 未发货 2已发货 3已收货
                    $("#orderstatus").text("未处理");
                    $("#sendtimeStr").text("未处理");
                    $("#kd").text("未处理");
                    $("#closetimeStr").text("未处理");
                } else if(orders.orderstatus==1){
                    $("#orderstatus").text("未发货");
                    $("#sendtimeStr").text("未发货");
                    $("#kd").text("未发货");
                    $("#closetimeStr").text("未发货");
                }else if(orders.orderstatus==2){
                    $("#orderstatus").text("已发货");


                    $("#closetimeStr").text("未签收");
                }else{
                    $("#orderstatus").text("已到货");


                    $("#closetimeStr").text(orders.closetimeStr);                     //成交时间
                }
                if(orders.orderstatus==2 ||orders.orderstatus==3){
                    $("#sendtimeStr").text(orders.sendtimeStr);                       //发货时间
                    switch (orders.kd) {
                        case 1:
                            $("#kd").text("中通快递");
                            break;
                        case 2:
                            $("#kd").text("圆通快递");
                            break;
                        case 3:
                            $("#kd").text("申通快递");
                            break;
                        case 4:
                            $("#kd").text("顺丰快递");
                            break;
                        case 5:
                            $("#kd").text("韵达快递");
                            break;
                        case 6:
                            $("#kd").text("天天快递");
                            break;
                        case 7:
                            $("#kd").text("宅急送");
                            break;

                    }
                }
            }
        });
    }

//---------------------------------------点击发货按钮------------------------------------------------------
function orders_status_edit2(orderid) {

    $("#orderbh").val("");//清空订单编号
    $("#orderstatusedit2").addClass("disabled");


        k3=orderid;
     getOrdersItem2(orderid);  //查询订单要发货的信息显示到发货模态框

    $("#Quickdelivery").modal({
        backdrop:"static"
    });
}

//--------------------查询订单要发货的信息显示到发货模态框------------------------------
    function getOrdersItem2(orderid) {

        $.ajax({
            url:"/order/findAllbyorderid?orderid="+orderid,
            type:"GET",
            success:function (result) {
                var orders=result.map.orders[0];
                $("#orderbh2").text(orders.orderbh);                               //单号
                $("#commodity_status2").text(orders.orderItems.name);              //商品名字
                document.getElementById("images2").src="<%=path%>/upload/"+orders.orderItems.images;  //商品图片
                $("#quantity2").text(orders.orderItems.quantity);                  //商品数量
                $("#realname2").text(orders.users.realname);                       //收货人
                $("#phone").text(orders.users.phone);                              //联系电话
                $("#useraddress2").text(orders.users.useraddress);                 //收货地址
                $("#zipcode2").text(orders.users.zipcode);                         //邮编

            }
        });
    }


    //------------------------确认发货按钮-------------------------------------------------------------
    $("#orderstatusedit2").click(function () {


        var pageNUM=document.getElementById('pageNUM').innerHTML;  //不用传进去 直接下面成功用就可以了
        $.ajax({
            url:"/order/orders_status_edit2?orderid="+k3,      //k3是你点击的那个发货id，全局变量通过点击按钮的时候保存id
            type:"POST",
            data:$("#Quickdelivery form").serialize(),
            success:function (result) {
                alert("发货成功！");
                $("#Quickdelivery").modal("hide"); //关闭模态框
                window.location.href="/order/findAll?pn="+pageNUM;//跳转到当前页码那一页
            },
            error:function(){
                alert("请求失败");
            }
        });
    });
    //------------------------确认受理补一个弹跳框，不改ajax了-------------------------------------------------------------
    $("#sl").click(function () {
            alert("受理成功！")
    });


    //生成订单编号方法
    $("#orders_bh").click(function () {
        $.ajax({
            url:"/order/ordersbh",
            type:"GET",
            success:function (result) {

                $("#orderbh").val(result);
                $("#orderstatusedit2").removeClass("disabled");
            }
        });
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
