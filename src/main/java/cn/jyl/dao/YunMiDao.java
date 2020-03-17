package cn.jyl.dao;

import cn.jyl.daomain.Commodity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface YunMiDao {


    /**
     *  查询数据到主页，跳转到前台主页（非登录页到主页用的方法）
     * @param catid
     * @return
     */
    List<Commodity> getCommodity(Integer catid);



}
