package cn.jyl.controller;

import cn.jyl.Util.Msg;

import cn.jyl.daomain.Cart;
import cn.jyl.daomain.Commodity;
import cn.jyl.daomain.OrderItem;
import cn.jyl.daomain.Orders;
import cn.jyl.service.CartService;
import cn.jyl.service.CommodityService;
import cn.jyl.service.OrdersService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@RequestMapping("/cart")
@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private OrdersService ordersService;

    /**
     * 跳转到购物车页面(未登录用户跳转到login)
     * 查询登录用户所有的购物车信息
     * @return
     */
    @RequestMapping("/carts")
    public String cart(HttpSession session,Model model){

        String username= (String) session.getAttribute("yunUser2");
        if (username!=null &&! username.equals("")){
        List<Cart> carts=cartService.findAll(username);
        model.addAttribute("carts",carts);

            return "qd/cart";
        }else{
            String msg="你还未登录，请先登录！";
            model.addAttribute("msg",msg);
            session.setAttribute("loginStatus",1);  //如果通过购物车到登录，下次登录直接跳转到购物车
            return "qd/yunlogin";
        }
    }

    /**
     * 删除购物车 移除商品
     * @return
     */
    @RequestMapping("/delete/{cartid}")
    public String delete(@PathVariable(value="cartid") Integer cartid){  //value和url/一样， Integer后面随便命名

        cartService.delete(cartid);
//         System.out.println(cartid);
        return "redirect:/cart/carts";  //重定向到请求
    }

    /**
     * 购物车商品添加数量(等于库存不添加)
     * 只操作数据库不返回页面或者刷新，用ajax可以配合responsebody可以解决
     * @return
     */
    @ResponseBody
    @RequestMapping("/addQuantity/{cartid}&{commodityid}")
    public String addQuantity(@PathVariable(value="cartid") Integer cartid,@PathVariable(value="commodityid") Integer commodityid){

        int stock=commodityService.findStockById(commodityid);   //按商品id查询商品库存(等于库存不添加)
        int quantity=cartService.findQuantityById(cartid);       //按id查询商品数量

        if (quantity<stock){ //当前购物车数量小于商品库存才添加
            cartService.addQuantity(cartid);
        }
        return "cs";
    }

    /**
     * 购物车商品减少数量（等于1不减少）
     * @return
     */
    @ResponseBody
    @RequestMapping("/reduceQuantity/{cartid}")
    public String reduceQuantity(@PathVariable(value="cartid") Integer cartid){

       int quantity=cartService.findQuantityById(cartid); //按id查询商品数量(用于减少数量操作，为1不减少)
       if (quantity>1){
           cartService.reduceQuantity(cartid);
       }
        return "cs";
    }



    /**
     * 支付成功跳转页面(获取购物车id，)
     * 进行生成订单表，订单详情表，删除购物车，减少库存操作
     * @return
     */
    @RequestMapping("/success")
    public String zf(HttpSession session){

        String cartids = (String) session.getAttribute("cartids"); //获取支付成功后的购物车id 格式为x-x-x-
        String [] str_cartids=cartids.split("-");//用这个方法然后判断-来分割

        for (String cartid2:str_cartids){
            int i=0;//获取list里的对象用
            Integer cartid=Integer.parseInt(cartid2);           //将string转成int类型

            //循环查询购物车订单信息
            List<Cart> carts=cartService.findAllById(cartid);                       //按id查询所有的购物车信息
            int quantity=carts.get(i).getQuantity();                                //购物车第i个商品数量(减少库存,添加订单表，添加订单详情表)
            int commodityid=carts.get(i).getCommoditys().get(0).getCommodityid();   //商品id(减少库存，添加订单详情表)
            double price=carts.get(i).getCommoditys().get(0).getPrice();            //商品单价(添加订单,添加订单详情表)
            int postage=carts.get(i).getCommoditys().get(0).getPostage();           //运费(添加订单)
            int userid=carts.get(i).getUserid();                                    //用户id(添加订单)
            String name=carts.get(i).getCommoditys().get(0).getName();              //商品名字(添加订单详情表)
            String images=carts.get(i).getCommoditys().get(0).getImages();          //商品图片(添加订单详情表)



            //减少库存
            Commodity commodity=new Commodity();
            commodity.setStock(quantity);
            commodity.setCommodityid(commodityid);
            commodityService.reduce_stock(commodity);     //直接使用service方法，commodity类没这个方法

            //如果库存为0，商品下架
            Integer stock=commodityService.findStockById(commodityid);
            if (stock==0){
                commodityService.commodity_status_edit0(commodityid);
            }


            //生成订单表(一个商品一个订单表)
            int orderid=ordersService.findMaxOrderId()+1;                       //查询订单表当前id最大值(给给购物车创建订单表和详情表用)
            double money=price * quantity+postage;                              //实际付款=商品单价*数量+运费

            Orders orders=new Orders();
            orders.setOrderid(orderid);
            orders.setMoney(money);
            orders.setPostage(postage);
            orders.setOrdertime(new Date());


            orders.setUserid(userid);
            orders.setOrderitemid(orderid);
            ordersService.addOrders(orders);

            //生成订单详情表
            OrderItem orderItem=new OrderItem();
            orderItem.setOrderitemid(orderid);
            orderItem.setName(name);
            orderItem.setImages(images);
            orderItem.setPrice(price);
            orderItem.setQuantity(quantity);
            orderItem.setOrderid(orderid);
            orderItem.setCommodityid(commodityid);
            ordersService.addOrderItem(orderItem);

            //删除购物车
            cartService.delete(cartid);

            i++; //循环操作购物车选中商品
        }
        return "qd/success";
    }


    /**
     * 根据id添加购物车(商品详情页添加购物车)
     * 根据用户名查询用户id
     * @param commodityid
     * @return
     */
    @ResponseBody
    @RequestMapping("/addcart")
    public Msg addcart(@RequestParam("commodityid") Integer commodityid, HttpSession session){

            int commodityStock=0;//1 表示添加商品在购物车已经有了  0表示没有

             String username= (String) session.getAttribute("yunUser2");
              //如果用户已登录就添加购物车，否则返回到登录页
             if (username!=null && ! username.equals("")){

                 //先查询这个用户购物车所有商品，如果要添加商品用户购物车已经有了就在原数量加1
                 List<Cart> carts=cartService.findAll(username);

                for (int i=0;i<carts.size();i++){
                        commodityStock=0;//先请0

                   if (carts.get(i).getCommodityid().equals(commodityid)){  //如果id超过127，就不能用== 会不相等，因为会new 一个int对象
                        commodityStock=1;
                         break;
                   }
                }

               Integer userid=cartService.findIdByName(username); //根据用户名字查询用户id
                if (commodityStock==1){

                   Cart cart1=new Cart();
                   cart1.setUserid(userid);
                   cart1.setCommodityid(commodityid);
                   int cartid= cartService.findCartidByUserIdAndCommodityId(cart1);  //根据用户id和商品id查询 购物车中已有这个商品的购物车id
                    cartService.addQuantity(cartid);//添加指定购物车id的商品数量



                }else {
               Cart cart=new Cart();
               cart.setUserid(userid);
               cart.setCommodityid(commodityid);
               cartService.addCarts(cart);          //添加购物车

                }
                 return  Msg.success(); //登录用户，前台收到100跳转到购物车
             }else{
                return  Msg.fail(); //未登录用户，前台收到200跳转到登录页
             }
    }


    /**
     * 支付失败跳转页面
     * @return
     */
    @RequestMapping("/error")
    public String error(){
        return "qd/error";
    }

    @ResponseBody
    @RequestMapping(value = "/cs2",produces = {"application/json;charset=UTF-8"})
    public String cs2( String useraddress) {
        System.out.println(useraddress);


        return "cs";
    }

}
