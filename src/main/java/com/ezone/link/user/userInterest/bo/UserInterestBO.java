package com.ezone.link.user.userInterest.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.user.userInterest.dao.UserInterestDAO;

@Service
public class UserInterestBO {
	
	@Autowired
	private UserInterestDAO userInterestDAO;
	
	public int addUserInterest (int userId, List<String> userInteret) {
		return userInterestDAO.addUserInterest(userId, userInteret);
	}
	
	public List<String> getUserInterest (int userId) {
		return userInterestDAO.getUserInterest(userId);
	}

}
