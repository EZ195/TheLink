package com.ezone.link;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ezone.link.user.bo.UserBO;
import com.ezone.link.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, String> signup(User user) {
		
		int count = userBO.addUser(user);
		System.out.println(count);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}
		else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@GetMapping("/loginEmail_duplicate")
	public Map<String, Boolean> loginEmailDuplicate(@RequestParam("loginEmail") String loginEmail) {
		
		boolean is_duplicate = userBO.loginEmailIsDuplicate(loginEmail);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("is_duplicate", is_duplicate);
		
		return result;
	}
	
	@GetMapping("/nickname_duplicate")
	public Map<String, Boolean> nicknameDuplicate(@RequestParam("nickname") String nickname) {
		
		boolean is_duplicate = userBO.nicknameIsDuplicate(nickname);
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("is_duplicate", is_duplicate);
		
		return result;
	}

}
