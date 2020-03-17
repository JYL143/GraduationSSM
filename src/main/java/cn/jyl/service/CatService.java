package cn.jyl.service;


import cn.jyl.daomain.Cat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CatService {


    //查询所有分类信息
    List<Cat> findAll();

    //查询有商品的分类信息
    List<Map<String,Object>>  findcs();

    //查询没有商品的分类信息
    List<Map<String, Object>> findcs0();

    //删除方法
    void delete(Integer catid);

    //添加方法
    void add(String catname);

    //查询指定id的分类信息
    List<Cat> findbycatid(Integer catid);

    //更新方法
    void update(Cat cat);

    //只查询有商品的分类名和id(商品管理页用到)
    List<Cat> findcatName();
}
