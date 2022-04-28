package com.ezone.link.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezone.link.post.model.Post;
import com.ezone.link.search.bo.SearchBO;
import com.ezone.link.user.profile.model.Profile;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private SearchBO searchBO;
	
	@GetMapping("/search_view")
	public String searchView(
			@RequestParam("keyword") String keyword,
			Model model) {
		
		List<Post> postResult = searchBO.getPostListByKeyword(keyword);
		List<Profile> userResult = searchBO.getUserListByKeyword(keyword);
		
		model.addAttribute("postResult",postResult);
		model.addAttribute("userResult",userResult);
		
		return "/search/search";
	}

}
