package com.yoojung0318.Dailygram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoojung0318.Dailygram.common.EncryptUtils;
import com.yoojung0318.Dailygram.user.dao.UserDAO;
import com.yoojung0318.Dailygram.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email) {
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	// 아이디를 전달 받고 중복 여부를 알려주는 메소드 
	public boolean isDuplicate(String loginId) {
		// 일치하는 LoginID 개수 전달 받고,
		// 0일 경우 불일치
		// 그게 아닐경우 중복
		int count = userDAO.selectCountLoginId(loginId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public User getUser(String loginId, String password) {
	 	String encryptPassword = EncryptUtils.md5(password);
	 	return userDAO.selectUser(loginId, encryptPassword);
	}
	
	// id로 사용자 정보 조회 기능
	public User getUserById(int id) {
	
		return userDAO.selectUserByID(id);
	}
}
