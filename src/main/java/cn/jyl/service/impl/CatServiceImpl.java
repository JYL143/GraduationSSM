package cn.jyl.service.impl;

import cn.jyl.dao.CatDao;
import cn.jyl.daomain.Cat;
import cn.jyl.service.CatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CatServiceImpl implements CatService {

    @Autowired
    private CatDao catDao;

    /**
     * 查询所有分类信息
     * @return
     */
    @Override
    public List<Cat> findAll() {
        return catDao.findAll();
    }

    /**
     * 查询有商品的分类信息
     * @return
     */
    @Override
    public  List<Map<String,Object>> findcs() {
        return catDao.findcs();
    }

    /**
     * 查询没有商品的分类信息
     * @return
     */
    @Override
    public List<Map<String, Object>> findcs0() {
        return catDao.findcs0();
    }

    /**
     * 删除方法
     * @param catid
     */
    @Override
    public void delete(Integer catid) {
        catDao.delete(catid);
    }

    /**
     * 添加方法
     * @param catname
     */
    @Override
    public void add(String catname) {
        catDao.add(catname);
    }

    /**
     * 查询指定id的分类信息
     * @param catid
     * @return
     */
    @Override
    public List<Cat> findbycatid(Integer catid) {
        return catDao.findbycatid(catid);
    }

    /**
     * 更新方法
     * @param cat
     */
    @Override
    public void update(Cat cat) {
        catDao.update(cat);
    }

    /**
     * 只查询有商品的分类名和id(商品管理页用到)
     * @return
     */
    @Override
    public List<Cat> findcatName() {
        return catDao.findcatName();
    }
}
