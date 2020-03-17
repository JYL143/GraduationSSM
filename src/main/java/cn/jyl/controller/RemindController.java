package cn.jyl.controller;

import cn.jyl.Util.Msg;
import cn.jyl.Util.RemindFindAll;
import cn.jyl.daomain.Orders;
import cn.jyl.daomain.Remind;
import cn.jyl.service.OrdersService;
import cn.jyl.service.RemindService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RequestMapping("/remind")
@Controller
public class RemindController {

    @Autowired
    private RemindService remindService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrdersService ordersService;

    /**
     * 提醒受理功能
     * 先查询是否提醒过，提醒过就刷新时间，否则就添加提醒
     * @param orderid
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/orders_remind0")
    public String orders_remind0(Integer orderid, HttpSession session){

        List<Remind> reminds =remindService.booleanOrderid(orderid); //查询是否提醒过

        if (reminds.size()!=0){
            Remind reminds1=new Remind();
            reminds1.setRemindtime(new Date());
            reminds1.setOrderid(orderid);
            remindService.update(reminds1);//更新时间

        }else{ //不为空做添加操作
            String username= (String) session.getAttribute("yunUser2");
            Integer userid=userService.findUserIdByName(username);//查询指定用户名的用户id

            Remind remind=new Remind();
            remind.setOrderid(orderid);
            remind.setUserid(userid);
            remind.setRemind(0); //0表示提醒受理，1提醒发货
            remind.setRemindtime(new Date());
            remindService.addRemind(remind);
        }
        return "cs";
    }


    /**
     * 提醒发货功能
     * 先查询是否提醒过，1提醒过 如果是提醒受理状态 就变成提醒发货状态，  如果是提醒发货状态就刷新时间，2 没提醒过就添加提醒发货
     * @param orderid
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/orders_remind1")
    public String orders_remind1(Integer orderid, HttpSession session){

        List<Remind> reminds =remindService.booleanOrderid(orderid); //查询是否提醒过

        if (reminds.size()!=0){
            Remind reminds1=new Remind();//放到上面，下面就可以共同使用
            reminds1.setRemindtime(new Date());
            reminds1.setOrderid(orderid);

            if (reminds.get(0).getRemind()==0){
                //原来提醒过受理，然后现在是未发货提醒，（比如你提醒0，卖家没有看到提醒 也就不会删除提醒0 然后受理了  所以受理表还有这个记录，直接改记录为1）
                reminds1.setRemind(1);
                remindService.update(reminds1);
            }else {//只用更新时间，不用更新消息状态
                remindService.update(reminds1);//更新时间
            }

        }else{ //不为空做添加操作
            String username= (String) session.getAttribute("yunUser2");
            Integer userid=userService.findUserIdByName(username);//查询指定用户名的用户id

            Remind remind=new Remind();
            remind.setOrderid(orderid);
            remind.setUserid(userid);
            remind.setRemind(1); //0表示提醒受理，1提醒发货
            remind.setRemindtime(new Date());
            remindService.addRemind(remind);

        }
        return "cs";
    }

    //-------------------------------后台---------------------------------------------------


    /**
     * 受理提醒页
     * 查询提醒以及订单 商品 用户 信息，5表查询
     * @return
     */
    @RequestMapping("/remind0")
    public String remind0(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model,HttpSession session){

        //刷新菜单栏的提醒数量
        List<Map<String,Object>>  reminds2=remindService.findAll();
        RemindFindAll.find(session,reminds2);

        Integer remind=0;
        PageHelper.startPage(pn,6);
        List<Remind> reminds=remindService.findAllPlus(remind);
        PageInfo page=new PageInfo(reminds,5);

        //        System.out.println(page.getList().get(0).toString());
        if (page.getList().size()==0){//如果没有提醒就去无提醒页
            model.addAttribute("k",0);
            return "hd/remind99";
        }else{
            model.addAttribute("pageinfo",page);
            return "hd/remind0";
        }



    }

    /**
     * 发货提醒页
     * @return
     */
    @RequestMapping("/remind1")
    public String remind1(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model,HttpSession session){

        //刷新菜单栏的提醒数量
        List<Map<String,Object>>  reminds2=remindService.findAll();
        RemindFindAll.find(session,reminds2);

        Integer remind=1;
        PageHelper.startPage(pn,6);
        List<Remind> reminds=remindService.findAllPlus(remind);
        PageInfo page=new PageInfo(reminds,5);

        if (page.getList().size()==0){//如果没有提醒就去无提醒页
            model.addAttribute("k",1);
            return "hd/remind99";
        }else{
            model.addAttribute("pageinfo",page);
            return "hd/remind1";
        }
    }

    /**
     *  催单信息0  确认受理
     * @param orderid
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/orders_status_edit1")
    public String orders_status_edit1(@RequestParam Integer orderid,HttpSession session) {
        ordersService.orders_status_edit1(orderid);
        remindService.delete(orderid); //后台处理催单后，删除提醒记录

        //刷新菜单栏的提醒数量
        List<Map<String,Object>>  reminds=remindService.findAll();
        RemindFindAll.find(session,reminds);

        return "cs";
    }

    /**
     *  催单信息1  确认发货
     * @param orderid
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/orders_status_edit2")
    public Msg orders_status_edit2( Integer orderid,Orders orders,HttpSession session) {
        if (orders.getOrderbh()!=null && !orders.getOrderbh().equals("")){  //如果单号不为空就执行，如果为空不执行
            // 获取当前时间
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String timeStr = sdf.format(new Date());
            orders.setSendtimeStr(timeStr);

            ordersService.orders_status_edit2(orders);

            remindService.delete(orderid); //后台处理催单后，删除提醒记录
            //刷新菜单栏的提醒数量
            List<Map<String,Object>>  reminds=remindService.findAll();
            RemindFindAll.find(session,reminds);

            return Msg.success();
        }else{
            return Msg.fail();
        }

    }
}