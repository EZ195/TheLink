package com.ezone.link.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezone.link.post.model.Post;

@Repository
public interface PostDAO {
	
	public int addPost(Post post);

}