package com.ezone.link.user.profile;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.ezone.link.user.follow.bo.FollowBO;
import com.ezone.link.user.profile.bo.ProfileBO;
import com.ezone.link.user.profile.model.Profile;
import com.ezone.link.user.profile.model.ProfileJoinPost;
import com.ezone.link.user.userInterest.bo.UserInterestBO;

@Controller
@RequestMapping("/user/profile")
public class ProfileController {
	
	@Autowired
	private ProfileBO profileBO;
	
	@Autowired
	private FollowBO followBO;
	
	@Autowired
	private UserInterestBO userInterestBO;
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private JoinBO joinBO;
	
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
		List<String> userInterest = new ArrayList<>();
		
		List<ProfileJoinPost> joinedList = new ArrayList<>();
		
		if(id == userId) {
			userProfile = profileBO.getUserProfile(userId);
			followingCnt = followBO.followingCount(userId);
			followerCnt = followBO.followerCount(userId);
			userInterest = userInterestBO.getUserInterest(userId);
			joinedList = postBO.userJoinedPostList(userId);
		}
		
		else if (id != userId) {
			userProfile = profileBO.getUserProfile(id);
			followingCnt = followBO.followingCount(id);
			followerCnt = followBO.followerCount(id);
			userInterest = userInterestBO.getUserInterest(id);
			joinedList = postBO.userJoinedPostList(id);
		}
		
		List<Post> postList = postBO.getPostList();
		
		model.addAttribute("userProfile",userProfile);
		model.addAttribute("followingCnt",followingCnt);
		model.addAttribute("followerCnt",followerCnt);
		model.addAttribute("isFollowing",isFollowing);
		model.addAttribute("userInterest",userInterest);
		model.addAttribute("postList",postList);
		model.addAttribute("joinedList",joinedList);
		
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
