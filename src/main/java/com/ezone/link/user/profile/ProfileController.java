package com.ezone.link.user.profile;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezone.link.user.follow.bo.FollowBO;
import com.ezone.link.user.profile.bo.ProfileBO;
import com.ezone.link.user.profile.model.Profile;

@Controller
@RequestMapping("/user/profile")
public class ProfileController {
	
	@Autowired
	private ProfileBO profileBO;
	
	@Autowired
	private FollowBO followBO;
	
	@GetMapping("/profile_view")
	public String profileView(
			@RequestParam("id") int id,
			HttpServletRequest request,
			Model model) {

		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Profile userProfile = new Profile();
		int followingCnt = 0;
		int followerCnt = 0;
		boolean isFollowing = followBO.isFollowing(userId, id);
		
		if(id == userId) {
			userProfile = profileBO.getUserProfile(userId);
			followingCnt = followBO.followingCount(userId);
			followerCnt = followBO.followerCount(userId);
		}
		
		else if (id != userId) {
			userProfile = profileBO.getUserProfile(id);
			followingCnt = followBO.followingCount(id);
			followerCnt = followBO.followerCount(id);
		}
		
		model.addAttribute("userProfile",userProfile);
		model.addAttribute("followingCnt",followingCnt);
		model.addAttribute("followerCnt",followerCnt);
		model.addAttribute("isFollowing",isFollowing);
		
		return "/user/profile/profile";
	}
	
	@GetMapping("/update_view")
	public String updateView(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Profile userProfile = profileBO.getUserProfile(userId);
		
		model.addAttribute("userProfile",userProfile);
		
		return "/user/profile/profileUpdate";
	}

}
