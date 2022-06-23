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
		
		// 추후에 BO에 코드를 정리할 예정
		
		// 게시글 검색
		Iterator<Post> iter = postHashtagResult.iterator();
		while (iter.hasNext()) {
			Post post1 = iter.next();
			for(Post post2:postResult) {
				if(post1.getId() == post2.getId()) {
					iter.remove();
				}
			}
		}
		
		for(Post post:postHashtagResult) {
			postResult.add(post);
		}
		
		// 사용자 검색
		List<Profile> userResult = searchBO.getUserListByKeyword(keyword);
		List<Profile> userHashtagResult = null;
		
		if (userId.size() > 0) {
			userHashtagResult = profileBO.getUserProfileList(userId);
			
			Iterator<Profile> iterUser = userHashtagResult.iterator();
			while (iterUser.hasNext()) {
				Profile profile1 = iterUser.next();
				for(Profile profile2:userResult) {
					if(profile1.getUserId() == profile2.getUserId()) {
						iterUser.remove();
					}
				}
			}
			
			for(Profile profile:userHashtagResult) {
				userResult.add(profile);				
			}
			
		}
		
	
		model.addAttribute("postResult",postResult);
		model.addAttribute("userResult",userResult);
		
		return "/search/search";
	}

}
