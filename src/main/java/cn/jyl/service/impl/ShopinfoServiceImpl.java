package cn.jyl.service.impl;

import cn.jyl.dao.ShopinfoDao;
import cn.jyl.daomain.Shopinfo;
import cn.jyl.service.ShopinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ShopinfoServiceImpl implements ShopinfoService {

    @Autowired
    private ShopinfoDao shopinfoDao;

    /**
     *  查询店铺基本信息
     * @return
     */
    @Override
    public Shopinfo findshopinfo() {
        return shopinfoDao.findshopinfo();
    }

    /**
     * 修改店铺信息
     * @param shopinfo
     */
    @Override
    public void update(Shopinfo shopinfo){
        shopinfoDao.update(shopinfo);
    }
}
