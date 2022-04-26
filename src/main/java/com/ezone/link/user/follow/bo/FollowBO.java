package com.ezone.link.user.follow.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.user.follow.dao.FollowDAO;

@Service
public class FollowBO {
	
	@Autowired
	private FollowDAO followDAO;
	
	public int followUser(int followerId, int followeeId) {
		return followDAO.followUser(followerId, followeeId);
	}
	
	public int followingCount(int followerId) {
		return followDAO.followingCount(followerId);
	}
	public int followerCount(int followeeId) {
		return followDAO.followerCount(followeeId); 
	}
	
	public boolean isFollowing(int followerId, int followeeId) {
		int count = followDAO.isFollowing(followerId, followeeId);
		
		if (count == 1) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public int unfollow(int followerId, int followeeId) {
		return followDAO.unfollow(followerId, followeeId);
	}

}
