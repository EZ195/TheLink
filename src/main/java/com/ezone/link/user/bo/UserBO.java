package com.ezone.link.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.common.EncryptUtills;
import com.ezone.link.user.dao.UserDAO;
import com.ezone.link.user.interest.bo.InterestBO;
import com.ezone.link.user.interest.model.Interest;
import com.ezone.link.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private InterestBO interestBO;

	
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

		userDAO.addUser();
		
		return interestBO.addUserInterest(null);
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
