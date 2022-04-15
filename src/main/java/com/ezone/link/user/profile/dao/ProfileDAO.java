package com.ezone.link.user.profile.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ezone.link.user.profile.model.Profile;

@Repository
public interface ProfileDAO {
	
	public int addUserProfile(
			@Param("userId") int userId,
			@Param("userNickname") String userNickname);
	
	public Profile getUserProfile(@Param("userId") int userId);
	
	public int updateUserProfile(
			@Param("userId") int userId,
			@Param("introduce") String introduce,
			@Param("profileImagePath") String filePath);
}
