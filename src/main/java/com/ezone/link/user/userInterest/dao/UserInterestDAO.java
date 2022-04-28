package com.ezone.link.user.userInterest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserInterestDAO {
	
	public int addUserInterest(
			@Param("userId") int userId,
			@Param("userInterest") List<String> userInterest);
	
	public List<String> getUserInterest(@Param("userId") int userId);

}
