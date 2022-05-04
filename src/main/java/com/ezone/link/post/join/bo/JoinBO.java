package com.ezone.link.post.join.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.post.join.dao.JoinDAO;
import com.ezone.link.post.join.model.Join;

@Service
public class JoinBO {
	
	@Autowired
	private JoinDAO joinDAO;
	
	public int participateIn(int postId, int userId, String userNickname) {
		return joinDAO.participateIn(postId, userId, userNickname);
	}
	
	public int deleteParticipate(int postId, int userId) {
		return joinDAO.deleteParticipate(postId, userId);
	}
	
	public boolean ischeckedApply(int postId, int userId) {
		
		int count = joinDAO.checkApply(postId, userId);
		
		if(count == 1) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public List<Join> getapplierList(int postId) {
		
		return joinDAO.getApplierList(postId);
	}
	
	public int approve(int postId, int userId) {
		return joinDAO.approve(postId, userId);
	}
	
	public int updateUserNickname(int userId, String userNickname) {
		return joinDAO.updateUserNickname(userId, userNickname);
	}
	
	public List<Join> joinList(int userId) {
		return joinDAO.joinList(userId);
	}
	
}
