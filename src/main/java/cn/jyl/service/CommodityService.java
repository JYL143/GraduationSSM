package cn.jyl.service;

import cn.jyl.daomain.Commodity;
import cn.jyl.daomain.Search;
import cn.jyl.daomain.Search2;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface CommodityService {

    //查询商品所有信息(显示图片功能)
    public List<Commodity> findAll();


    //添加商品(图片上传功能)
    void savacommodity( Commodity commodity) ;

    //删除指定商品id的商品
    void delete(Integer commodityid);

    //商品上架
    void commodity_status_edit1(Integer commodityid);

    //商品下架
    void commodity_status_edit0(Integer commodityid);

    //查询指定id的商品名和库存 用来做添加库存
    List<Commodity> findbycommodityid(Integer commodityid);



    //添加库存操作
    void add_stock(Commodity commodity);

    //更新商品操作
    void update(Commodity commodity) ;

    //包邮功能
    void commodity_status_postage0(Integer commodityid);

    //按商品id查询商品库存（给购物车添加功能使用，如果购物车当前数量等于库存就不能继续添加）
    int findStockById(Integer commodityid);

    //减少库存，给购物车控制类 支付成功后减少购物车对应的数量
    void reduce_stock(Commodity commodity);

    //按指定id查询商品信息（给前台显示商品详情页用）
    List<Commodity> findByIdAll(Integer commodityid);

    //前台搜索功能，搜索商品名字
    List<Integer> searchCommodityname(String name);

    // 查询指定分类的商品所有信息
    List<Commodity> findAllByCat(Integer catid);

    //商品状态页根据 商品状态或者库存数量范围 查询全部
    List<Commodity> findAllByStatus(Search2 search);
}
