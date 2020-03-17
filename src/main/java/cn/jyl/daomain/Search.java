package cn.jyl.daomain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * 搜索功能加的封装类
 */
@Data
public class Search implements Serializable {
    private String bh;      //搜索时提交的编号
    private String kd2;       //搜索时提交的快递
    private Double je1;     //搜索时提交的金额1
    private Double je2;     //搜索时提交的金额2
    private Integer status; //不同订单页面保存的状态


}
