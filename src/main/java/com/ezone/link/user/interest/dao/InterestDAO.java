package com.ezone.link.user.interest.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ezone.link.user.interest.model.Interest;

@Repository
public interface InterestDAO {
	
	public int addUserInterest(
			@Param("userId") int userId,
			@Param("userInterest") String userInterest);

}
