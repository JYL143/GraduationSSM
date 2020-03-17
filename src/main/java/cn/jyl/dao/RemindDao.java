package cn.jyl.dao;

import cn.jyl.daomain.Remind;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public interface RemindDao {


    /**
     * 添加提醒记录
     * @param remind
     */
    void addRemind(Remind remind);

    /**
     * 查询是否提醒过 主要查询是否提醒过和提醒是0还是1
     * @param orderid
     * @return
     */
    List<Remind> booleanOrderid(Integer orderid);

    /**
     * 修改时间和提醒消息 消息为空就只改时间
     * @param reminds1
     */
    void update(Remind reminds1);

    /**
     * 查询全部提醒(后台主页面等使用到)
     * @return
     */
    List<Map<String,Object>> findAll();

    /**
     * 后台查询提醒以及订单 商品 用户 信息，多表查询
     * @return
     */
    List<Remind> findAllPlus(Integer remind);

    /**
     * 后台处理催单后，删除提醒记录
     * @param orderid
     */
    void delete(Integer orderid);

    /**
     * 查询提醒类别为0或者1的订单id，给订单页受理和发货的时候使用到，如果提醒表有这个订单就删除这个提醒
     * @param remind
     * @return
     */
    List<Integer> findAll2(Integer remind);
}
