package cn.jyl.controller;

import cn.jyl.Util.Msg;
import cn.jyl.Util.OrdersBh;
import cn.jyl.Util.RemindFindAll;
import cn.jyl.daomain.Commodity;
import cn.jyl.daomain.Orders;
import cn.jyl.daomain.Search;
import cn.jyl.service.OrdersService;
import cn.jyl.service.RemindService;
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

@RequestMapping("/order")
@Controller
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private RemindService remindService;
    /**
     * 显示订单列表主页
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(@RequestParam(value = "pn",defaultValue = "1") Integer pn,Model model){
        
            PageHelper.startPage(pn,6);             //一页几条数据
            List<Orders> orders= ordersService.findAll();

            PageInfo page=new PageInfo(orders,5); //分页条显示几个页
            model.addAttribute("pageinfo",page);

        return "/hd/orders_edit";
    }


    /**
     * 使用ajax查询指定id到查看详情模态框上
     * @param orderid
     * @return
     */
    @RequestMapping("/findAllbyorderid")
    @ResponseBody
    public Msg findAllbyorderid( Integer orderid){
          
        List<Orders> orders= ordersService.findAllbyorderid(orderid);

        return Msg.success().add("orders",orders);

    }

    /**
     * 订单受理功能
     * @param orderid
     * @param pageNum
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("orders_status_edit1")
    public String orders_status_edit1(@RequestParam Integer orderid, @RequestParam Integer pageNum, @RequestParam(value = "status",defaultValue = "11") Integer status,
                                      HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

        ordersService.orders_status_edit1(orderid);
        //看是否该订单存在于提醒表，存在就删除提醒记录
        int remind=0;
        List<Integer> remind0s=remindService.findAll2(remind);//查询为0的所有提醒
        for (int i=0;i<remind0s.size();i++){
            if (orderid.equals(remind0s.get(i))){//因为这里到时候订单如果大于127就不能用等于
                remindService.delete(orderid);//如果该订单存在于提醒表就删除提醒记录
                //刷新菜单栏提醒数字
                List<Map<String,Object>>  reminds=remindService.findAll();
                RemindFindAll.find(session,reminds);
                break;
            }
        }

        if (status==0){
            response.sendRedirect(request.getContextPath()+"/order/orders_status0?pn="+pageNum);
        }else{
            response.sendRedirect(request.getContextPath()+"/order/findAll?pn="+pageNum);
        }

        return null;
    }


    /**
     * 生成订单单号方法
     * @return
     */
    @ResponseBody
    @RequestMapping("/ordersbh")
    public String ordersbh() {
        String result=OrdersBh.generateUniqueKey();
        return result;
    }


    /**
     *订单发货功能（改发货状态和发货时间）
     * @param orderid
     * @param orders
     * @return
     */
    @ResponseBody
    @RequestMapping("orders_status_edit2")
    public Msg orders_status_edit2( Integer orderid,Orders orders,HttpSession session)  {
//         System.out.println(orders);

        if (orders.getOrderbh()!=null && !orders.getOrderbh().equals("")){  //如果单号不为空就执行，如果为空不执行
            // 获取当前时间
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String timeStr = sdf.format(new Date());
            orders.setSendtimeStr(timeStr);

            ordersService.orders_status_edit2(orders);

            //看是否该订单存在于提醒表，存在就删除提醒记录
            int remind=1;
            List<Integer> remind1s=remindService.findAll2(remind);//查询为1的所有提醒

            for (int i=0;i<remind1s.size();i++){
                if (orderid.equals(remind1s.get(i))){//因为这里到时候订单如果大于127就不能用等于
                    remindService.delete(orderid);//如果该订单存在于提醒表就删除提醒记录
                    //刷新菜单栏提醒数字
                     System.out.println("");
                    List<Map<String,Object>>  reminds=remindService.findAll();
                    RemindFindAll.find(session,reminds);
                    break;
                }
            }
            return Msg.success();
        }else{
//             System.out.println("单号为空");
            return Msg.fail();
        }
    }



    /**
     *  搜索功能 查询金额范围，单号 时间
     *  五合一页面改造过
     * @param search
     * @return
     */
    @RequestMapping("/Search")
    public String Search(Search search,@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model) {


        PageHelper.startPage(pn,6);             //一页几条数据
        List<Orders> orders= ordersService.search(search);
        PageInfo page=new PageInfo(orders,5); //分页条显示几个页
        model.addAttribute("pageinfo",page);

        if (search.getStatus()==0){//如果状态不为空，就表示搜索分类列表主页
            return "/hd/orders_status0";
        }else if(search.getStatus()==1){
            return "/hd/orders_status1";
        }else if(search.getStatus()==2){
            return "/hd/orders_status2";
        }else if(search.getStatus()==3){
            return "/hd/orders_status3";
        } else if (search.getStatus()==99){      //如果状态为空，就表示搜索列表主页
            return "/hd/orders_edit";

        }else{
            return null;
        }

    }

    /**
     * 显示未处理订单列表主页
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/orders_status0")
    public String orders_status0(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){

        PageHelper.startPage(pn,6);
        List<Orders> orders= ordersService.orders_status0();

        PageInfo page=new PageInfo(orders,5);
        model.addAttribute("pageinfo",page);

        return "/hd/orders_status0";
    }
    /**
     * 显示未处理订单列表主页
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/orders_status1")
    public String orders_status1(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){

        PageHelper.startPage(pn,6);
        List<Orders> orders= ordersService.orders_status1();

        PageInfo page=new PageInfo(orders,5);
        model.addAttribute("pageinfo",page);

        return "/hd/orders_status1";
    }
    /**
     * 显示未处理订单列表主页
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/orders_status2")
    public String orders_status2(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){

        PageHelper.startPage(pn,6);
        List<Orders> orders= ordersService.orders_status2();

        PageInfo page=new PageInfo(orders,5);
        model.addAttribute("pageinfo",page);

        return "/hd/orders_status2";
    }
    /**
     * 显示未处理订单列表主页
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/orders_status3")
    public String orders_status3(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){

        PageHelper.startPage(pn,6);
        List<Orders> orders= ordersService.orders_status3();

        PageInfo page=new PageInfo(orders,5);
        model.addAttribute("pageinfo",page);

        return "/hd/orders_status3";
    }


}
