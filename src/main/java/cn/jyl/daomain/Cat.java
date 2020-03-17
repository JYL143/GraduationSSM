package cn.jyl.daomain;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Data
public class Cat implements Serializable {

    private Integer catid;          //分类主键id
    private String catname;         //分类名

    //一对多关系映射，主表实体应该包含从表实体的集合引用
    private List<Commodity> commoditys;


}
