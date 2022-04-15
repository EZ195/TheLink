package com.ezone.link.user.interest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



@Repository
public interface InterestDAO {
	
	public int addUserInterest(
			@Param("userId") int userId,
			@Param("userInterest") List<String> userInterest);
}
