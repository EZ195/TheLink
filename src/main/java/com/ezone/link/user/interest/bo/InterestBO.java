package com.ezone.link.user.interest.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.user.interest.dao.InterestDAO;
import com.ezone.link.user.interest.model.Interest;
import com.ezone.link.user.model.User;

@Service
public class InterestBO {
	
	@Autowired
	private InterestDAO interestDAO;
	
	public int addUserInterest(Interest interest) {
		
		User user = new User();
		
		int userId = user.getId();
		interest.setUserId(userId);
		
		return interestDAO.addUserInterest(interest);
	}
	
}
