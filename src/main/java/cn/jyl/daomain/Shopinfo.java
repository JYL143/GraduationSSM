package cn.jyl.daomain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Data
public class Shopinfo implements Serializable {

    private  Integer shopinfoid;    //店铺主键id
    private String shopname;        //店铺名
    private String shopaddress;     //店铺地址
    private Integer shopblue;       //店铺信誉等级
    private Integer shopfs;         //店铺粉丝数
    private String shopimage;       //店铺图片
    private String shopjs;          //店铺介绍

}
