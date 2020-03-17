package cn.jyl.Util;

import cn.jyl.service.OrdersService;
import cn.jyl.service.UserService;

import javax.servlet.http.HttpSession;


public class Index {
    public static void find(HttpSession session, OrdersService ordersService, UserService userService){
        //显示主页面上面5个信息
        Integer orderNumber=ordersService.findCount();          //订单总记录数
        Integer order0Number=ordersService.findCountBystatus0();//未处理记录数
        Integer order1Number=ordersService.findCountBystatus1();//待发货记录数
        Integer userNumber=userService.findAllNumber();         //用户人数，菜单栏和主页面使用
        Double money=ordersService.findAllMoney();              //成交金额
        session.setAttribute("orderNumber",orderNumber);
        session.setAttribute("order0Number",order0Number);
        session.setAttribute("order1Number",order1Number);
        session.setAttribute("userNumber",userNumber);
        session.setAttribute("money",money);

        //显示主页面下面3个百分比和信息
        Double dsxl2=ordersService.findAllDs();  //电视销量
        Double sjxl2=ordersService.findAllSj();  //手机销量
        Double jdxl2=ordersService.findAllJd();  //家电销量
        Double dxbfb=dsxl2/orderNumber*100;      //电视百分比
        Double sjbfb=sjxl2/orderNumber*100;      //手机百分比
        Double jdbfb=jdxl2/orderNumber*100;      //家电百分比

        //算好百分比转成int显示多少笔
        int dsxl=new Double(dsxl2).intValue();
        int sjxl=new Double(sjxl2).intValue();
        int jdxl=new Double(jdxl2).intValue();

        session.setAttribute("dsxl",dsxl);
        session.setAttribute("sjxl",sjxl);
        session.setAttribute("jdxl",jdxl);
        session.setAttribute("dxbfb",dxbfb);
        session.setAttribute("sjbfb",sjbfb);
        session.setAttribute("jdbfb",jdbfb);

    }
}
