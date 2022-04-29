package com.ezone.link.search.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ezone.link.post.model.Post;
import com.ezone.link.user.profile.model.Profile;
import com.ezone.link.user.userInterest.model.UserInterest;

@Repository
public interface SearchDAO {
		
	// 해시태그로 게시글 찾기
	public List<Post> getPostListByHashtag(@Param("hashtag") String hashtag);
	
	// 해시태그로 사용자 찾기
	public List<Integer> getUserListByHashtag(@Param("hashtag") String hashtag);
	
	// 검색으로 게시글 찾기
	public List<Post> getPostListByKeyword(@Param("keyword") String keyword);
	
	// 검색으로 사용자 찾기
	public List<Profile> getUserListByKeyword(@Param("keyword") String keyword);
}
