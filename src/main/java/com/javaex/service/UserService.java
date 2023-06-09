package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDAO;
import com.javaex.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserDAO userDAO;
	
	public int userInsert(UserVO vo) {
		int cnt = userDAO.UserInsert(vo);
		return cnt;
	}
	
	public UserVO loginUser(UserVO vo) {
		return userDAO.loginUser(vo);
	}
	
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	
	public int userUpdate(UserVO vo) {
		return userDAO.userUpdate(vo);
	}
	
	public boolean idCheck(String id) {
		boolean bl = false;
		if(userDAO.getUser(id) == null) {
			bl = true;
		}
		return bl;
		
	}
}