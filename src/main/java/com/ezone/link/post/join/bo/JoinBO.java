package com.ezone.link.post.join.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.post.join.dao.JoinDAO;

@Service
public class JoinBO {
	
	@Autowired
	private JoinDAO joinDAO;
	
	public int participateIn(int postId, int userId, String userNickname) {
		return joinDAO.participateIn(postId, userId, userNickname);
	}
}
