package cn.jyl.dao;

import cn.jyl.daomain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LoginDao {


    /**
     * 登录方法
     * @param username
     * @return
     */
    User login(String username);

    /**
     * 查询数据库的所有用户名，来循环判断输入的用户名存在不存在
     * @return
     */
    List<String> findAllname();

    /**
     * 根据管理员手机号修改密码
     * @param
     */
    void updatepassword(User user);

    /**
     * 查询所有的管理员的电话号码判断前台输入的号码是不是管理员密码
     * @return
     */
    List<String> findAllphone();

    /**
     * 查询所有的管电话号码判断前台输入的号码是不是注册用户
     * @return
     */
    List<String> getphone();


    /**
     * 查询该手机号的用户名
     * @param phone
     * @return
     */
    String findNameByphone(String phone);

    /**
     * 前台注册用户
     * @param user
     */
    void registerUser(User user);
}
