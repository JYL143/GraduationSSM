package cn.jyl.service;

import cn.jyl.daomain.Shopinfo;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface ShopinfoService {


    //查询店铺基本信息
   Shopinfo findshopinfo();

   //修改店铺信息
    void update(Shopinfo shopinfo) ;
}
