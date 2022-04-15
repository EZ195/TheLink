package com.ezone.link.user.profile.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezone.link.common.FileManagerService;
import com.ezone.link.user.bo.UserBO;
import com.ezone.link.user.profile.dao.ProfileDAO;
import com.ezone.link.user.profile.model.Profile;

@Service
public class ProfileBO {
	
	@Autowired
	private ProfileDAO profileDAO;
	
	@Autowired
	private UserBO userBO;
	
	
	public int addUserProfile(int userId, String userNickname) {
		return profileDAO.addUserProfile(userId, userNickname);
	}
	
	public Profile getUserProfile(int userId) {
		return profileDAO.getUserProfile(userId);
	}
	
	public int updateProfile(int userId, String userNickname, String introduce, MultipartFile file) {
		
		String filepath = FileManagerService.saveFile(userId, file);
		
		profileDAO.updateUserProfile(userId, introduce, filepath);
		
		return userBO.updateUserNickname(userId, userNickname);
	}
}
