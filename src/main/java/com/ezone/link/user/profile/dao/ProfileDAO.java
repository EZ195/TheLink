package com.ezone.link.user.profile.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProfileDAO {
	
	public int addProfile(
			@Param("userId") int userId,
			@Param("userNickname") String userNickname);
	

}
