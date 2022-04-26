package com.ezone.link.user.follow;

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

import com.ezone.link.user.follow.bo.FollowBO;

@RestController
@RequestMapping("/user/follow")
public class FollowRestController {
	
	@Autowired
	private FollowBO followBO;
	
	@PostMapping("/is_follow")
	public Map<String, String> followUser(
			@RequestParam("followeeId") int followeeId,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = followBO.followUser(userId, followeeId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}
		
		else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@GetMapping("/unfollow")
	public Map<String, String> unfollow(
			@RequestParam("followeeId") int followeeId,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = followBO.unfollow(userId, followeeId);
		
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
