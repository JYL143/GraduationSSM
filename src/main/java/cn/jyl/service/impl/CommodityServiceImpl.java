package cn.jyl.service.impl;

import cn.jyl.Util.FileInput;
import cn.jyl.dao.CommodityDao;
import cn.jyl.daomain.Commodity;
import cn.jyl.daomain.Search;
import cn.jyl.daomain.Search2;
import cn.jyl.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service("commodityService")
public class CommodityServiceImpl implements CommodityService {

    @Autowired
    private CommodityDao commodityDao;

    /**
     * 查询商品所有信息
     * 图片获取功能
     * @return
     */
    @Override
    public List<Commodity> findAll() {
        return commodityDao.findAll();
    }

    /**
     * 添加商品
     * 图片上传功能
     * @param commodity
     */
    @Override
    public void savacommodity( Commodity commodity) {

        commodityDao.savacommodity(commodity);
    }

    /**
     * 删除指定商品id的商品
     * @param commodityid
     */
    @Override
    public void delete(Integer commodityid) {
        commodityDao.delete(commodityid);
    }

    /**
     * 商品上架
     * @param commodityid
     */
    @Override
    public void commodity_status_edit1(Integer commodityid) {
        commodityDao.commodity_status_edit1(commodityid);
    }

    /**
     * 商品下架
     * @param commodityid
     */
    @Override
    public void commodity_status_edit0(Integer commodityid) {
        commodityDao.commodity_status_edit0(commodityid);
    }

    /**
     *查询指定id的商品名和库存 用来做添加库存
     * @param commodityid
     * @return
     */
    @Override
    public List<Commodity> findbycommodityid(Integer commodityid) {

        return  commodityDao.findbycommodityid(commodityid);
    }

    /**
     * 添加库存操作
     * @param commodity
     */
    @Override
    public void add_stock(Commodity commodity) {
        commodityDao.add_stock(commodity);
    }

    /**
     * 商品更新功能
     * @param commodity
     */
    @Override
    public void update(Commodity commodity)   {
        commodityDao.update(commodity);
    }

    /**
     * 包邮功能
     * @param commodityid
     */
    @Override
    public void commodity_status_postage0(Integer commodityid) {
        commodityDao.commodity_status_postage0(commodityid);
    }

    /**
     * 按商品id查询商品库存（给购物车添加功能使用，如果购物车当前数量等于库存就不能继续添加）
     * @param commodityid
     * @return
     */
    @Override
    public int findStockById(Integer commodityid) {
        return commodityDao.findStockById(commodityid);
    }

    /**
     * 减少库存，给购物车控制类 支付成功后减少购物车对应的数量
     * @param commodity
     */
    @Override
    public void reduce_stock(Commodity commodity) {
        commodityDao.reduce_stock(commodity);
    }

    /**
     * 按指定id查询商品信息（给前台显示商品详情页用）
     * @param commodityid
     * @return
     */
    @Override
    public List<Commodity> findByIdAll(Integer commodityid) {
        return commodityDao.findByIdAll(commodityid);
    }

    /**
     * 前台搜索功能，搜索商品名字
     * @param name
     * @return
     */
    @Override
    public List<Integer> searchCommodityname(String name) {
        return commodityDao.searchCommodityname(name);
    }

    /**
     *  查询指定分类的商品所有信息
     * @return
     */
    @Override
    public List<Commodity> findAllByCat(Integer catid) {
        return commodityDao.findAllByCat(catid);
    }

    /**
     * 商品状态页根据 商品状态或者库存数量范围 查询全部
     * @param search
     * @return
     */
    @Override
    public List<Commodity> findAllByStatus(Search2 search) {
        return commodityDao.findAllByStatus(search);
    }
}
