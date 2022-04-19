package com.ezone.link.post.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ezone.link.post.model.Post;

@Repository
public interface PostDAO {
	
	public int addPost(Post post);
	
	public List<Post> getPostList();
	
	public Post getPostDetail(
			@Param("id") int id);
	
	public int postUpdate(
			@Param("postId") int id,
			@Param("title") String title,
			@Param("content") String content,
			@Param("meetingDate") Date meetingDate,
			@Param("headcount") int headcount);
	
	public int postDelete(@Param("postId") int id);

}
