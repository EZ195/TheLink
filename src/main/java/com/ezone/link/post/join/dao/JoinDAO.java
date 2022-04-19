package com.ezone.link.post.join.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface JoinDAO {
	
	public int participateIn(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public int getUserId(
			@Param("postId") int postId,
			@Param("userId") int userId);
}
