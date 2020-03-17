package cn.jyl.daomain;

import lombok.Data;

import java.io.Serializable;

/**
 * 商品状态页搜索功能加的封装类
 */
@Data
public class Search2 implements Serializable {

    private Integer kc1;     //搜索时提交的库存1
    private Integer kc2;     //搜索时提交的库存2
    private Integer status; //商品状态


}