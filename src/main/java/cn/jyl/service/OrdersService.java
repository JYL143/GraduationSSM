package cn.jyl.service;

import cn.jyl.daomain.OrderItem;
import cn.jyl.daomain.Orders;
import cn.jyl.daomain.Search;

import java.util.List;

public interface OrdersService {


    //订单列表主页
    List<Orders> findAll();

    //受理功能
    void orders_status_edit1(Integer orderid);

    //订单发货功能（改发货状态和发货时间）
    void orders_status_edit2(Orders orders);

    //订单收货功能（个人中心 我的订单用到）
    void orders_status_edit3(Orders orders);

    //使用ajax查询指定id到查看详情模态框上
    List<Orders> findAllbyorderid(Integer orderid);

    //搜索功能 五合一页面改造过
    List<Orders> search(Search search);

    //未处理订单列表
    List<Orders> orders_status0();

    //未发货订单列表
    List<Orders> orders_status1();

    //已发货订单列表
    List<Orders> orders_status2();

    //已收货订单列表
    List<Orders> orders_status3();

    //查询订单表当前id最大值，给给购物车创建订单表和详情表用
    int findMaxOrderId();

    //添加订单表(购物车类使用)
    void addOrders(Orders orders);

    //添加订单详情表(购物车类使用)
    void addOrderItem(OrderItem orderItem);

    //查询指定用户id的订单信息(个人中心我的订单用到)
    List<Orders> findAllByUserId(Integer userid);

    List<Orders> findAllByUserId0(Integer userid);

    List<Orders> findAllByUserId1(Integer userid);

    List<Orders> findAllByUserId2(Integer userid);

    List<Orders> findAllByUserId3(Integer userid);

    //查询订单总记录数
    Integer findCount();

    //未处理记录数
    Integer findCountBystatus0();

    //待发货记录数
    Integer findCountBystatus1();

    //成交金额
    Double findAllMoney();

    //电视销量
    Double findAllDs();

    //手机销量
    Double findAllSj();

    //家电销量
    Double findAllJd();
}
