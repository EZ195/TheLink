package com.ezone.link.user.profile.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ezone.link.user.profile.model.Profile;

@Repository
public interface ProfileDAO {
	
	public int addUserProfile(
			@Param("userId") int userId,
			@Param("nickname") String nickname);
	
	public int nicknameIsDuplicate(@Param("nickname") String nickname);
	
	public int getProfileId(@Param("userId") int userId);
	
	public Profile getUserProfile(@Param("userId") int userId);
	
	public int updateUserProfile(
			@Param("userId") int userId,
			@Param("nickname") String nickname,
			@Param("introduce") String introduce,
			@Param("profileImagePath") String filePath);
	
	public String getNickname(
			@Param("userId") int userId);
	
	public List<Profile> getUserList(
			@Param("userId") int userId);
	
	public Profile getProfile(
			@Param("id") int userId);
	
	public List<Profile> getUserProfileList(@Param("userIdList") List<Integer> userId);
}
