package com.ezone.link.user.dao;

import org.springframework.stereotype.Repository;

import com.ezone.link.user.model.User;

@Repository
public interface UserDAO {
	
	public int addUser(User user);

}
