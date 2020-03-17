package cn.jyl.service;

import cn.jyl.daomain.User;

import java.util.List;

public interface LoginService {

    //登录到商家页面
    public User login(String username);

    // 查询数据库的所有用户名，来循环判断输入的用户名存在不存在
    List<String> findAllname();

    //根据管理员手机号修改密码
    void updatepassword(User user);

    //查询所有的管理员的电话号码判断前台输入的号码是不是管理员密码
    List<String> findAllphone();

    //查询所有的管电话号码判断前台输入的号码是不是注册用户
    List<String> getphone();

    //查询该手机号的用户名
    String findNameByphone(String phone);

    //前台注册用户
    void registerUser(User user);
}
