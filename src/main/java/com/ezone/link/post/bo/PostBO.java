package com.ezone.link.post.bo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezone.link.post.dao.PostDAO;
import com.ezone.link.post.join.bo.JoinBO;
import com.ezone.link.post.join.model.Join;
import com.ezone.link.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private JoinBO joinBO;
	
	public int addPost(Post post) {
		return postDAO.addPost(post);
	}
	
	public List<Post> getPostList() {
		return postDAO.getPostList();
	}
	
	public Post getPostDetail(int id) {
		return postDAO.getPostDetail(id);
	}
	
	public int postUpdate(int id, String title, String content, Date meetingDate, int headcount) {
		return postDAO.postUpdate(id, title, content, meetingDate, headcount);  
	}
	
	public int postDelete(int id) {
		return postDAO.postDelete(id);
	}
	
	public int getUserId(int id) {
		return postDAO.getUserId(id);
	}
	
	public int updateUserNickname(int userId, String userNickname) {
		return postDAO.updateUserNickname(userId, userNickname);
	}
	
	public List<Post> userJoinedPostList(int userId) {
		
		List<Join> joinList = joinBO.joinList(userId);
		List<Post> joinedPostList = new ArrayList<>();
		for(Join join: joinList) {
			int postId = join.getPostId();
			Post post =  postDAO.userJoinedPostList(postId);
			joinedPostList.add(post);
		}
		
		return joinedPostList;
	}
		
}
