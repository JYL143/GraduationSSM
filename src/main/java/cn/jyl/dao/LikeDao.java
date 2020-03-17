package cn.jyl.dao;

import cn.jyl.daomain.Like;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LikeDao {

    /**
     * 添加收藏
     * @param like
     */
    void addLikes(Like like);

    /**
     * 查询登录用户所有的收藏 个人中心
     * @param username
     * @return
     */
    List<Like> findAllByUserName(String username);


    /**
     * 根据用户id和商品id查询收藏id
     * @param like
     * @return
     */
    Integer findLikeidByLike(Like like);

    /**
     * 取消收藏
     * @param likeid
     */
    void remoLike(Integer likeid);


}
