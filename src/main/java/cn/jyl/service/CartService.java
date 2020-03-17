package cn.jyl.service;

import cn.jyl.daomain.Cart;

import java.util.List;

public interface CartService  {

    //查询登录用户所有的购物车信息
    List<Cart> findAll(String username);

    //删除购物车（支付成功和移除商品用）
    void delete(Integer cartid);


    //购物车商品添加数量(等于库存不添加)
    void addQuantity(Integer cartid);

    //购物车商品减少数量（等于1不减少）
    void reduceQuantity(Integer cartid);

    //按id查询商品数量(用于减少数量操作，为1不减少)
    int findQuantityById(Integer cartid);

    //按id查询所有的购物车信息
    List<Cart> findAllById(Integer cartid);

    //添加购物车
    void addCarts(Cart cart);


    //根据用户名查询用户id
    Integer findIdByName(String username);

    //根据用户id和商品id查询 购物车中已有这个商品的购物车id
    int findCartidByUserIdAndCommodityId(Cart cart1);

    //根据用户id查询购物车商品数量种类的数量
    Integer findCartNum(Integer userid);
}
