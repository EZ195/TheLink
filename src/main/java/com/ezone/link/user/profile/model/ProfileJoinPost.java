package com.ezone.link.user.profile.model;

import com.ezone.link.post.model.Post;

public class ProfileJoinPost {
	
	private Post post;
	private String statement;

	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public String getStatement() {
		return statement;
	}
	public void setStatement(String statement) {
		this.statement = statement;
	}

}
