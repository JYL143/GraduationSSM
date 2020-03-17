package cn.jyl.service.impl;

import cn.jyl.dao.CartDao;
import cn.jyl.daomain.Cart;
import cn.jyl.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDao;

    /**
     * 查询登录用户所有的购物车信息
     * @param username
     * @return
     */
    @Override
    public List<Cart> findAll(String username) {
        return cartDao.findAll(username);
    }

    /**
     * 删除购物车（支付成功和移除商品用）
     * @param cartid
     */
    @Override
    public void delete(Integer cartid) {
        cartDao.delete(cartid);
    }

    /**
     * 购物车商品添加数量(等于库存不添加)
     * @param cartid
     */
    @Override
    public void addQuantity(Integer cartid) {
        cartDao.addQuantity(cartid);
    }

    /**
     * 购物车商品减少数量（等于1不减少）
     * @param cartid
     */
    @Override
    public void reduceQuantity(Integer cartid) {
        cartDao.reduceQuantity(cartid);
    }

    /**
     * 按id查询商品数量(用于减少数量操作，为1不减少)
     * @param cartid
     * @return
     */
    @Override
    public int findQuantityById(Integer cartid) {
        return cartDao.findQuantityById(cartid);
    }

    /**
     * 按id查询所有的购物车信息
     * @param cartid
     * @return
     */
    @Override
    public List<Cart> findAllById(Integer cartid) {
        return cartDao.findAllById(cartid);
    }

    /**
     * 添加购物车
     * @param cart
     */
    @Override
    public void addCarts(Cart cart) {
        cartDao.addCarts(cart);
    }



    /**
     * 根据用户名查询用户id
     * @param username
     * @return
     */
    @Override
    public Integer findIdByName(String username) {
        return cartDao.findIdByName(username);
    }

    /**
     * 根据用户id和商品id查询 购物车中已有这个商品的购物车id
     * @param cart1
     * @return
     */
    @Override
    public  int findCartidByUserIdAndCommodityId(Cart cart1) {
        return cartDao.findCartidByUserIdAndCommodityId(cart1);
    }

    /**
     * 根据用户id查询购物车商品数量种类的数量
     * @param userid
     * @return
     */
    @Override
    public Integer findCartNum(Integer userid) {
        return cartDao.findCartNum(userid);
    }


}
