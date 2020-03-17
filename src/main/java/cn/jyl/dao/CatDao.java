package cn.jyl.dao;

import cn.jyl.daomain.Cat;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public interface CatDao {


    /**
     * 查询所有分类信息
     * @return
     */
    List<Cat> findAll();

    /**
     * 查询有商品的分类信息
     * @return
     */
    List<Map<String,Object>>  findcs();

    /**
     * 查询没有商品的分类信息
     * @return
     */
    List<Map<String, Object>> findcs0();

    /**
     * 删除方法
     * @param catid
     */
    void delete(Integer catid);

    /**
     * 添加方法
     * @param catname
     */
    void add(String catname);

    /**
     * 查询指定id的分类信息
     * @param catid
     * @return
     */
    List<Cat> findbycatid(Integer catid);

    /**
     * 更新方法
     * @param cat
     */
    void update(Cat cat);

    /**
     * 只查询有商品的分类名和id(商品管理页用到)
     * @return
     */
    List<Cat> findcatName();
}
