package cn.jyl.service.impl;

import cn.jyl.dao.LikeDao;
import cn.jyl.daomain.Like;
import cn.jyl.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LikeServiceImpl implements LikeService {

    @Autowired
    private LikeDao likeDao;


    /**
     * 添加收藏
     * @param like
     */
    @Override
    public void addLikes(Like like) {
        likeDao.addLikes(like);
    }

    /**
     * 查询登录用户所有的收藏 个人中心
     * @param username
     * @return
     */
    @Override
    public List<Like> findAllByUserName(String username) {
        return likeDao.findAllByUserName(username);
    }

    /**
     * 根据用户id和商品id查询收藏id
     * @param like
     * @return
     */
    @Override
    public Integer findLikeidByLike(Like like) {
        return likeDao.findLikeidByLike(like);
    }

    /**
     * 取消收藏
     * @param likeid
     */
    @Override
    public void removLike(Integer likeid) {
        likeDao.remoLike(likeid);
    }
}
