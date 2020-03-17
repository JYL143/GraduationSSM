package cn.jyl.dao;

import cn.jyl.daomain.Commodity;
import cn.jyl.daomain.Search;
import cn.jyl.daomain.Search2;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommodityDao {
    /**
     * 查询商品所有信息
     * 查询图片功能
     * @return
     */
    List<Commodity> findAll();

    /***
     * 添加商品
     * 上传图片功能
     * @param commodity
     */
    public void savacommodity(Commodity commodity);

    /**
     * 删除指定商品id的商品
     * @param commodityid
     */
    void delete(Integer commodityid);

    /**
     * 商品上架
     * @param commodityid
     */
    void commodity_status_edit1(Integer commodityid);

    /**
     * 商品下架
     * @param commodityid
     */
    void commodity_status_edit0(Integer commodityid);

    /**
     *查询指定id的商品名和库存 用来做添加库存
     * @param commodityid
     * @return
     */
    List<Commodity> findbycommodityid(Integer commodityid);



    /**
     * 添加库存操作
     * @param commodity
     */
    void add_stock(Commodity commodity);

    /**
     * 更新操作
     * @param commodity
     */
    void update(Commodity commodity);

    /**
     * 包邮功能
     * @param commodityid
     */
    void commodity_status_postage0(Integer commodityid);

    /**
     * 按商品id查询商品库存（给购物车添加功能使用，如果购物车当前数量等于库存就不能继续添加）
     * @param commodityid
     * @return
     */
    int findStockById(Integer commodityid);

    /**
     * 减少库存，给购物车控制类 支付成功后减少购物车对应的数量
     * @param commodity
     */
    void reduce_stock(Commodity commodity);

    /**
     * 按指定id查询商品信息（给前台显示商品详情页用）
     * @param commodityid
     * @return
     */
    List<Commodity> findByIdAll(Integer commodityid);

    /**
     * 前台搜索功能，搜索商品名字
     * @param name
     * @return
     */
    List<Integer> searchCommodityname(String name);

    /***
     * 查询指定分类的商品所有信息
     * @param catid
     * @return
     */
    List<Commodity> findAllByCat(Integer catid);

    /**
     * 商品状态页根据 商品状态或者库存数量范围 查询全部
     * @param search
     * @return
     */
    List<Commodity> findAllByStatus(Search2 search);
}
