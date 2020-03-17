package cn.jyl.service;

import cn.jyl.daomain.Commodity;

import java.util.List;

public interface YunMiService {

    // 查询数据到主页，跳转到前台主页（非登录页到主页用的方法）
    List<Commodity> getCommodity(Integer catid);
}
