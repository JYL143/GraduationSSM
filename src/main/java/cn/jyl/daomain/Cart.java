package cn.jyl.daomain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Data
public class Cart implements Serializable {

    private Integer cartid;        //购物车id
    private Integer quantity;      //商品数量
    private Integer commodityid;   //商品id
    private Integer userid;        //用户id

    //一对多关系映射，主表实体应该包含从表实体的集合引用
    private List<User> users;

    private List<Commodity> commoditys;  //这里写一对多 到时候改多对多



}
