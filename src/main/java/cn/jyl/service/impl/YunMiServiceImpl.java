package cn.jyl.service.impl;

import cn.jyl.dao.YunMiDao;
import cn.jyl.daomain.Commodity;
import cn.jyl.service.YunMiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class YunMiServiceImpl implements YunMiService {

    @Autowired
    private YunMiDao yunMiDao;


    /**
     *  查询数据到主页，跳转到前台主页（非登录页到主页用的方法）
     * @param catid
     * @return
     */
    @Override
    public List<Commodity> getCommodity(Integer catid) {
        return yunMiDao.getCommodity(catid);
    }
}
