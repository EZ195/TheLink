package com.ezone.link.search;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezone.link.post.model.Post;
import com.ezone.link.search.bo.SearchBO;
import com.ezone.link.user.bo.UserBO;
import com.ezone.link.user.model.User;
import com.ezone.link.user.profile.bo.ProfileBO;
import com.ezone.link.user.profile.model.Profile;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private SearchBO searchBO;
	
	@Autowired
	private ProfileBO profileBO;
	
	@GetMapping("/search_view")
	public String searchView(
			@RequestParam("keyword") String keyword,
			Model model) {
		
		List<Integer> userId = searchBO.getUserListByHashtag(keyword);
		
		List<Post> postResult = searchBO.getPostListByKeyword(keyword);
		List<Post> postHashtagResult = searchBO.getPostListByHashtag(keyword);
		
		for(Post post1:postHashtagResult) {
			for(Post post2:postResult) {
				if(post1.getId() == post2.getId()) {
					postHashtagResult.remove(post1);
				}
			}
		}
		
		for(Post post:postHashtagResult) {
			postResult.add(post);
		}
		
		List<Profile> userResult = searchBO.getUserListByKeyword(keyword);
		List<Profile> userHashtagResult = null;
		
		if (userId.size() > 0) {
			userHashtagResult = profileBO.getUserProfileList(userId);
			
			for(Profile profile1:userHashtagResult) {
				for(Profile profile2:userResult) {
					if(profile1.getUserId() == profile2.getUserId()) {
						userHashtagResult.remove(profile1);
					}
				}
			}
			
			for(Profile profile:userHashtagResult) {
				userResult.add(profile);				
			}
			
		}
		
		
		
		model.addAttribute("postResult",postResult);
		model.addAttribute("userResult",userResult);
		model.addAttribute("postHashtagResult",postHashtagResult);
		model.addAttribute("userHashtagResult",userHashtagResult);
		
		return "/search/search";
	}

}
