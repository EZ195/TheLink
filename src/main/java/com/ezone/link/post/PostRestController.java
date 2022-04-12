package com.ezone.link.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezone.link.post.bo.PostBO;
import com.ezone.link.post.model.Post;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, String> createPost(
			Post post,
			HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String userNickname = (String)session.getAttribute("userNickname");
		post.setUserId(userId);
		post.setUserNickname(userNickname);
		
		int count = postBO.addPost(post);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}
		else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	

}
