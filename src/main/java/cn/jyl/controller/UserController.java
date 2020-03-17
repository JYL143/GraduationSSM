package cn.jyl.controller;

import cn.jyl.Util.Msg;

import cn.jyl.dao.UserDao;
import cn.jyl.daomain.User;
import cn.jyl.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 查询所有用户列表
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model,HttpSession session){
        PageHelper.startPage(pn,6);             //一页几条数据
        List<User> list=userService.findAll();

        PageInfo page=new PageInfo(list,5); //分页条显示几个页
        model.addAttribute("pageinfo",page);

        //查询用户有多少人显示到列表
        Integer userNumber=userService.findAllNumber();
        session.setAttribute("userNumber",userNumber);

        return "/hd/user_edit";
    }


    /**
     * 查询指定id的用户列表
     * @return
     */
    @RequestMapping("/findbyuserid")
    @ResponseBody
    public Msg findbyuserid(Integer userid){

        List<User> users= userService.findbyuserid(userid);

        return Msg.success().add("users",users);
    }


    /**
     * 更新用户信息
     * @param user ajax的data属性获取前台模态框的form提交的数据，在提交到这个对象里
     * @return
     */
    @ResponseBody
    @RequestMapping("/update")
    public  Msg update(Integer userid ,User  user) {

        user.setUserid(userid);
        userService.update(user);
        return Msg.success();
    }

    /**
     *  搜索功能 真实姓名，性别，用户级别
     * @param user
     * @return
     */
    @RequestMapping("/Search")
    public String Search(User user, @RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model) {

        PageHelper.startPage(pn,6);             //一页几条数据
        List<User> list= userService.search(user);
        PageInfo page=new PageInfo(list,5); //分页条显示几个页
        model.addAttribute("pageinfo",page);
            return "/hd/user_edit";
    }





}
