package cn.jyl.controller;

import cn.jyl.Util.Msg;
import cn.jyl.daomain.Cart;
import cn.jyl.daomain.Like;
import cn.jyl.daomain.Orders;
import cn.jyl.service.CartService;
import cn.jyl.service.LikeService;
import cn.jyl.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/like")
@Controller
public class LikeController {

    @Autowired
    private LikeService likeService;

    @Autowired
    private UserService userService;

    @Autowired
    private CartService cartService;

    /**
     * 根据id添加收藏
     * @param commodityid
     * @return
     */
    @ResponseBody
    @RequestMapping("/addLike")
    public Msg addLike(@RequestParam("commodityid") Integer commodityid, HttpSession session){

        String username= (String) session.getAttribute("yunUser2");
        //如果用户已登录就添加收藏，否则返回到登录页
        if (username!=null && ! username.equals("")){

            Integer userid=userService.findUserIdByName(username); //根据用户名字查询用户id

            Like like=new Like();
            like.setUserid(userid);
            like.setCommodityid(commodityid);
            likeService.addLikes(like);          //添加收藏

            return  Msg.success(); //登录用户，前台收到100跳转到购物车
        }else{
            return  Msg.fail(); //未登录用户，前台收到200跳转到登录页
        }
    }
    /**
     * 根据收藏id取消收藏
     * 根据用户id和商品id查询收藏id
     * @param commodityid
     * @return
     */
    @ResponseBody
    @RequestMapping("/removLike")
    public Msg removLike(@RequestParam("commodityid") Integer commodityid, HttpSession session){

            String username= (String) session.getAttribute("yunUser2");
            Integer userid=userService.findUserIdByName(username); //根据用户名字查询用户id

            Like like=new Like();
            like.setCommodityid(commodityid);
            like.setUserid(userid);
            Integer likeid=likeService.findLikeidByLike(like);//根据用户id和商品id查询收藏id

            likeService.removLike(likeid);//根据收藏id取消收藏

            return  Msg.success();

    }

    /**
     * 个人中心 我的收藏
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(@RequestParam(value = "pn",defaultValue = "1")Integer pn, HttpSession session, Model model) {

        String username= (String) session.getAttribute("yunUser2");

        Integer userid=userService.findUserIdByName(username);//查询指定用户名的用户id
        Integer cartnum=cartService.findCartNum(userid);        //根据用户id查询购物车商品种类的数量
        model.addAttribute("cartnum",cartnum);

        PageHelper.startPage(pn,3);             //一页几条数据
        List<Like> likes=likeService.findAllByUserName(username);//查询该用户全部订单信息
        PageInfo page=new PageInfo(likes,4); //分页条显示几个页
        if (page.getList().size()==0){//如果没收藏就跳转99页面
            return "qd/like99";
        }else{
            model.addAttribute("pageinfo",page);
            return "qd/like";
        }
    }


    @RequestMapping("/cs")
    public String aa(){
        return "qd/like99";
    }
}
