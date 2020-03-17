package cn.jyl.controller;

import cn.jyl.Util.FileInput;
import cn.jyl.Util.Msg;
import cn.jyl.daomain.Shopinfo;
import cn.jyl.service.ShopinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@RequestMapping("/shopinfo")
@Controller
public class ShopInfoController {

    @Autowired
    private ShopinfoService shopinfoService;

    /**
     * 查询当前店铺的信息，，理论这里应该在设计用户表里如果是商家在存放哪个商家的id 然后这里根据id查询店铺  有空搞
     * 非ajax
     * @return
     */
    @RequestMapping("/shopinfo_zy")
    public String shopinfo_zy(Model model){

        Shopinfo shopinfo=  shopinfoService.findshopinfo();
        model.addAttribute("shopinfo",shopinfo);
        return "/hd/shopinfo_zy";
    }

    /**
     * 查询当前店铺的信息(给所有页面一打开就查询店铺信息然后给右上角导航栏名字和图片)
     * ajax
     * @return
     */
    @RequestMapping("/shopinfo_NameAndTp")
    @ResponseBody
    public Msg shopinfo_NameAndTp(){

        Shopinfo shopinfoNameAndTp=  shopinfoService.findshopinfo();
        return Msg.success().add("shopinfoNameAndTp",shopinfoNameAndTp);
    }


    /**
     * 修改店铺信息
     * @param shopinfo
     * @return
     */
    @RequestMapping("/update")
    public String update(Shopinfo shopinfo, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
        //自动封装url传递进来的id到这个对象里 ，前提与javabean属性名一样
//         System.out.println(shopinfo);
        String newFileName= FileInput.file(file);   //添加图片工具类
        shopinfo.setShopimage(newFileName);  //将数据库存放图片那个属性字段用set赋值他的文件名字，到时候取图片通过get
        shopinfoService.update(shopinfo);

        response.sendRedirect(request.getContextPath()+"/shopinfo/shopinfo_zy"); //请求重定向到当前类上面那个查询方法
        return null;
    }



}

