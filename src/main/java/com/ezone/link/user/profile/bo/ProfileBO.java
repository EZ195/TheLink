package com.ezone.link.user.profile.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.user.profile.dao.ProfileDAO;

@Service
public class ProfileBO {
	
	@Autowired
	private ProfileDAO profileDAO;
	
	public int addProfile(int userId, String userNickname) {
		return profileDAO.addProfile(userId, userNickname);
	}

}
