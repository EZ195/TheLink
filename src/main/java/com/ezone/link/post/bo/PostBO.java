package com.ezone.link.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.post.dao.PostDAO;
import com.ezone.link.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(Post post) {
		return postDAO.addPost(post);
	}
	
	public detailPost() {
		
	}

}
