package com.ezone.link.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ezone.link.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int addComment(Comment comment);
	
	public List<Comment> showComment(
			@Param("postId") int postId);
	
	public int updateComment(
			@Param("postId") int postId,
			@Param("userId") int userId,
			@Param("comment") String comment);
	
	public int deleteComment();
	
	public int updateUserNickname(
			@Param("userId") int userId,
			@Param("userNickname") String userNickname);

}
