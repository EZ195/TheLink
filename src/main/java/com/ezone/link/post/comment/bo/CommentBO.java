package com.ezone.link.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.post.comment.dao.CommentDAO;
import com.ezone.link.post.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(Comment comment) {
		return commentDAO.addComment(comment);
	}
	
	public List<Comment> showComment(int postId) {
		return commentDAO.showComment(postId);
	}
	
	public int updateComment() {
		return commentDAO.updateComment();
	}
	
	public int deleteComment() {
		return commentDAO.deleteComment();
	}

}
