package cn.jyl.dao;

import cn.jyl.daomain.OrderItem;
import cn.jyl.daomain.Orders;
import cn.jyl.daomain.Search;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersDao {

    /**
     * 订单列表功能（五合一查询页面）
     * @return
     */
    List<Orders> findAll();

    /**
     * 受理功能
     * @param orderid
     */
    void orders_status_edit1(Integer orderid);

    /**
     * 订单发货功能（改发货状态和发货时间）
     * @param orders
     */
    void orders_status_edit2(Orders orders);

    /**
     * 订单收货功能（个人中心 我的订单用到）
     * @param orders
     */
    void orders_status_edit3(Orders orders);

    /**
     * 使用ajax查询指定id到查看详情模态框上
     * @param orderid
     * @return
     */
    List<Orders> findAllbyorderid(Integer orderid);

    /**
     * 搜索功能
     * @param search
     * @return
     */
    List<Orders> search(Search search);

    /**
     * 未处理订单列表
     * @return
     */
    List<Orders> orders_status0();
    /**
     * 未发货订单列表
     * @return
     */
    List<Orders> orders_status1();
    /**
     * 已发货订单列表
     * @return
     */
    List<Orders> orders_status2();
    /**
     * 已收货订单列表
     * @return
     */
    List<Orders> orders_status3();

    /**
     * 查询订单表当前id最大值，给给购物车创建订单表和详情表用
     * @return
     */
    int findMaxOrderId();

    /**
     * 添加订单表(购物车类使用)
     * @param orders
     */
    void addOrders(Orders orders);

    /**
     * 添加订单详情表(购物车类使用)
     * @param orderItem
     */
    void addOrderItem(OrderItem orderItem);

    /**
     * 查询指定用户id的订单信息(个人中心我的订单用到)
     * @param userid
     * @return
     */
    List<Orders> findAllByUserId(Integer userid);

    List<Orders> findAllByUserId0(Integer userid);

    List<Orders> findAllByUserId1(Integer userid);

    List<Orders> findAllByUserId2(Integer userid);

    List<Orders> findAllByUserId3(Integer userid);

    /**
     * 查询订单总记录数
     * @return
     */
    Integer findCount();

    /**
     * 待发货记录数
     * @return
     */
    Integer findCountBystatus1();

    /**
     * 未处理记录数
     * @return
     */
    Integer findCountBystatus0();

    /**
     * 成交金额
     * @return
     */
    Double findAllMoney();

    /**
     * 电视销量
     * @return
     */
    Double findAllDs();

    /**
     * 手机销量
     * @return
     */
    Double findAllJd();

    /**
     * 家电销量
     * @return
     */
    Double findAllSj();
}
