package com.ezone.link.post.join;

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

import com.ezone.link.post.join.bo.JoinBO;

@RestController
@RequestMapping("/post/join")
public class JoinRestController {
	
	@Autowired
	private JoinBO joinBO;
	
	@PostMapping("/participate")
	public Map<String, String> participate(
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = joinBO.participateIn(postId, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}
		
		else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@GetMapping("/cancel")
	public Map<String,String> cancelParticipate(
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = joinBO.deleteParticipate(postId, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}
		else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/approve")
	public Map<String, String> approve(
			@RequestParam("postId") int postId,
			@RequestParam("userId") int userId){
		
		int count = joinBO.approve(postId, userId);
		
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
