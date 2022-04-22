package com.ezone.link.post.join;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezone.link.post.bo.PostBO;
import com.ezone.link.post.join.bo.JoinBO;
import com.ezone.link.post.join.model.Join;
import com.ezone.link.post.model.Post;

@Controller
@RequestMapping("/post/join")
public class JoinController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private JoinBO joinBO;
	
	@GetMapping("/approve_list_view")
	public String approveListView(
			@RequestParam("postId") int postId,
			Model model) {
		
		int postWriter = postBO.getUserId(postId);
		
		List<Join> joinList = joinBO.getapplierList(postId);
		
		model.addAttribute("applierList",joinList);
		model.addAttribute("postId",postId);
		model.addAttribute("postWriter",postWriter);
		
		return "/post/approveList";
	}


}
