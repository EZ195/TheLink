package com.ezone.link.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.common.EncryptUtills;
import com.ezone.link.user.dao.UserDAO;
import com.ezone.link.user.model.User;
import com.ezone.link.user.profile.bo.ProfileBO;
import com.ezone.link.user.userInterest.bo.UserInterestBO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private UserInterestBO userInterestBO;
	
	@Autowired
	private ProfileBO profileBO;
	
	public int addUser(
			String loginEmail,
			String password,
			String nickname,
			int birthYear,
			int birthMonth,
			int birthDay,
			String gender,
			List<String> userInterest) {
		
		String encryptPw = EncryptUtills.md5(password);

		User user = new User();
		user.setLoginEmail(loginEmail);
		user.setPassword(encryptPw);
		user.setBirthYear(birthYear);
		user.setBirthMonth(birthMonth);
		user.setBirthDay(birthDay);
		user.setGender(gender);
		
		userDAO.addUser(user);
		int userId = user.getId();
		userInterestBO.addUserInterest(userId, userInterest);
		
		return profileBO.addUserProfile(userId, nickname);
	}
	
	public boolean loginEmailIsDuplicate(String loginEmail) {
		int count = userDAO.loginEmailIsDuplicate(loginEmail);
		
		if(count == 0) {
			return false;
		}
		else {
			return true;
		}
	}
	
	public User getUser(String loginEmail, String password) {
		
		String encryptPw = EncryptUtills.md5(password);
				
		return userDAO.getUser(loginEmail, encryptPw);
	}
}
