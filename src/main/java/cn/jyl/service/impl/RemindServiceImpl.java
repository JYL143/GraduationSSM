package cn.jyl.service.impl;

import cn.jyl.dao.RemindDao;
import cn.jyl.daomain.Remind;
import cn.jyl.service.RemindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RemindServiceImpl implements RemindService {

    @Autowired
    private RemindDao remindDao;


    /**
     * 添加提醒记录
     * @param remind
     */
    @Override
    public void addRemind(Remind remind) {
        remindDao.addRemind(remind);
    }

    /**
     * 查询是否提醒过 主要查询是否提醒过和提醒是0还是1
     * @param orderid
     * @return
     */
    @Override
    public List<Remind> booleanOrderid(Integer orderid) {
        return remindDao.booleanOrderid(orderid);
    }

    /**
     * 修改时间和提醒消息 消息为空就只改时间
     * @param reminds1
     */
    @Override
    public void update(Remind reminds1) {
        remindDao.update(reminds1);
    }

    /**
     * 查询全部提醒(后台主页面等使用到)
     * @return
     */
    @Override
    public  List<Map<String,Object>> findAll() {
        return remindDao.findAll();
    }

    /**
     * 后台查询提醒以及订单 商品 用户 信息，多表查询
     * @return
     */
    @Override
    public List<Remind> findAllPlus(Integer remind) {
        return remindDao.findAllPlus(remind);
    }

    /**
     * 后台处理催单后，删除提醒记录
     * @param orderid
     */
    @Override
    public void delete(Integer orderid) {
        remindDao.delete(orderid);
    }

    /**
     * 查询提醒类别为0或者1的订单id，给订单页受理和发货的时候使用到，如果提醒表有这个订单就删除这个提醒
     * @param remind
     * @return
     */
    @Override
    public List<Integer> findAll2(Integer remind) {
        return remindDao.findAll2(remind);
    }
}
