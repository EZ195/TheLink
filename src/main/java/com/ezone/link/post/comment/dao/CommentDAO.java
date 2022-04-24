package com.ezone.link.post.comment.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ezone.link.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int addComment(Comment comment);
	
	public List<Comment> showComment();
	
	public int updateComment();
	
	public int deleteComment();

}
