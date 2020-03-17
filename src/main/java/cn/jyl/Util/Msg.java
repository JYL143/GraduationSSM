package cn.jyl.Util;

import java.util.HashMap;
import java.util.Map;


/**
 * 通用的返回类
 */
public class Msg {
    private int code; //状态码 设置返回100-成功，200-失败
    private String msg;//提示信息

    //用户要返回给浏览器的数据
    private Map<String,Object> map=new HashMap<String, Object>();

    //成功方法
    public  static Msg success(){
        Msg result= new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }
    //失败方法
    public  static Msg fail(){
        Msg result= new Msg();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }
    //特殊情况状态码300
    //表示查询到商品只有一个，然后直接跳转到商品详情页

    public  static Msg success300(){
        Msg result= new Msg();
        result.setCode(300);
        result.setMsg("处理成功");
        return result;
    }
    //使msg对象可以链式操作
    public Msg add(String key,Object value){
        //给当前对象的map集合放数据，map集合上面定义了
        this.getMap().put(key,value);
        return this;
    }


    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
