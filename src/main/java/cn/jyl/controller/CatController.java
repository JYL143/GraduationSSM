package cn.jyl.controller;


import cn.jyl.daomain.Cat;
import cn.jyl.Util.Msg;
import cn.jyl.service.CatService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@RequestMapping("/cat")
@Controller
public class CatController {

    @Autowired
    private CatService catService;


    /**
     * 查询有商品的分类信息
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/findAllcat")  //下面调用的还是findcs方法
    public String findAllcat(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,9);
        List<Map<String,Object>> list = catService.findcs();

        PageInfo page=new PageInfo(list,5);
        model.addAttribute("pageinfo",page);

        return "/hd/cat_edit";
    }


    /**
     * 查询没有商品的分类id
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/findcs2")
    public String findcs2(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        PageHelper.startPage(pn,9);
        List<Map<String,Object>> list = catService.findcs0();

        PageInfo page=new PageInfo(list,5);
        model.addAttribute("pageinfo",page);
        return "/hd/cat_edit_0";
    }


    /**
     * 删除方法
     * @return
     */
    @RequestMapping("/deletecat")
    @ResponseBody
    public Msg delete( Integer catid){

        catService.delete(catid);//单个删除方法

        return Msg.success();
    }
    /**
     * 添加
     * @param catname
     * @return
     */
    @ResponseBody
    @RequestMapping("/add")
    public Integer add(String catname, HttpServletRequest request, HttpServletResponse response) throws IOException {


        int catstatus=99;//如果是100表示分类名字重复，不能添加,不能超过127

        List<Cat> cats=catService.findAll();

        for (int i=0;i<cats.size();i++){
               catstatus=99;
            if (cats.get(i).getCatname().equals(catname)){
                catstatus=100;
                break;
            }
        }
        if (catstatus==99){//不重复就添加记录
            catService.add(catname);    //添加记录

            List<Map<String,Object>> list = catService.findcs0();        //查询最后一页是第几页然后跳转到最后一页
            PageInfo page=new PageInfo(list);
            int pn;
            int total= (int) page.getTotal();
            if (total%9==0){
                pn=total/9;
            }else{
                pn=total/9+1;
            }

            return  pn; //不重复返回页码跳转
        }else{
            return  catstatus; //重复就返回状态码1
        }
    }


    /**
     * 查询指定id的分类信息
     * @return
     */
    @RequestMapping("/findbycatid")
    @ResponseBody
    public Msg findbycatid(Integer catid){

        List<Cat> cat= catService.findbycatid(catid);


        return Msg.success().add("cat",cat);
    }


    /**
     * 更新方法
     * @param catid
     * @param catname
     * @return
     */
    @ResponseBody
    @RequestMapping("/update")
    public  Msg update(Integer catid ,String  catname) {

        Cat cat=new Cat();

        cat.setCatid(catid);
        cat.setCatname(catname);

       catService.update(cat);
        return Msg.success();
    }




    //--------------------------------其他表调用这个表的方法写到了这里--------------------------------
    /**
     * 专用方法1
     * 查询所有分类信息, 给商品添加页面用
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Model model){
        List<Cat> cat= catService.findAll();

        model.addAttribute("cat",cat);
        return "/hd/commodity_add";
    }
    /**
     * 专用方法2
     * 查询所有分类信息,显示到修改页面上的下拉框，这个是用ajax调用的，所以返回json字符串过去
     * @return
     */
    @RequestMapping("/findAll2")
    @ResponseBody
    public Msg findAll2(){
        List<Cat> cat= catService.findAll();
//         System.out.println(cat.toString());

        return Msg.success().add("cats",cat);//这个add方法就代替了model存数据，因为要返回一个json数据还有用ajax请求
    }
}
