package cn.jyl.controller;


import cn.jyl.Util.Index;
import cn.jyl.Util.Msg;
import cn.jyl.Util.RemindFindAll;
import cn.jyl.Util.YunPian;
import cn.jyl.daomain.Cat;
import cn.jyl.daomain.Commodity;

import cn.jyl.daomain.User;
import cn.jyl.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RequestMapping("/login")
@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;


    @Autowired
    private UserService userService;
    
    @Autowired
    private YunMiService yunMiService;

    @Autowired
    private RemindService remindService;

    @Autowired
    private OrdersService ordersService;

    /**
     * 登录方法 登录到商家页面
     * @param username
     * @param password
     * @param model
     * @param session 如果登录成功，向session里存值，有值代表成功，拦截器不拦截
     * @return
     */
    @RequestMapping("/dl")
    public String dl(@RequestParam("username")String username,
                     @RequestParam("password")String password, Model model, HttpSession session){

        int status=0;  //状态码，0表示用户名不存在 ，1表示存在
        List<String> list=loginService.findAllname(); //先查出数据库中所有的用户名
        for (String a:list) {  //循环判断是否存在用户名
             if (a.equals(username)||a==username){
                 status=1;
             }
        }

        if (status==1){ //如果用户名存在进行操作
            User user=loginService.login(username);
            String psw=user.getPassword();
            int  level=user.getLevel();

            if (psw!=null && psw.equals(password)){
                if (level==0){
                    //还要手机号也可以登录(要吗就是查两次用户名确定是手机号还是用户名，要吗就是获取到的时候判断是不是手机号码 是就差手机号码)
                    session.setAttribute("loginUser",username);  //登录成功的放到session域一个值，给拦截器用

                    //查询提醒的表存到session用于显示到主页面
                    List<Map<String,Object>>  reminds=remindService.findAll();
                    RemindFindAll.find(session,reminds); //写成工具类让多个方法可以方便调用

                    //显示主页面8个信息
                    Index.find(session,ordersService,userService);

                    return "hd/index-hd";
                }else {
                    String msg="登录失败,您不是管理员";
                    model.addAttribute("msg",msg);
                    return "login/login";
                }

            }else{

                String msg="登录失败，您的密码不正确";
                model.addAttribute("msg",msg);
                return "login/login";
            }
        }else{

            String msg="账户不存在！请输入正确的账号和密码！";
            model.addAttribute("msg",msg);
            return "login/login";
        }

    }


    /**
     * 查询所有的管理员的电话号码判断前台输入的号码是不是管理员密码
     * @return
     */
    @ResponseBody
    @RequestMapping("/getlevlelphone")
    public Integer getlevlelphone(String mobile,Model model){

        int status=0;  //状态码，0表示手机号不是管理员的手机号，1表示是
        List<String> list=loginService.findAllphone(); //先查出数据库中所有的手机号
        for (String a:list) {  //循环判断是否存在手机号
            if (a.equals(mobile)||a==mobile){
                status=1;
            }
        }

        return status;
    }

    /**
     * 发送短信验证码
     * @param mobile
     * @return
     */
    @ResponseBody
    @RequestMapping("/sendmessage")
    public Integer sendmessage(String mobile){

           Integer yzm= YunPian.send(mobile); //发送验证码
//             int yzm=378973;//模拟发送验证码
            System.out.println("正确的验证码是："+yzm);

          return yzm;
    }

    /**
     * 重新设置密码页
     * 传递输入的正确手机号
     * @return
     */
    @RequestMapping("/repassword_succes")
    public String repassword_succes(String phone,Model model){

        model.addAttribute("phone",phone); //将找回密码页传过来的手机号 保存进去，然后在重新设置密码页用el获取就可以了
        return "login/repassword_succes";
    }

    /**
     * 重设密码功能
     * 根据管理员手机号修改密码
     * @param password
     * @param password2
     * @param model
     * @return
     */
    @RequestMapping("/repassword_update/{phoneid}")
    public String repassword_update(@PathVariable(value = "phoneid") String phone, String password, String password2, Model model){


        if (password=="" || password2==""){
            String msg="请输入新密码";
            model.addAttribute("msg",msg);
            model.addAttribute("phone",phone);//重新在把手机号传递回去，不然在点击第二次修改就会报错
            return "login/repassword_succes";
        }else if(!password.equals(password2)){
            String msg="两次密码不一致请重新输入";
            model.addAttribute("msg",msg);
            model.addAttribute("phone",phone);//重新在把手机号传递回去，不然在点击第二次修改就会报错
            return "login/repassword_succes";
        }else{
            User user=new User();
            user.setPassword(password);
            user.setPhone(phone);
           loginService.updatepassword(user);
            String msg="设置密码成功，请重新登录";
            model.addAttribute("msg",msg);

            return "login/login";
        }
    }

    /**
     * 登录页
     * @return
     */
    @RequestMapping("/login1")
    public String login(){

        return "login/login";
    }

    /**
     * 忘记密码页
     * @return
     */
    @RequestMapping("/repassword")
    public String repassword(){
        return "login/repassword";
    }


    //------------------------------------------------------前台-----------------------------------------------------------

    /**
     * 前台登录页
     * @return
     */
    @RequestMapping("/yunlogin")
    public String yunlogin(){
        return "qd/yunlogin";
    }


    /**
     * 前台登录功能
     */
    @RequestMapping("/yundl")
    public String yundl(@RequestParam("username")String username,
                     @RequestParam("password")String password, Model model, HttpSession session){


        int status=0;  //状态码，0表示用户名不存在 ，1表示存在
        List<String> list=loginService.findAllname(); //先查出数据库中所有的用户名
        for (String a:list) {  //循环判断是否存在用户名
            if (a.equals(username)||a==username){
                status=1;
            }
        }
        if (status==1){ //如果用户名存在进行操作
            User user=loginService.login(username);
            String psw=user.getPassword();

            if (psw!=null && psw.equals(password)){
                session.setAttribute("yunUser2",username); //登录成功的放到session域一个值，给拦截器用,还有购物车,商品详情页用,
                Integer loginStatus= (Integer) session.getAttribute("loginStatus");
                String loginStatus1=String.valueOf(loginStatus);    //为什么转string，是因为如果是原始登录是为空的，int不能判断是不是空的

              if (loginStatus1!=null && loginStatus1.equals("1")){ //如果是1就直接跳转到购物车
                  session.setAttribute("loginStatus",0);    //用完在清0
                  return "redirect:/cart/carts";   //重定向到 购物车控制器的查询用户购物车方法
              }else if (loginStatus1!=null && loginStatus1.equals("2")){ //如果是2就直接跳到商品详情页
                  session.setAttribute("loginStatus",0);
                  Integer commodityid=(Integer)session.getAttribute("commodityid"); //获取商品详情页查询时保存的商品id 以便二次查询
                  return "redirect:/yunmi/commodity?commodityid="+commodityid;
              } else if (loginStatus1!=null && loginStatus1.equals("3")){//如果是3就直接跳到个人中心页
                  session.setAttribute("loginStatus",0);
                  return "redirect:/yunmi/userinfo";
              }else{
                  for (int i=1;i<=40;i=i+2){
                      List<Commodity> a= yunMiService.getCommodity(i);
                      model.addAttribute("list"+i,a);
                  }

                  return "qd/index";
              }


            }else{

                String msg="登录失败，您的密码不正确";
                model.addAttribute("msg",msg);
                return "qd/yunlogin";
            }
        }else{

            String msg="账户不存在！请输入正确的账号和密码！";
            model.addAttribute("msg",msg);
            return "qd/yunlogin";
        }
    }

    /**
     * 查询所有的电话号码判断前台输入的号码是不是注册用户
     * @return
     */
    @ResponseBody
    @RequestMapping("/getphone")
    public Integer getphone(String mobile,Model model){

        int status=0;  //状态码，1表示是该手机号是注册用户
        List<String> list=loginService.getphone(); //先查出数据库中所有的手机号
        for (String a:list) {  //循环判断是否存在手机号
            if (a.equals(mobile)||a==mobile){
                status=1;
            }
        }

        return status;
    }

    /**
     * 手机号登录成功
     * @param model
     * @return
     */
    @RequestMapping("/phonedl")
    public String phonedl(String phone,Model model, HttpSession session){

        String username=loginService.findNameByphone(phone);//查询该手机号的用户名

        session.setAttribute("yunUser2",username); //登录成功的放到session域一个值，给拦截器用,还有购物车,商品详情页用,
        for (int i=1;i<=40;i=i+2){
            List<Commodity> list= yunMiService.getCommodity(i);
            model.addAttribute("list"+i,list);
        }
        return "/qd/index";
    }

    /**
     * 前台注册页
     * @return
     */
    @RequestMapping("/yunregister")
    public String yunregister(){
        return "qd/register";
    }



    /**
     * 注册
     * @param user
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping("/register2")
    public Msg register2(User user, Model model,HttpSession session){

        int stock=0;//0表示用户名没重复，1表示用户名重复
        List<User> userk=userService.findAll();//查询数据库所有用户

        for (int i=0;i<userk.size();i++){ //判断用户名重复没
              if (userk.get(i).getUsername().equals(user.getUsername())){
                  stock=1;
                  break;
              }
        }
        if (stock==1){
            return Msg.fail();
        }else{
           loginService.registerUser(user); //不重复就添加用户
            String msg2="用户:"+user.getUsername()+",注册成功,请您重新输入账号密码登录！";
            model.addAttribute("msg2",msg2);
            session.setAttribute("registername",user.getUsername());
            return Msg.success();
        }
    }

    /**
     * 注册成功填写用户信息页
     * @return
     */
    @RequestMapping("/user")
    public String user(){

        return "qd/user";
    }

    /**
     * 添加用户信息
     * @return
     */
    @ResponseBody
    @RequestMapping("/adduser")
    public String adduser(User user,HttpSession session){

        Integer userid=userService.findUserIdByName((String) session.getAttribute("registername"));//获取注册成功时保存的注册用户名字
        user.setUserid(userid);
        userService.update(user);

        return "cs";
    }


    /**
     * 忘记密码页
     * @return
     */
    @RequestMapping("/repassword2")
    public String repassword2(){
        return "qd/repassword";
    }


    /**
     * 忘记密码_查询该手机号的用户名是不是输入框上的用户名
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/findUserNameByPhone")
    public Integer findUserNameByPhone(User user){
        int status=0;//0表示用户名不与手机号匹配，1表示匹配

        String username=userService.findUserNameByPhone(user.getPhone());
        if (username.equals(user.getUsername())){
            status=1;
        }
        return status;
    }


    /**
     * 个人中心修改密码页
     * @return
     */
    @RequestMapping("/userinfopassword")
    public String userinfopassword(HttpSession session){
        session.setAttribute("usernameBypassword",session.getAttribute("yunUser2"));
        return "qd/userinfopassword";
    }


    /**
     * 查询原密码
     * @return
     */
    @ResponseBody
    @RequestMapping("/findPassword")
    public String findPassword(HttpSession session){

       String userneme= (String) session.getAttribute("yunUser2");
       List<User> users=userService.findAllByName(userneme);
       String password=users.get(0).getPassword();

        return password;
    }


    /**
     * 重置密码页
     * @return
     */
    @RequestMapping("/repassworSuccess")
    public String repassworSuccess(String username,HttpSession session){
        session.setAttribute("usernameBypassword",username);//保存用户名，给重置密码方法用
        return "qd/repassworSuccess";
    }
    /**
     * 重置密码
     * @return
     */
    @RequestMapping("/updatePassword")
    public String updatePassword(String password,HttpSession session){

        String  username= (String) session.getAttribute("usernameBypassword");//获取上面保存的用户名
         Integer userid=userService.findUserIdByName(username);//查询指定用户名的id

         User user=new User();
         user.setUserid(userid);
         user.setPassword(password);

          userService.update(user);//修改密码

        return "qd/repassworSuccess";
    }





}
