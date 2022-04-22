package com.ezone.link.post.join.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ezone.link.post.join.model.Join;

@Repository
public interface JoinDAO {
	
	public int participateIn(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public int deleteParticipate(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public int checkApply(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public List<Join> getApplierList(
			@Param("postId") int postId);
	
	public int approve(
			@Param("postId") int postId,
			@Param("userId") int userId);
}
