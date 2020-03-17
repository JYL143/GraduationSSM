package cn.jyl.dao;

import cn.jyl.daomain.Cart;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartDao {


    /**
     * 查询登录用户所有的购物车信息
     * @param username
     * @return
     */
    List<Cart> findAll(String username);

    /**
     * 删除购物车（支付成功和移除商品用）
     * @param cartid
     */
    void delete(Integer cartid);

    /**
     * 购物车商品添加数量(等于库存不添加)
     * @param cartid
     */
    void addQuantity(Integer cartid);

    /**
     * 购物车商品减少数量（等于1不减少）
     * @param cartid
     */
    void reduceQuantity(Integer cartid);

    /**
     * 按id查询商品数量(用于减少数量操作，为1不减少)
     * @param cartid
     * @return
     */
    int findQuantityById(Integer cartid);

    /**
     * 按id查询所有的购物车信息
     * @param cartid
     * @return
     */
    List<Cart> findAllById(Integer cartid);

    /**
     *  根据id添加购物车
     * @param username
     */
    void addCartByUserName(String username);

    /**
     * 添加购物车
     * @param cart
     */
    void addCarts(Cart cart);


    /**
     * 根据用户名查询用户id
     * @param username
     * @return
     */
    Integer findIdByName(String username);

    /**
     * 根据用户id和商品id查询 购物车中已有这个商品的购物车id
     * @param cart1
     * @return
     */
    int findCartidByUserIdAndCommodityId(Cart cart1);

    /**
     * 根据用户id查询购物车商品数量种类的数量
     * @param userid
     * @return
     */
    Integer findCartNum(Integer userid);
}
