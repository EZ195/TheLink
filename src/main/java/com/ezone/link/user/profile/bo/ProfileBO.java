package com.ezone.link.user.profile.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezone.link.common.FileManagerService;
import com.ezone.link.post.bo.PostBO;
import com.ezone.link.post.comment.bo.CommentBO;
import com.ezone.link.post.join.bo.JoinBO;
import com.ezone.link.post.join.model.Join;
import com.ezone.link.post.model.Post;
import com.ezone.link.search.bo.SearchBO;
import com.ezone.link.user.follow.bo.FollowBO;
import com.ezone.link.user.profile.dao.ProfileDAO;
import com.ezone.link.user.profile.model.Profile;
import com.ezone.link.user.profile.model.ProfileJoinPost;

@Service
public class ProfileBO {
	
	@Autowired
	private ProfileDAO profileDAO;
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private JoinBO joinBO;
	
	@Autowired
	private FollowBO followBO;
	
	@Autowired
	private SearchBO searchBO;
	
	public int addUserProfile(int userId, String nickname) {
		return profileDAO.addUserProfile(userId, nickname);
	}
	
	public boolean nicknameIsDuplicate(String nickname) {
		int count = profileDAO.nicknameIsDuplicate(nickname);
		if(count == 0) {
			return false;
		}
		else {
			return true;
		}
	}
	
	public int getProfileId(int userId) {		
		return profileDAO.getProfileId(userId);
	}
	
	public Profile getUserProfile(int userId) {
		return profileDAO.getUserProfile(userId);
	}
	
	public int updateProfile(int userId, String nickname, String introduce, MultipartFile file) {
		
		Profile profile = this.getUserProfile(userId);
		String filepath = "";
		
		// 이미지 수정 없는 경우
		if (file == null) {
			filepath = profile.getProfileImagePath();
		}
		
		// 기존 이미지 파일이 없는 경우
		else if (profile.getProfileImagePath() == null) {
			filepath = FileManagerService.saveFile(userId, file);
		}
		
		// 기존 이미지에서 새로운 이미지로 변경하는 경우
		else {
			FileManagerService.removeFile(profile.getProfileImagePath());
			filepath = FileManagerService.saveFile(userId, file);
		}
		
		postBO.updateUserNickname(userId, nickname);
		commentBO.updateUserNickname(userId, nickname);
		joinBO.updateUserNickname(userId, nickname);
		followBO.updateFollowerNickname(userId, nickname);
		followBO.updateFolloweeNickname(userId, nickname);
		
		return profileDAO.updateUserProfile(userId, nickname, introduce, filepath);
	}
	
	public String getNickname(int userId) {
		return profileDAO.getNickname(userId);
	}
	
	public List<Profile> getUserList(int userId) {
		return profileDAO.getUserList(userId);
	}
	
	public Profile getProfile(int id) {
		
		Profile profile = new Profile();
		profile.setId(id);
		
		return profileDAO.getProfile(id);
	}
	
	public List<Profile> getUserProfileList(List<Integer> userId) {
		
		return profileDAO.getUserProfileList(userId);
		
	}
}
