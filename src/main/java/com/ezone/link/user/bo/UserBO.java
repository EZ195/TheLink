package com.ezone.link.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.user.dao.UserDAO;
import com.ezone.link.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(User user) {
		
		return userDAO.addUser(user);
		
	}

}
