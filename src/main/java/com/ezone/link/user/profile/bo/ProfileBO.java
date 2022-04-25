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
	
	public int addUserProfile(int userId, String nickname) {
		return profileDAO.addUserProfile(userId, nickname);
	}
	
	public boolean nicknameIsDuplicate(String nickname) {
		int count = profileDAO.nicknameIsDuplicate(nickname);
		if(count == 0) {
			return false;
		}
		else {
			return true;
		}
	}
	
	public Profile getUserProfile(int userId) {
		return profileDAO.getUserProfile(userId);
	}
	
	public int updateProfile(int userId, String nickname, String introduce, MultipartFile file) {
		
		Profile profile = this.getUserProfile(userId);
		String filepath = "";
		
		if (file == null) {
			filepath = profile.getProfileImagePath();
		}
		
		else {
			FileManagerService.removeFile(profile.getProfileImagePath());
			filepath = FileManagerService.saveFile(userId, file);
		}
		
		return profileDAO.updateUserProfile(userId, nickname, introduce, filepath);
	}
	
	public String getNickname(int userId) {
		return profileDAO.getNickname(userId);
	}
}
