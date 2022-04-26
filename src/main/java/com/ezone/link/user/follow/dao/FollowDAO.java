package com.ezone.link.user.follow.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FollowDAO {
	
	public int followUser(
			@Param("followerId") int followerId,
			@Param("followerNickname") String followerNickname,
			@Param("followeeId") int followeeId,
			@Param("followeeNickname") String followeeNickname);
	
	public int followingCount(@Param("followerId") int followerId);
	public int followerCount(@Param("followeeId") int followeeId);
	public int isFollowing(
			@Param("followerId") int followerId,
			@Param("followeeId") int followeeId);
	public int unfollow(
			@Param("followerId") int followerId,
			@Param("followeeId") int followeeId);
	
	public int updateFollowerNickname(
			@Param("followerId") int followerId,
			@Param("followerNickname") String followerNickname);
	public int updateFolloweeNickname(
			@Param("followeeId") int followeeId,
			@Param("followeeNickname") String followeeNickname);
}
