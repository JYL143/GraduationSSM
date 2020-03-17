package cn.jyl.controller;

import cn.jyl.Util.FileInput;
import cn.jyl.daomain.Cat;
import cn.jyl.daomain.Commodity;
import cn.jyl.Util.Msg;
import cn.jyl.daomain.Search;
import cn.jyl.daomain.Search2;
import cn.jyl.service.CatService;
import cn.jyl.service.CommodityService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@RequestMapping("/commodity")
@Controller
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private CatService catService;

    /**
     * 查询商品所有信息和按分类查询二合一
     * 获取图片功能
     * @param pn 当前要查询的页码
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public String  findAll(@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam(defaultValue = "99")Integer catid,Model model,HttpSession session){

        List<Commodity> list;

        //查询分类信息到下拉框
        List<Cat> cat2 = catService.findcatName();
        model.addAttribute("cat2", cat2);

        if (catid==99) {//如果方法没收到参数就看看是否保存过，保存过就获取之前查询的分类
            if ( session.getAttribute("catstatus")!=null){
                catid= (Integer) session.getAttribute("catstatus");
            }
        }else if (catid==0){ //如果为返回查询就消掉session
            session.setAttribute("catstatus",null);
        }else{//如果传参数，就保存分类id到session
            session.setAttribute("catstatus",catid);
        }

        PageHelper.startPage(pn, 6);             //一页几条数据
        if (catid==99 ||catid==0){ //0或者99就查询全部
          list = commodityService.findAll();
        }else{
          list=commodityService.findAllByCat(catid);
        }
        PageInfo page=new PageInfo(list,5); //分页条显示几个页
        model.addAttribute("pageinfo",page);


       return "/hd/commodity_edit";
    }


    /**
     * 查询指定id的商品名和库存 用来做库存和修改的模态框查询信息功能
     * @return
     */
    @RequestMapping("/findbycommodityid")
    @ResponseBody            //自动的吧返回的对象转为json对象,需要导入jackson包 ajax可以接收return返回的字符串
    public Msg findbycommodityid(  Integer commodityid){ //@PathVariable("id") 表示参数的id是通过路径上面的id传进来就是map注解/find/{id} 多用于result风格

        List<Commodity> commodity= commodityService.findbycommodityid(commodityid);
//        System.out.println(commodity.toString());

        //这里使用commodity对象的话 前台通过result.map.commodity获得数据 如果是list的话就是result.map.commodity[0] 因为list是数组形式
        return Msg.success().add("commodity",commodity);
    }



    /**
     * 更新商品操作
     * @param commodity ajax的data属性获取前台模态框的form提交的数据，在提交到这个对象里
     * @return
     */
    @ResponseBody
    @RequestMapping("/update")
    public  Msg update(Integer commodityid ,Commodity  commodity) {


//         System.out.println(commodity.toString());
        commodity.setCommodityid(commodityid); //这个就是传递进来的k值
        commodityService.update(commodity);
        return Msg.success();
    }

    /**
     * 添加商品并跳转商品管理的最后一页记录
     * 图片上传功能(存的是图片名)
     * @param commodity
     * @return
     */
    @RequestMapping("/savecommodity")
    public String sava(MultipartFile file, Commodity commodity, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {


        String newFileName= FileInput.file(file);   //添加图片工具类
        commodity.setImages(newFileName);  //将数据库存放图片那个属性字段用set赋值他的文件名字，到时候取图片通过get
        commodityService.savacommodity(commodity);    //添加记录

        //查询最后一页是第几页然后跳转到最后一页
        List<Commodity> list=commodityService.findAll();
        PageInfo page=new PageInfo(list);
        int pn;
        int total= (int) page.getTotal();//总记录数
        if (total%6==0){
            pn=total/6;
        }else{
            pn=total/6+1;
        }

        session.setAttribute("catstatus",null);//清空这个session，不然如果你当时查询了分类商品，这里跳转过去会因为存在session查不到商品
        response.sendRedirect(request.getContextPath()+"/commodity/findAll?pn="+pn); //请求重定向到当前类上面那个查询方法
        return  null;
    }

    /**
     * ajax请求的删除方法(改造成批量删除方法二合一)
     * @param ids
     * @return
     */
    @RequestMapping("/deletecommodity/{ids}")
    @ResponseBody
    public Msg delete(@PathVariable(value="ids") String ids){


        if (ids.contains("-")){//如果包含-表示批量删除
            String [] str_ids=ids.split("-");//用这个方法然后判断-来分割

            for (String id:str_ids){
                Integer id2=Integer.parseInt(id);
                 System.out.println(id2);

                commodityService.delete(id2);
            }

        }else{
            Integer id= Integer.parseInt(ids);
             commodityService.delete(id);//单个删除方法
        }



        return Msg.success();
    }



    /**
     * 商品状态页面（和状态搜索和库存查询功能三合一）
     * (管理上下架和补充库存，搜索)
     * 这里因为状态已经用到0了 返回查询消掉session用2表示
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/commodity_status")
    public String  commodity_status(@RequestParam(value = "pn",defaultValue = "1")Integer pn,@RequestParam(defaultValue = "99")Integer status,
                                    Integer kc1,Integer kc2, Model model,HttpSession session){

        List<Commodity> list;
        Search2 search=new Search2();

        if (status==99) {//如果方法没收到参数就看看是否保存过，保存过就获取之前查询的分类
            if ( session.getAttribute("status")!=null){
                status= (Integer) session.getAttribute("status");
            }
        }else if (status==2){ //如果为返回查询就消掉session
            session.setAttribute("status",null);
            session.setAttribute("kc1",null);
            session.setAttribute("kc2",null);
        }else{//如果传参数，就保存分类id到session
            session.setAttribute("status",status);
        }

        PageHelper.startPage(pn, 6);
        if (status==99 ||status==2){ //0或者99就查询全部
            if (kc1!=null ||kc2!=null){ //如果有输入金额查询，就使用下面那个查询否则就普通查询
                search.setKc1(kc1);
                search.setKc2(kc2);
                session.setAttribute("kc1",kc1);
                session.setAttribute("kc2",kc2);
                list=commodityService.findAllByStatus(search);
            }else if (session.getAttribute("kc1")!=null ||session.getAttribute("kc2")!=null){
                kc1= (Integer) session.getAttribute("kc1");
                kc2= (Integer) session.getAttribute("kc2");
                search.setKc1(kc1);
                search.setKc2(kc2);
                list=commodityService.findAllByStatus(search);
            }else {
                list=commodityService.findAll();
            }
        }else{
            if (kc1!=null ||kc2!=null) {
                search.setKc1(kc1);
                search.setKc2(kc2);
                session.setAttribute("kc1",kc1);
                session.setAttribute("kc2",kc2);
            }else if (session.getAttribute("kc1")!=null ||session.getAttribute("kc2")!=null){
                kc1= (Integer) session.getAttribute("kc1");
                kc2= (Integer) session.getAttribute("kc2");
                search.setKc1(kc1);
                search.setKc2(kc2);
            }
            search.setStatus(status);
            list=commodityService.findAllByStatus(search);
        }
        PageInfo page=new PageInfo(list,5);
        model.addAttribute("pageinfo",page);

        return  "hd/commodity_status";
    }

    /**
     * 商品上架功能，就是修改商品表一个商品状态属性就好了
     */
    @RequestMapping("/commodity_status_edit1")
    public String commodity_status_edit1(@RequestParam Integer commodityid,@RequestParam Integer pageNum,HttpServletRequest request, HttpServletResponse response) throws IOException {

        commodityService.commodity_status_edit1(commodityid);
        response.sendRedirect(request.getContextPath()+"/commodity/commodity_status?pn="+pageNum); //请求重定向到当前类上面那个查询方法
        return null;
    }
    /**
     * 商品下架功能
     */
    @RequestMapping("/commodity_status_edit0")
    public String commodity_status_edit0(@RequestParam Integer commodityid,@RequestParam Integer pageNum, HttpServletRequest request, HttpServletResponse response) throws IOException {


        commodityService.commodity_status_edit0(commodityid);
        response.sendRedirect(request.getContextPath()+"/commodity/commodity_status?pn="+pageNum); //请求重定向到当前类上面那个查询方法
        return null;
    }
    /**
     * 包邮功能
     */
    @RequestMapping("/commodity_status_postage0")
    public String commodity_status_postage0(@RequestParam Integer commodityid,@RequestParam Integer pageNum, HttpServletRequest request, HttpServletResponse response) throws IOException {

        commodityService.commodity_status_postage0(commodityid);

        response.sendRedirect(request.getContextPath()+"/commodity/commodity_status?pn="+pageNum); //请求重定向到当前类上面那个查询方法
        return null;
    }

    /**
     * 添加库存操作
     * @param commodity ajax的data属性获取前台模态框的form提交的数据，在提交到这个对象里
     * @return
     */
    @ResponseBody
    @RequestMapping("/add_stock")
    public  Integer AddStock(@RequestParam Integer commodityid ,Integer stock1,Commodity  commodity) {
        //如果下拉框不为空，就两个一起添加，如果为空就按手动添加
        if (stock1!=0){
            if (commodity.getStock()!=null){
                commodity.setStock(stock1+commodity.getStock());
            }else{
                commodity.setStock(stock1);
            }

        }

        commodity.setCommodityid(commodityid);
        commodityService.add_stock(commodity);

        return commodity.getStock();//返回一共添加的数量
    }






}
