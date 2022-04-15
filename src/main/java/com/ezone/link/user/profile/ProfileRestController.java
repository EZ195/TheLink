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
	
	@GetMapping("/profile_update")
	public Map<String, String> updateProfile(
			@RequestParam("introduce") String introduce,
			@RequestParam(value="profileImagePath" , required = false) MultipartFile file,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = profileBO.updateProfile(userId, introduce, file);
		
		
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
