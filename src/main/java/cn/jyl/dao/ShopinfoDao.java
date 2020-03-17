package cn.jyl.dao;

import cn.jyl.daomain.Shopinfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShopinfoDao {

    /**
     * 查询店铺基本信息
     * @return
     */
    Shopinfo findshopinfo();

    /**
     * 修改店铺信息
     * @param shopinfo
     */
    void update(Shopinfo shopinfo);
}
