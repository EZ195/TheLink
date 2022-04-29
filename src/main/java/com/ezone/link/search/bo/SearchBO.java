package com.ezone.link.search.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.post.model.Post;
import com.ezone.link.search.dao.SearchDAO;
import com.ezone.link.user.profile.model.Profile;
import com.ezone.link.user.userInterest.model.UserInterest;

@Service
public class SearchBO {
	@Autowired
	private SearchDAO searchDAO;
	
	public List<Post> getPostListByHashtag(String hashtag) {
		return searchDAO.getPostListByHashtag(hashtag);
	}
	public List<Integer> getUserListByHashtag(String hashtag) {
		return searchDAO.getUserListByHashtag(hashtag);
	}
	
	public List<Post> getPostListByKeyword(String keyword) {
		return searchDAO.getPostListByKeyword(keyword);
	}
	
	public List<Profile> getUserListByKeyword(String keyword) {
		return searchDAO.getUserListByKeyword(keyword);
	}

}
