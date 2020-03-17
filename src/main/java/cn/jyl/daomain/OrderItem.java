package cn.jyl.daomain;

import lombok.Data;

import java.io.Serializable;
@Data
public class OrderItem implements Serializable {

    private Integer orderitemid;         //主键id
    private String name;                 //商品名字
    private String images;               //商品图片
    private Double price;                //商品价格
    private Integer quantity;            //商品数量
    private Integer orderid;             //订单表id
    private Integer commodityid;         //商品表id


    private Commodity commoditys;  //前台我的订单未了商品信息做的3表查询
    //还有两个对象?

}
