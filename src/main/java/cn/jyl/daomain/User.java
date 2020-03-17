package cn.jyl.daomain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Data
public class User  implements Serializable {

    private Integer userid;     //用户主键id
    private String username;    //用户名
    private String password;    //密码
    private String phone;       //手机号
    private String realname;    //真实姓名
    private String sex;         //性别
    private String cardid;      //身份证号
    private String useraddress; //用户地址
    private Integer zipcode;    //邮编
    private Integer level;      //用户级别 1普通用户 0管理员

    private Cart carts;           //多对1  应该改成多对多 商品对购物车

}
