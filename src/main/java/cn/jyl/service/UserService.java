package cn.jyl.service;

import cn.jyl.daomain.User;
import org.springframework.stereotype.Service;

import java.util.List;


public interface UserService {

    //查询所有用户列表
    List<User> findAll();

    //查询指定id的用户列表
    List<User> findbyuserid(Integer userid);

    //更新用户信息
    void update(User user);

    //搜索功能 真实姓名，性别，用户级别
    List<User> search(User user);

    //查询指定用户名的用户信息(商品详情页查询地址,个人中心用到)
    List<User> findAllByName(String username);

    //按用户姓名修改用户地址和性别,邮政编码，(个人中心用到)
    void update_AdressAndSex(User user);

    //查询指定用户名的用户id(个人中心的订单查询用到)
    Integer findUserIdByName(String username);

    //查询指定手机号的用户名(前台登录忘记密码用到)
    String findUserNameByPhone(String phone);

    //查询用户有多少人显示到列表
    Integer findAllNumber();
}
