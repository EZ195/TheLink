package com.ezone.link.user.profile;

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
import org.springframework.web.multipart.MultipartFile;

import com.ezone.link.user.profile.bo.ProfileBO;

@RestController
@RequestMapping("/user/profile")
public class ProfileRestController {
	
	@Autowired
	private ProfileBO profileBO;
	
	@GetMapping("/nickname_duplicate")
	public Map<String, Boolean> nicknameDuplicate(@RequestParam("nickname") String nickname) {
		
		boolean isDuplicate = profileBO.nicknameIsDuplicate(nickname);
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("isDuplicate", isDuplicate);
		
		return result;
	}
	
	@PostMapping("/profile_update")
	public Map<String, String> updateProfile(
			@RequestParam("nickname") String nickname,
			@RequestParam("introduce") String introduce,
			@RequestParam(value="profileImagePath" , required = false) MultipartFile file,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = profileBO.updateProfile(userId, nickname, introduce, file);
		
		System.out.println(nickname);
		System.out.println(introduce);
		

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
