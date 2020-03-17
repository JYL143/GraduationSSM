package cn.jyl.service.impl;

import cn.jyl.dao.LoginDao;
import cn.jyl.daomain.User;
import cn.jyl.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;
    /**
     * 登录到商家
     * @param username
     * @return
     */
    @Override
    public User login(String username) {
        return loginDao.login(username);
    }

    /**
     *  查询数据库的所有用户名，来循环判断输入的用户名存在不存在
     * @return
     */
    @Override
    public List<String> findAllname() {
        return loginDao.findAllname();
    }

    /**
     * 根据管理员手机号修改密码
     * @param user
     */
    @Override
    public void updatepassword(User user) {
        loginDao.updatepassword(user);
    }

    /**
     * 查询所有的管理员的电话号码判断前台输入的号码是不是管理员密码
     * @return
     */
    @Override
    public List<String> findAllphone() {
        return loginDao.findAllphone();
    }

    /**
     * 查询所有的管电话号码判断前台输入的号码是不是注册用户
     * @return
     */
    @Override
    public List<String> getphone() {
        return loginDao.getphone();
    }

    /**
     * 查询该手机号的用户名
     * @param phone
     * @return
     */
    @Override
    public String findNameByphone(String phone) {
        return loginDao.findNameByphone(phone);
    }

    /**
     * 前台注册用户
     * @param user
     */
    @Override
    public void registerUser(User user) {
        loginDao.registerUser(user);
    }


}
