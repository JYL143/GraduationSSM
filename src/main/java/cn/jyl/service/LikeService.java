package cn.jyl.service;

import cn.jyl.daomain.Like;

import java.util.List;

public interface LikeService {


    //添加收藏
    void addLikes(Like like);

    //查询登录用户所有的收藏 个人中心
    List<Like> findAllByUserName(String username);

    //根据用户id和商品id查询收藏id
    Integer findLikeidByLike(Like like);

    //根据收藏id取消收藏
    void removLike(Integer likeid);
}
