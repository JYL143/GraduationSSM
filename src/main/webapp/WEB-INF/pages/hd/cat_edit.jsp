
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>分类(有商品)管理</title>

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
<!-- ----------------------------------------分类修改的模态框-------------------------------------------------------------- -->
<div class="modal fade" id="updatCatModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">分类更新</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal"  method="post"  >
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类名字:</label>
                        <div class="col-sm-4">
                            <input type="text"  name="catname"   id="cat_name" class="form-control" placeholder="分类名字">
                            <span class="help-block"></span>
                        </div>

                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="cat_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<!----------------------------------------------------------写在这里空白---------------------------------------------------------->
<div id="page-wrapper">
    <div class="container" >

        <div>
            <span style="color: black;font-size: 25px">分类(有商品)管理</span>
        </div>


        <!-- 显示表格信息,使用jq放组件-->
        <div class="row" >
            <div class="col-md-12">
                <table class="table table-hover" >
                    <thead>
                    <tr>
                        <th>分类ID</th>
                        <th>分类名</th>
                        <th>商品数量</th>
                        <th >操作</th>
                    </tr>

                    <c:forEach items="${pageinfo.list}" var="cat">
                        <tr>

                            <th>${cat['cat_id']}</th>
                            <th>${cat['cat_name']}</th>
                            <th>${cat['number']}</th>
                            <th>
                                <button onclick="cat_edit(${cat['cat_id']})"   class="btn btn-primary btn-sm"  >编辑</button>
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
                            <li class="disabled"><a   href="/cat/findAllcat">首页</a></li>
                            <li class="disabled" >
                                <a  href="/cat/findAllcat?pn=${pageinfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageinfo.hasPreviousPage}"> <%-- 是否有上一页，有就显示正常--%>
                            <li><a  href="/cat/findAllcat">首页</a></li>
                            <li>
                                <a href="/cat/findAllcat?pn=${pageinfo.pageNum-1}" aria-label="Previous">
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
                                <li><a href="/cat/findAllcat?pn=${page_Num}">${page_Num}</a></li>
                            </c:if>


                        </c:forEach>


                        <c:if test="${!pageinfo.hasNextPage}">
                            <li class="disabled">
                                <a href="/cat/findAllcat?pn=${pageinfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li class="disabled"><a href="/cat/findAllcat?pn=${pageinfo.pages}">末页</a></li>
                        </c:if>

                        <c:if test="${pageinfo.hasNextPage}">
                            <li>
                                <a href="/cat/findAllcat?pn=${pageinfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li><a href="/cat/findAllcat?pn=${pageinfo.pages}">末页</a></li>
                        </c:if>


                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    <%-------------------------------------------- 点击编辑按钮  -------------------------------------------------------%>
    function cat_edit(catid) {
        k=catid;

        $.ajax({
            url:"/cat/findbycatid?catid="+catid,
            type:"GET",
            success:function (result) {
                var cat=result.map.cat[0];
                $("#cat_name").val(cat.catname);
            }
        });

        $("#updatCatModal").modal({
            backdrop:"static"//给modal方法传参数，这个参数设置为就是点击背景不关闭弹出框
        });
    };


    <%-------------------------------------------- 点击更新按钮  -------------------------------------------------------%>
    $("#cat_update_btn").click(function () {

        var pageNUM=document.getElementById('pageNUM').innerHTML;

        $.ajax({
            url:"/cat/update?catid="+k,
            type:"POST",
            data:$("#updatCatModal form").serialize(),
            success:function () {
                $("#updatCatModal").modal("hide"); //关闭模态框
                window.location.href="/cat/findAllcat?pn="+pageNUM;//跳转到当前页码那一页
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