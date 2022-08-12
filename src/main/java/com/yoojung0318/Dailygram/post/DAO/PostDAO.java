package com.yoojung0318.Dailygram.post.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yoojung0318.Dailygram.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userid
			,@Param("content") String content
			,@Param("imagePath")String imagePath);
	
	
	public List<Post> selectPostList();
}