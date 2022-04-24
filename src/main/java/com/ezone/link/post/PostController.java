package com.ezone.link.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezone.link.post.bo.PostBO;
import com.ezone.link.post.comment.bo.CommentBO;
import com.ezone.link.post.comment.model.Comment;
import com.ezone.link.post.join.bo.JoinBO;
import com.ezone.link.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private JoinBO joinBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@GetMapping("/create_view")
	public String createView() {
		return "/post/postForm";
	}
	
	@GetMapping("/timeline_view")
	public String timelineView(Model model) {
		
		List<Post> postList = postBO.getPostList();
		model.addAttribute("postList", postList);
		
		return "/post/timeline";
	}
	
	@GetMapping("/detail_view")
	public String detailView(
			@RequestParam("id") int id,
			HttpServletRequest request,
			Model model) {
		
		Post post = postBO.getPostDetail(id);
		
		List<Comment> commentList = commentBO.showComment(id);
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		boolean isChecked = joinBO.ischeckedApply(id, userId);
		
		model.addAttribute("postDetail",post);
		model.addAttribute("isChecked",isChecked);
		model.addAttribute("commentList",commentList);
		
		return "/post/postDetail";
		
	}
	
	@GetMapping("/update_view")
	public String updateView(
			@RequestParam("id") int id,
			Model model) {
		
		Post post = postBO.getPostDetail(id);
		
		model.addAttribute("postUpdate",post);
		
		return "/post/postUpdate";
		
	}
	

}
