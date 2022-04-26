package com.ezone.link.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ezone.link.post.comment.bo.CommentBO;
import com.ezone.link.post.comment.model.Comment;

@RestController
@RequestMapping("/post/comment")
public class CommentRestComtroller {
	
	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/create")
	public Map<String, String> createComment(
			Comment comment,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String userNickname = (String)session.getAttribute("userNickname");
		
		comment.setUserId(userId);
		comment.setUserNickname(userNickname);
		
		int count = commentBO.addComment(comment);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}
		
		else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@GetMapping("/update")
	public Map<String, String> updateComment(
			@RequestParam("postId") int postId,
			@RequestParam("comment") String comment,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = commentBO.updateComment(postId, userId, comment);
		
		Map<String, String> result = new HashMap<>();
		
		if (count == 1) { 
			result.put("result", "success");
		}
		else {
			result.put("result", "fail");
		}
		return result;
		
	}
	

}
