package cn.jyl.controller;

import cn.jyl.Util.Index;
import cn.jyl.Util.RemindFindAll;
import cn.jyl.daomain.Orders;
import cn.jyl.service.OrdersService;
import cn.jyl.service.RemindService;
import cn.jyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@RequestMapping("/tz")
@Controller
public class Tiaoz {

    @Autowired
    private RemindService remindService;

    @Autowired
    private UserService userService;

    @Autowired
    private OrdersService ordersService;
    /**
     * 显示主页
     * @return
     */
    @RequestMapping("/index-hd")
    public String indexhd(HttpSession session){

        //查询提醒的表存到session用于显示到主页面
        List<Map<String,Object>>  reminds=remindService.findAll();
        RemindFindAll.find(session,reminds); //写成工具类让多个方法可以方便调用

        //显示主页面8个信息
        Index.find(session,ordersService,userService);

        return "/hd/index-hd";
    }




    @ResponseBody
    @RequestMapping(value = "/cs2",produces = {"application/json;charset=UTF-8"})
    public String c2s(){

        String a="这是测试ajax接收字符串中文乱码问题";
        return a;
    }





}
