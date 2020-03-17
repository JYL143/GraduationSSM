package cn.jyl.service.impl;

import cn.jyl.dao.OrdersDao;
import cn.jyl.daomain.OrderItem;
import cn.jyl.daomain.Orders;
import cn.jyl.daomain.Search;
import cn.jyl.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersDao ordersDao;


    /**
     * 订单列表功能（五合一查询页面）
     * @return
     */
    @Override
    public List<Orders> findAll() {
        return ordersDao.findAll();
    }

    /**
     * 受理功能
     * @param orderid
     */
    @Override
    public void orders_status_edit1(Integer orderid) {
        ordersDao.orders_status_edit1(orderid);
    }

    /**
     * 订单发货功能（改发货状态和发货时间）
     * @param orders
     */
    @Override
    public void orders_status_edit2(Orders orders) {
        ordersDao.orders_status_edit2(orders);
    }

    /**
     * 订单收货功能（个人中心 我的订单用到）
     * @param orders
     */
    @Override
    public void orders_status_edit3(Orders orders) {
        ordersDao.orders_status_edit3(orders);
    }

    /**
     * 使用ajax查询指定id到查看详情模态框上
     * @param orderid
     * @return
     */
    @Override
    public List<Orders> findAllbyorderid(Integer orderid) {
        return ordersDao.findAllbyorderid(orderid);
    }

    /**
     * 搜索功能 五合一页面改造过
     * @param search
     * @return
     */
    @Override
    public List<Orders> search(Search search) {
        return ordersDao.search(search);
    }

    /**
     * 未处理订单列表
     * @return
     */
    @Override
    public List<Orders> orders_status0() {
        return ordersDao.orders_status0();
    }

    /**
     * 未发货订单列表
     * @return
     */
    @Override
    public List<Orders> orders_status1() {
        return ordersDao.orders_status1();
    }

    /**
     * 已收货订单列表
     * @return
     */
    @Override
    public List<Orders> orders_status2() {
        return ordersDao.orders_status2();
    }

    /**
     * 未处理订单列表
     * @return
     */
    @Override
    public List<Orders> orders_status3() {
        return ordersDao.orders_status3();
    }

    /**
     * 查询订单表当前id最大值，给给购物车创建订单表和详情表用
     * @return
     */
    @Override
    public int findMaxOrderId() {
        return ordersDao.findMaxOrderId();
    }

    /**
     * 添加订单表(购物车类使用)
     * @param orders
     */
    @Override
    public void addOrders(Orders orders) {
        ordersDao.addOrders(orders);
    }

    /**
     * 添加订单详情表(购物车类使用)
     * @param orderItem
     */
    @Override
    public void addOrderItem(OrderItem orderItem) {
        ordersDao.addOrderItem(orderItem);
    }

    /**
     * 查询指定用户id的订单信息(个人中心我的订单用到)
     * @param userid
     * @return
     */
    @Override
    public List<Orders> findAllByUserId(Integer userid) {
        return ordersDao.findAllByUserId(userid);
    }

    @Override
    public List<Orders> findAllByUserId0(Integer userid) {
        return ordersDao.findAllByUserId0(userid);
    }

    @Override
    public List<Orders> findAllByUserId1(Integer userid) {
        return ordersDao.findAllByUserId1(userid);
    }

    @Override
    public List<Orders> findAllByUserId2(Integer userid) {
        return ordersDao.findAllByUserId2(userid);
    }

    @Override
    public List<Orders> findAllByUserId3(Integer userid) {
        return ordersDao.findAllByUserId3(userid);
    }

    /**
     * 查询订单总记录数
     * @return
     */
    @Override
    public Integer findCount() {
        return ordersDao.findCount();
    }

    /**
     * 未处理记录数
     * @return
     */
    @Override
    public Integer findCountBystatus0() {
        return ordersDao.findCountBystatus0();
    }

    /**
     * 待发货记录数
     * @return
     */
    @Override
    public Integer findCountBystatus1() {
        return ordersDao.findCountBystatus1();
    }

    /**
     * 成交金额
     * @return
     */
    @Override
    public Double findAllMoney() {
        return ordersDao.findAllMoney();
    }

    //电视销量
    @Override
    public Double findAllDs() {
        return ordersDao.findAllDs();
    }

    //手机销量
    @Override
    public Double findAllSj() {
        return ordersDao.findAllSj();
    }

    //家电销量
    @Override
    public Double findAllJd() {
        return ordersDao.findAllJd();
    }


}
