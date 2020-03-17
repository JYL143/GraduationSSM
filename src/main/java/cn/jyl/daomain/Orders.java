package cn.jyl.daomain;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.io.Serializable;
import java.text.SimpleDateFormat;

@Data
public class Orders implements Serializable {
    private Integer orderid;                  //订单主键id
    private String orderbh;                   //订单编号 (发货才有)
    private Double money;                     //实际付款
    private Integer postage;                  //运费
    private Integer orderstatus;              //订单状态
    private java.util.Date  ordertime;        //下单时间
    private java.util.Date  sendtime;         //发货时间
    private Integer kd;                       //发货快递
    private java.util.Date  closetime;        //成交时间
    private Integer userid;                   //用户id
    private Integer orderitemid;              //订单详情表id

    private User users;                       //外键 用户表
    private OrderItem orderItems;             // 外键 商品详情表


    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  //将实体类的data类型转成datatime
    private String ordertimeStr;    //这3个是data转datatime保存的字符串
    private String sendtimeStr;
    private String closetimeStr;


    public void setOrdertime(java.util.Date ordertime) {
        this.ordertime = ordertime;
        String time = sdf.format(ordertime);
        setOrdertimeStr(time);
    }

    public void setSendtime(java.util.Date sendtime) {
        this.sendtime = sendtime;
        String time = sdf.format(sendtime);
        setSendtimeStr(time);
    }


    public void setClosetime(java.util.Date closetime) {
        this.closetime = closetime;
        String time = sdf.format(closetime);
        setClosetimeStr(time);
    }


}
