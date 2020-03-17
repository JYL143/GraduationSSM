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
<!-- ----------------------------------------商品修改的模态框-------------------------------------------------------------- -->
<div class="modal fade" id="updatCommodityseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">商品更新</h4>
            </div>
            <div class="modal-body">
                <!------------------ 表单------------------>
                <%--  springmvc会自动封装表单提交的数据，前提就是表单对应的name和javabean实体类想对应--%>
                <form class="form-horizontal"  method="post"  enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品名字:</label>
                        <div class="col-sm-4">
                            <input type="text"  name="name"   id="commodity_name" class="form-control" placeholder="商品名">
                            <span class="help-block"></span>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属类别:</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可-->
                            <select class="form-control" name="catid" id="catid" >


                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品参数:</label>
                        <div class="col-sm-10">
                            <input type="text"  name="subtitle" id="commodity_subtitle"  class="form-control" placeholder="商品参数">
                            <span class="help-block"></span>
                        </div>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label class="col-sm-2 control-label">商品图片</label>--%>
<%--                        <div class="col-sm-4">--%>
<%--                            <img src=""  width="45px" height="45px" id="commodity_image">--%>
<%--                            <span class="help-block"></span>--%>
<%--                        </div>--%>
<%--                        <div class="col-sm-4">--%>
<%--                            <input type="file" name="images" >--%>
<%--                        </div>--%>

<%--                    </div>--%>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">价格:</label>
                        <div class="col-sm-4">
                            <input type="text"  name="price" id="commodity_price" class="form-control" placeholder="价格">
                            <span class="help-block"></span>
                        </div>
                        <label class="col-sm-2 control-label">运费:</label>
                        <div class="col-sm-4">
                            <input type="text"  name="postage"   id="commodity_postage" class="form-control" placeholder="运费">
                            <span class="help-block"></span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品信息:</label>
                        <div class="col-sm-10">
                            <input type="text"  name="information"   id="commodity_information" class="form-control" placeholder="请输入商品信息...">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">详细描述:</label>
                        <div class="col-sm-10">
                            <textarea style="height: 130px" name="describe2" class="form-control"  id="commodity_describe2" placeholder="请输入商品详细描述信息....."></textarea>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品状态:</label>
                        <div class="col-sm-4">
                            <p  id="commodity_status" class="form-control-static" ></p>
                        </div>
                        <label class="col-sm-2 control-label">所剩库存:</label>
                        <div class="col-sm-4">
                            <p id="commodity_stock" class="form-control-static" ></p>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="commodity_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<!----------------------------------------------------------写在这里空白---------------------------------------------------------->
<div id="page-wrapper">
    <div class="container" >

        <div>
            <span style="color: black;font-size: 25px">商品管理</span>
        </div>
        <div style="margin-left: 20px;margin-top: 30px">
            <form  action="/commodity/findAll" method="post">

                <div style="float: left;">
                    <span style="padding-top: 14px ;display: inline-block">分类选择:</span>
                </div>
                <c:if test="${catstatus!=null}">
                    <select class="form-control"  name="catid" style="width: 120px;float: left;margin-left: 20px;margin-top: 8px" >
                        <option value="0" >全部</option>
                        <c:forEach items="${cat2}" var="cat2">
                            <option value="${cat2.catid }" <c:if test="${catstatus==cat2.catid}">selected="selected"</c:if> >${cat2.catname }</option>
                        </c:forEach>
                    </select>
                </c:if>
                <c:if test="${catstatus==null}">
                    <select  class="form-control"  name="catid" style="width: 120px;float: left;margin-left: 20px;margin-top: 8px" >
                        <option value="0" >请选择</option>
                        <c:forEach items="${cat2}" var="cat2">
                            <option value="${cat2.catid }" >${cat2.catname }</option>
                        </c:forEach>
                    </select>
                </c:if>

                    <div style="float: left">
                        <input  style="width: 70px;height: 35px;margin-top: 7px;margin-left: 30px;" type="submit" class="btn btn-primary"value="搜索"  />
                        <a  style="width: 90px;height: 35px;margin-top: 7px;margin-left: 10px;"  href="/commodity/findAll?catid=0" class="btn btn-primary"  >返回查询</a>
                    </div>


            </form>
            <button class="btn btn-danger" id="commodity_delete_all_btn" style="margin-left: 580px;margin-top: 8px" >全删</button>
        </div>




        <!-- 显示表格信息,使用jq放组件-->
        <div class="row" >
            <div class="col-md-12">
                <table class="table table-hover" >
                    <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all">
                        </th>
                        <th>商品ID</th>
                        <th>商品名</th>
                        <th>图片</th>
                        <th >商品参数</th>
                        <th>价格</th>
                        <th>运费</th>
                        <th>分类信息</th>
                        <th>库存</th>
                        <th>状态</th>
                        <th >操作</th>
                    </tr>

                        <c:forEach items="${pageinfo.list}" var="commodity">
                            <tr>
                                <th>
                                    <input type="checkbox" class='check_item'>
                                </th>
                                <th>${commodity.commodityid}</th>
                                <th>${commodity.name}</th>
                                <th>  <img src="<%=path%>/upload/${commodity.images}"  width="45px" height="45px"></th>
                                <th>${commodity.subtitle}</th>

                                <th>
                                    <c:if test="${commodity.price==0}">
                                        <p style="color: green"> 免费办理</p>
                                    </c:if>
                                    <c:if test="${commodity.price!=0}">
                                        ${commodity.price}
                                    </c:if>
                                </th>
                                <th>
                                    <c:if test="${commodity.postage==0}">
                                           <p style="color: green"> 包邮</p>
                                    </c:if>
                                    <c:if test="${commodity.postage!=0}">
                                          ${commodity.postage}
                                     </c:if>
                                </th>
                                <th>${commodity.cats.catname}</th>
                                <th>
                                    <c:if test="${commodity.stock<=100}">
                                        <p style="color:red ">${commodity.stock}</p>
                                    </c:if>
                                    <c:if test="${commodity.stock>100}">
                                        <p style="color:green ">${commodity.stock}</p>
                                    </c:if>
                                </th>

                                <th>
                                         <c:if test="${commodity.status==1}">
                                             <p style="color: green">上架中</p>
                                         </c:if>
                                         <c:if test="${commodity.status==0}">
                                             <p style="color: red">已下架</p>
                                         </c:if>
                                <%--   el表达式的三元表达式写法        ${commodity.status eq 1?"上架中":"已下架"}--%>
                                </th>
                                <th>
                                    <button onclick="update_commodity(${commodity.commodityid})"   class="btn btn-primary btn-sm"  >编辑</button>
                                    <button onclick="delete_commodity(${commodity.commodityid},'${commodity.name}')"   class="btn btn-danger btn-sm"  >删除</button>
<%--                                    <a href="/commodity/deletecommodity?commodityid=${commodity.commodityid}" class="btn btn-danger btn-sm">删除</a>--%>
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
                <p style="display: none" id="total">${pageinfo.total}</p>
            </div>
            <!-- 分页条信息-->
            <div class="col-md-6" id="page_nav_area">
                <nav aria-label="Page navigation">
                    <ul class="pagination">

                        <c:if test="${!pageinfo.hasPreviousPage}"> <%-- 是否有上一页，没有就显示禁用状态--%>
                            <li class="disabled"><a   href="/commodity/findAll">首页</a></li>
                            <li class="disabled" >
                                <a  href="/commodity/findAll?pn=${pageinfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageinfo.hasPreviousPage}"> <%-- 是否有上一页，有就显示正常--%>
                            <li><a  href="/commodity/findAll">首页</a></li>
                            <li>
                                <a href="/commodity/findAll?pn=${pageinfo.pageNum-1}" aria-label="Previous">
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
                                <li><a href="/commodity/findAll?pn=${page_Num}">${page_Num}</a></li>
                            </c:if>


                        </c:forEach>


                        <c:if test="${!pageinfo.hasNextPage}">
                            <li class="disabled">
                                <a href="/commodity/findAll?pn=${pageinfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li class="disabled"><a href="/commodity/findAll?pn=${pageinfo.pages}">末页</a></li>
                        </c:if>

                        <c:if test="${pageinfo.hasNextPage}">
                            <li>
                                <a href="/commodity/findAll?pn=${pageinfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li><a href="/commodity/findAll?pn=${pageinfo.pages}">末页</a></li>
                        </c:if>


                    </ul>
                </nav>
            </div>
        </div>
</div>
</div>

<script type="text/javascript">
    var k; //全局变量保存点击修改时的商品id
    var k2; //全局变量保存点击删除时的商品id
    <%-------------------------------------------- 点击编辑按钮  -------------------------------------------------------%>
    function update_commodity(commodityid) {
        k=commodityid;   //全局变量保存点击时的商品id
        getCatname("#updatCommodityseModal select");  //查询商品分类信息
        getCommoditys(commodityid);    //查询商品信息显示到修改模态框上

        $("#updatCommodityseModal").modal({
            backdrop:"static"//给modal方法传参数，这个参数设置为就是点击背景不关闭弹出框
        });
    };

    function getCatname(ele) {
        //清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url:"/cat/findAll2",
            type:"GET",
            success:function (result) {
                // console.log(result);
                $.each(result.map.cats,function () {//不设置参数索引和当前对象，下面可以直接this获取当前遍历对象(result.map.cats),
                    // 因为option要提交值，所以给个value提交当前分类id值
                    var optionEle=$("<option ></option>").append(this.catname).attr("value",this.catid);
                    optionEle.appendTo("#updatCommodityseModal select");
                });
            }
        });
    }
    function getCommoditys(commodityid) {
        $.ajax({
            url:"/commodity/findbycommodityid?commodityid="+commodityid,
            type:"GET",
            success:function (result) {

                var commodity=result.map.commodity[0];
                //p标签用text，input用val
                $("#commodity_name").val(commodity.name);                          //设置商品名字
                $("#commodity_subtitle").val(commodity.subtitle);                  //显示商品参数
                $("#commodity_price").val(commodity.price);                        //显示商品价格
                $("#commodity_postage").val(commodity.postage);                    //显示商品运费
                $("#commodity_information").val(commodity.information);            //显示商品信息
                $("#commodity_describe2").text(commodity.describe2);               //显示商品详细信息
                $("#commodity_stock").text(commodity.stock);                       //显示商品库存
                $("#catid").val(commodity.cats.catid);                             //显示分类信息

                if (commodity.status==1){                                          //判断商品状态 0 1 显示上架和下架
                    $("#commodity_status").text("上架中");
                } else{
                    $("#commodity_status").text("已下架");
                }

            }
        });
    }
    <%-------------------------------------------- 点击更新按钮  -------------------------------------------------------%>
    $("#commodity_update_btn").click(function () {

        var pageNUM=document.getElementById('pageNUM').innerHTML;

        $.ajax({
            url:"/commodity/update?commodityid="+k,      //k是你点击的那个商品id，全局变量通过点击按钮的时候保存id
            type:"POST",
            data:$("#updatCommodityseModal form").serialize(),
            success:function () {
                $("#updatCommodityseModal").modal("hide"); //关闭模态框
                window.location.href="/commodity/findAll?pn="+pageNUM;//跳转到当前页码那一页
            },
            error:function(){
                alert("请求失败");
            }
        });
    });

    //-----------------------------------------------单个删除方法-----------------------------------------------------------------
    function delete_commodity(commodityid,name) {
        var pageNUM=document.getElementById('pageNUM').innerHTML;
        var total=document.getElementById('total').innerHTML;

        k2=commodityid;   //全局变量保存点击时的商品id
        var commodityname = name;   //获取被点击删除的商品名
        // 弹出是否确认删除对话框
        if(confirm("确认删除【"+commodityname+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"/commodity/deletecommodity/"+k2,
                type:"POST",
                success:function(result){
                    alert("删除成功！");
                    if ((total-1)%6==0) {
                        pageNUM=pageNUM-1;
                    }
                    window.location.href="/commodity/findAll?pn="+pageNUM;
                }
            });
        }



    };
    //-----------------------------------完成全选/全不选功能---------------------------------------------
    $("#check_all").click(function(){
        //attr获取checked是undefined;
        //我们这些dom原生的属性；attr获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    //-------------------------------如果单选5个，全选按钮应该也变成选中状态---------------------------------
    $(document).on("click",".check_item",function(){
        //判断当前选择中的元素是否5个
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });


    //-----------------------------------------批量删除--------------------------------------------------------
    $("#commodity_delete_all_btn").click(function(){

        var pageNUM=document.getElementById('pageNUM').innerHTML;
        var commodityNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"),function(){
            commodityNames += $(this).parents("tr").find("th:eq(2)").text()+",";
            //组装员工id字符串
             del_idstr += $(this).parents("tr").find("th:eq(1)").text()+"-";
        });

        commodityNames = commodityNames.substring(0, commodityNames.length-1);    //去除empNames多余的,
        del_idstr = del_idstr.substring(0, del_idstr.length-1);        //去除删除的id多余的-

        if(confirm("确认删除【"+commodityNames+"】吗？")){
            //发送ajax请求删除
            $.ajax({
                url:"/commodity/deletecommodity/"+del_idstr,
                type:"POST",
                success:function(result){
                    alert("删除成功");
                    window.location.href="/commodity/findAll?pn="+pageNUM;//跳转到当前页码那一页
                },
                error:function(){
                    alert("请求失败");
                }
            });
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
