package com.ezone.link.user.interest.dao;

import org.springframework.stereotype.Repository;

import com.ezone.link.user.interest.model.Interest;

@Repository
public interface InterestDAO {
	
	public int addUserInterest(Interest interest);

}
