package cn.jyl.daomain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * 外键和图片要改
 */
@Data
public class Commodity  implements Serializable {

    private Integer commodityid;    //商品id
    private String name;            //商品名字
    private String subtitle;        //商品参数
    private String information;     //商品信息
    private String describe2;        //商品描述
    private String images;          //商品图片
    private Double price;           //商品价格
    private Integer stock;          //商品库存
    private Integer status;         //商品状态
    private Integer postage;        //运费
    private Integer catid;          //  类别编号 外键需要1对多还是多对1

    private Cat cats;           //一种商品只能有一种分类，一种分类有多种商品 商品对分类 多对1
    private Cart carts;           //多对1  应该改成多对多 商品对购物车


}
