package com.ezone.link.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.common.EncryptUtills;
import com.ezone.link.user.dao.UserDAO;
import com.ezone.link.user.interest.bo.InterestBO;
import com.ezone.link.user.interest.model.Interest;
import com.ezone.link.user.model.User;
import com.ezone.link.user.profile.bo.ProfileBO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private InterestBO interestBO;
	
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
			String userInterest) {
		
		String encryptPw = EncryptUtills.md5(password);

		User user = new User();
		user.setLoginEmail(loginEmail);
		user.setPassword(encryptPw);
		user.setNickname(nickname);
		user.setBirthYear(birthYear);
		user.setBirthMonth(birthMonth);
		user.setBirthDay(birthDay);
		user.setGender(gender);
		
		userDAO.addUser(user);
		int userId = user.getId();
		interestBO.addUserInterest(userId, userInterest);
		
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
	public boolean nicknameIsDuplicate(String nickname) {
		int count = userDAO.nicknameIsDuplicate(nickname);
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
