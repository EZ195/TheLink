package com.ezone.link.search.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ezone.link.post.model.Post;
import com.ezone.link.user.profile.model.Profile;

@Repository
public interface SearchDAO {
		
	// 해시태그로 게시글 찾기
	public List<Post> getPostListByHashtag(String keyword);
	
	// 해시태그로 사용자 찾기
	public List<Profile> getUserListByHashtag(String keyword);
	
	// 검색으로 게시글 찾기
	public List<Post> getPostListByKeyword(String keyword);
	
	// 검색으로 사용자 찾기
	public List<Profile> getUserListByKeyword(String keyword);
}
