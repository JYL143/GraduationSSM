package cn.jyl.service.impl;

import cn.jyl.dao.UserDao;
import cn.jyl.daomain.User;
import cn.jyl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserDao userDao;


    /**
     * 查询所有用户列表
     * @return
     */
    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    /**
     * 查询指定id的用户列表
     * @param userid
     * @return
     */
    @Override
    public List<User> findbyuserid(Integer userid) {
        return userDao.findbyuserid(userid);
    }

    /**
     * 更新用户信息
     * @param user
     */
    @Override
    public void update(User user) {
        userDao.update(user);
    }

    /**
     * 搜索功能 真实姓名，性别，用户级别
     * @param user
     * @return
     */
    @Override
    public List<User> search(User user) {
        return userDao.search(user);
    }

    /**
     * 查询指定用户名的用户信息(商品详情页查询地址,个人中心用到)
     * @param username
     * @return
     */
    @Override
    public List<User> findAllByName(String username) {
        return userDao.findAllByName(username);
    }

    /**
     * 按用户姓名修改用户地址和性别(个人中心用到)
     * @param user
     */
    @Override
    public void update_AdressAndSex(User user) {
        userDao.update_AdressAndSex(user);
    }

    /**
     * 查询指定用户名的用户id(个人中心的订单查询用到)
     * @param username
     * @return
     */
    @Override
    public Integer findUserIdByName(String username) {
        return userDao.findUserIdByName(username);
    }

    /**
     * 查询指定手机号的用户名(前台登录忘记密码用到)
     * @param phone
     * @return
     */
    @Override
    public String findUserNameByPhone(String phone) {
        return userDao.findUserNameByPhone(phone);
    }

    /**
     * 查询用户有多少人显示到列表
     * @return
     */
    @Override
    public Integer findAllNumber() {
        return userDao.findAllNumber();
    }
}
