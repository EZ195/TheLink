package com.ezone.link.post.join;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/post/join")
public class JoinRestController {
	
	@PostMapping("/participate")
	public Map<String, String> participate(
			@RequestParam("postId") int postId,
			@RequestParam("userId") int userId,
			@RequestParam("userNickname") String userNickname) {
		
		Map<String, String> result = new HashMap<>();
		
		return result;
	}
}
