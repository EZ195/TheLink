package com.ezone.link.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ezone.link.user.model.User;

@Repository
public interface UserDAO {
	
	public int addUser(User user);
	public int loginEmailIsDuplicate(@Param("loginEmail") String loginEmail);
	public int nicknameIsDuplicate(@Param("nickname") String nickname);
	public User getUser(
			@Param("loginEmail") String loginEmail,
			@Param("password") String password);

}
