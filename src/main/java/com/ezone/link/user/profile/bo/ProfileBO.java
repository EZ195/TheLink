package com.ezone.link.user.profile.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.user.profile.dao.ProfileDAO;
import com.ezone.link.user.profile.model.Profile;

@Service
public class ProfileBO {
	
	@Autowired
	private ProfileDAO profileDAO;
	
	public int addUserProfile(int userId, String userNickname) {
		return profileDAO.addUserProfile(userId, userNickname);
	}
	
	public Profile getUserProfile(int userId) {
		return profileDAO.getUserProfile(userId);
	}
}
