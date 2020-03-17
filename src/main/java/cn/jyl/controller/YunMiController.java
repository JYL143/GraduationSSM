package cn.jyl.controller;


import cn.jyl.Util.Msg;
import cn.jyl.daomain.Commodity;
import cn.jyl.daomain.Like;
import cn.jyl.daomain.Orders;
import cn.jyl.daomain.User;
import cn.jyl.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.net.URLDecoder;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/yunmi")
@Controller
public class YunMiController {

    @Autowired
    private YunMiService yunMiService;

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private CartService cartService;

    @Autowired
    private LikeService likeService;

    /**
     * 查询数据到主页，跳转到前台主页
     * 购物车支付成功页面跳转过来使用到，不然没数据了
     * 非登录页到主页用的方法
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model){

        for (int i=1;i<=40;i=i+2){
            List<Commodity> list= yunMiService.getCommodity(i);

            model.addAttribute("list"+i,list);
        }

        return "/qd/index";
    }

    /**
     * 退出登录（通用）
     * @param session
     * @return
     */
    @RequestMapping("/signOut")
    public String signOut(HttpSession session){
        session.setAttribute("yunUser2",""); //清空用户登录session

        return "redirect:/yunmi/index";
    }

    /**
     * 商品详情页
     * 判断该商品是否被收藏
     * @return
     */
    @RequestMapping("/commodity")
    public String commodity(Integer commodityid,HttpSession session,Model model){

        int likestock=0;//0表示未收藏该商品，1表示已经收藏
        List<Commodity> commodities=commodityService.findByIdAll(commodityid);
        model.addAttribute("commodities",commodities);
        String username= (String) session.getAttribute("yunUser2");

        Integer userid=userService.findUserIdByName(username);//查询指定用户名的用户id
        Integer cartnum=cartService.findCartNum(userid);        //根据用户id查询购物车商品数量种类的数量
        model.addAttribute("cartnum",cartnum);

        if (username!=null && !username.equals("")){//如果已经登录就查询收货地址
            //查询指定用户名的收货地址
            List<User> users=userService.findAllByName(username);

            String useraddress=users.get(0).getUseraddress();
            session.setAttribute("useraddress",useraddress);
            session.setAttribute("usernameStatus",1);

            //判断该商品是不是被收藏了，如果被收藏了按钮那边就显示取消收藏

            List<Like> likes=likeService.findAllByUserName(username);
            if (likes.size()!=0){
                for (int i=0;i<likes.size();i++){
                    if (likes.get(i).getCommodityid().equals(commodityid)){//表示该商品已收藏，还有id超过127不能用=
                         likestock=1;
                         break;
                    }
                }
            }


        }else{
            session.setAttribute("commodityid",commodityid); //未登录就保存当前商品id，以便二次登录返回到这个页面是二次查询用
            String useraddress="你还未登录，请先登录！";
            session.setAttribute("useraddress",useraddress);
            session.setAttribute("usernameStatus",0); //0表示未登录，给商品详情页收货地址用
        }


        model.addAttribute("likestock",likestock); //保存是否被收藏
        return "qd/commodity";
    }

    /**
     * 商品详情页登录
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String cart(HttpSession session,Model model){
        String msg="你还未登录，请先登录！";
        model.addAttribute("msg",msg);
        session.setAttribute("loginStatus",2);//0表示默认登录，1表示购物车登录，2表示商品详情页,3表示个人中心页
        return "qd/yunlogin";

    }

    /**
     * 个人中心页
     * @return
     */
    @RequestMapping("/userinfo")
    public String userinfo(HttpSession session,Model model) {
        String username= (String) session.getAttribute("yunUser2");
        if (username!=null && !username.equals("")){
            List<User> users=userService.findAllByName(username);
            model.addAttribute("userinfo",users);

            //保存的密码拆分list集合对应位数数组，给个人中心页输出密码与*功能
            List<String> pswk=new ArrayList<String>();
            for (int i=0;i<users.get(0).getPassword().length();i++){
                String pswi=users.get(0).getPassword().substring(i,i+1); //将当期位数的数字存到list集合的对应位（0开始存储）
                pswk.add(pswi);
            }
            model.addAttribute("pswk",pswk);

            if (users.get(0).getCardid()!=null) {
                //保存身份证号，做33******13格式输出
                List<String> cardid = new ArrayList<String>();
                for (int i = 0; i < users.get(0).getCardid().length(); i++) {
                    String cardidi = users.get(0).getCardid().substring(i, i + 1);
                    cardid.add(cardidi);
                }
                model.addAttribute("cardid", cardid);
            }

            //右上角购物车数量显示
            Integer userid=userService.findUserIdByName(username); //根据用户名查询用户id
            Integer cartnum=cartService.findCartNum(userid);        //根据用户id查询购物车商品数量种类的数量
            model.addAttribute("cartnum",cartnum);

            return "qd/userinfo";
        }else{//未登录用户
            String msg="你还未登录，请先登录！";
            model.addAttribute("msg",msg);
            session.setAttribute("loginStatus",3); //0表示默认登录，1表示购物车登录，2表示商品详情页,3表示个人中心页
            return "qd/yunlogin";
        }
    }
    /**
     * 个人中心换绑手机号页
     * @return
     */
    @RequestMapping("/userinfoPhone")
    public String userinfoPhone(@RequestParam String phone,HttpSession session){
        //这里获取手机号 然后保存到session，这样下面那个方法就不用查询手机号了
        session.setAttribute("phone",phone);

        return "qd/userinfoPhone";
    }


    /**
     * 查询原手机号
     * 个人中心换绑手机号
     * @return
     */
    @ResponseBody
    @RequestMapping("/findPhone")
    public String findPhone(HttpSession session){

        //使用上面保存的手机号，这样不用
        return (String) session.getAttribute("phone");
    }

    /**
     * 手机号修改
     * 个人中心换绑手机号
     * @return
     */

    @RequestMapping("/updatephone")
    public String updatephone(@RequestParam String phone,HttpSession session){

        String username= (String) session.getAttribute("yunUser2");
        Integer userid=userService.findUserIdByName(username);
        User user=new User();
        user.setUserid(userid);
        user.setPhone(phone);
        userService.update(user);

        return "cs";
    }

    /**
     * 个人中心 收货地址
     * @return
     */
    @RequestMapping("/useradress")
    public String useradress(HttpSession session,Model model) {

        String username= (String) session.getAttribute("yunUser2");
        List<User> useradress=userService.findAllByName(username);
        model.addAttribute("useradress",useradress);

        //右上角购物车数量显示
        Integer userid=userService.findUserIdByName(username); //根据用户名查询用户id
        Integer cartnum=cartService.findCartNum(userid);        //根据用户id查询购物车商品数量种类的数量
        model.addAttribute("cartnum",cartnum);

        return "qd/useradress";
    }

    /**
     * 按用户姓名修改用户地址和性别,邮政编码，
     * 空就不修改
     * @return
     */
    @ResponseBody
    @RequestMapping("/update_AdressAndSex")
    public String update_AdressAndSex(User user,HttpSession session) {

        String username= (String) session.getAttribute("yunUser2");
        user.setUsername(username);
        userService.update_AdressAndSex(user);

        return null;
    }




    /**
     * 根据用户id查询全部订单，分页查询
     * 五合一查询方法
     * @param pn
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/order/{orderstatus}")
    public String order(@PathVariable(name = "orderstatus") Integer orderstatus, @RequestParam(value = "pn",defaultValue = "1")Integer pn, HttpSession session, Model model) {

        String username= (String) session.getAttribute("yunUser2");
        Integer userid=userService.findUserIdByName(username);//查询指定用户名的用户id

        Integer cartnum=cartService.findCartNum(userid);        //根据用户id查询购物车商品种类的数量
        model.addAttribute("cartnum",cartnum);

        PageHelper.startPage(pn,3);             //一页几条数据

            switch (orderstatus){
                case 0:
                    List<Orders> orders0=ordersService.findAllByUserId0(userid);//查询该id用户全部订单信息
                    if (orders0.size()==0){ //如果没有数据就跳转到没数据页，根据传递的值来显示order99页面哪个标题是黑色的
                        model.addAttribute("status99",0);
                        return "qd/order99";
                    }else{
                        PageInfo page0=new PageInfo(orders0,4); //分页条显示几个页
                        model.addAttribute("pageinfo",page0);
                        return "qd/order0";
                    }
                case 1:
                    List<Orders> orders1=ordersService.findAllByUserId1(userid);//查询该id用户全部订单信息
                    if (orders1.size()==0){ //如果没有数据就跳转到没数据页，根据传递的值来显示order99页面哪个标题是黑色的
                        model.addAttribute("status99",1);
                        return "qd/order99";
                    }else{
                        PageInfo page1=new PageInfo(orders1,4); //分页条显示几个页
                        model.addAttribute("pageinfo",page1);
                        return "qd/order1";
                    }
                case 2:
                    List<Orders> orders2=ordersService.findAllByUserId2(userid);//查询该id用户全部订单信息
                     if (orders2.size()==0){ //如果没有数据就跳转到没数据页，根据传递的值来显示order99页面哪个标题是黑色的
                         model.addAttribute("status99",2);
                         return "qd/order99";
                     }else{
                         PageInfo page2=new PageInfo(orders2,4); //分页条显示几个
                         model.addAttribute("pageinfo",page2);
                         return "qd/order2";
                     }
                case 3:
                    List<Orders> orders3=ordersService.findAllByUserId3(userid);//查询该id用户全部订单信息
                    if (orders3.size()==0){ //如果没有数据就跳转到没数据页，根据传递的值来显示order99页面哪个标题是黑色的
                        model.addAttribute("status99",3);
                        return "qd/order99";
                    }else{
                        PageInfo page3=new PageInfo(orders3,4); //分页条显示几个页
                        model.addAttribute("pageinfo",page3);
                        return "qd/order3";
                    }
                default:
                    List<Orders> orders=ordersService.findAllByUserId(userid);//查询该id用户全部订单信息

                    if (orders.size()==0){ //如果没有数据就跳转到没数据页，根据传递的值来显示order99页面哪个标题是黑色的
                        model.addAttribute("status99",5);
                        return "qd/order99";
                    }else{
                        PageInfo page=new PageInfo(orders,4); //分页条显示几个页
                        model.addAttribute("pageinfo",page);
                        return "qd/order";
                    }
            }
    }

    /**
     *  确认收货功能（个人中心）
     * 将收货时间定为当前时间
     * @param orderid
     * @return
     */
    @ResponseBody
    @RequestMapping("/orders_status_edit3")
    public String orders_status_edit3(@RequestParam Integer orderid){

        Orders orders=new Orders();
        orders.setOrderid(orderid);
        orders.setClosetime(new Date());  //获取当前时间当收货时间

        ordersService.orders_status_edit3(orders);

        return "cs";
    }

    /**
     * 前台搜索上架商品功能
     * 解码ajax发送的中文参数
     * @param name
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/searchCommodityname")
    public  Msg searchCommodityname(String name, HttpServletRequest request, HttpServletResponse response)throws Exception {

        String commoditylike="";
        commoditylike =URLDecoder.decode(name,"utf-8");//解码ajax发送的中文参数

        if (commoditylike!=null && !commoditylike.equals("")){//不为空才查询

            List<Integer> commodityIds=commodityService.searchCommodityname(commoditylike);

            if (commodityIds.size()==0){ //查询不到数据
                return Msg.fail();

            }else if (commodityIds.size()==1){ //只有一个数据就直接重定向到该商品的详情页
                return  Msg.success300().add("commodityIds",commodityIds);

            }else{//有多个数据就传递商品id数组
                return Msg.success().add("commodityIds",commodityIds);
            }
        }else{
            return Msg.fail();
        }


    }

    /**
     * 读取上架的商品信息到搜索与分类页
     * 循环查询搜索传过来的id数组，然后循环往list集合放对象
     * @param ids
     * @return
     */
    @RequestMapping("/commodityByCat")
    public String commodityByCat(String ids,Model model){
        int commoditynum=0;//保存商品数量
        List<Commodity> listC = new ArrayList<Commodity>();

        String [] str_ids=ids.split(",");//用这个方法然后判断-来分割
        for (String id:str_ids){
            Integer commodityid=Integer.parseInt(id);
            List<Commodity> list= commodityService.findByIdAll(commodityid);//循环查询搜索得到的商品id，放到list集合里
            listC.add( list.get(0));                                        //循环往list放c查询到的ommodity对象
            commoditynum++;//商品数量
        }
        model.addAttribute("listC",listC);
        model.addAttribute("commoditynum",commoditynum);


        return "qd/commodityByCat";
    }
}
