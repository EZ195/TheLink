package com.ezone.link.user;

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

import com.ezone.link.user.bo.UserBO;
import com.ezone.link.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, String> signup(User user) {
		
		int count  = userBO.addUser(user);
		
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
		
		boolean isDuplicate = userBO.loginEmailIsDuplicate(loginEmail);
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("isDuplicate", isDuplicate);
		return result;
	}
	
	@GetMapping("/nickname_duplicate")
	public Map<String, Boolean> nicknameDuplicate(@RequestParam("nickname") String nickname) {
		
		boolean isDuplicate = userBO.nicknameIsDuplicate(nickname);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("isDuplicate", isDuplicate);
		
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, String> signin(
			@RequestParam("loginEmail") String loginEmail,
			@RequestParam("password") String password,
			HttpServletRequest request) {
				
		User user = userBO.getUser(loginEmail, password);

		Map<String, String> result = new HashMap<>();
		HttpSession session = request.getSession();
		
		if (user != null ) {
			result.put("result", "success");
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginEmail());
			session.setAttribute("userNickname", user.getNickname());
		}
		else {
			result.put("result", "fail");
		}
		return result;
	}
}
