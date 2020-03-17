package cn.jyl.controller;

import cn.jyl.config.AlipayConfig;
import cn.jyl.daomain.Cart;

import cn.jyl.service.CartService;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;


/**
 * 支付宝沙箱支付
 */
@Controller
@RequestMapping("/alipay")
public class AlipayController {

    @Autowired
    private CartService cartService;

    /**
     * @Description: 第三段 前往支付宝第三方网关进行支付
     * @version V1.0
     */
    @RequestMapping(value = "/goAlipay", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String goAlipay(double price, String cartids, HttpServletRequest request, HttpServletRequest response, HttpSession session) throws Exception {

        session.setAttribute("cartids",cartids); //将购物车id值存到session域，给支付成功使用

        String ordername="";  //商品名称
        int    quantity=0;    //购物车商品总数量
        int    postage=0;     //邮费
        //获取商品名称和商品详情信息给支付宝接口
        String [] str_cartids=cartids.split("-");//用这个方法然后判断-来分割
        for (String cartid2:str_cartids){
            int i=0;//获取list里的对象用
            Integer cartid=Integer.parseInt(cartid2);           //将string转成int类型

            //循环查询购物车订单信息
            List<Cart> carts=cartService.findAllById(cartid);                       //按id查询所有的购物车信息

            //商品名字
            String name=carts.get(i).getCommoditys().get(0).getName();
            name+="、";
            ordername+=name;                                             //下面会去除最后一个顿号

            quantity+=carts.get(i).getQuantity();                       //商品数量
            postage+=carts.get(i).getCommoditys().get(0).getPostage();  //邮费
            i++;
        }


        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //获取当前时间当商家订单号
        DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timeStr = sdf.format(new Date());

        Random random = new Random();
        // 随机数的量 自由定制，这是4位随机数
        Integer r = random.nextInt(9000) + 1000;
        String timeStr2=timeStr+r;



        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no ="yunmi"+timeStr;
        //付款金额，必填
        double total_amount =price;
        //订单名称，必填
        String subject =ordername.substring(0, ordername.length()-1);

        //商品描述，可空
        String body = "商品数量总计为："+quantity+",实际付款金额为："+price+"元,其中邮费为"+postage ;

        // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 该参数数值不接受小数点， 如 1.5h，可转换为 90m。
        String timeout_express = "1c";
        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ total_amount +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"timeout_express\":\""+ timeout_express +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();


        return result;
    }


}