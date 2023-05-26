package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int UserInsert(UserVO vo) {
		int cnt = sqlSession.insert("user.UserInsert", vo);
		return cnt;
	}
	
	public UserVO loginUser(UserVO vo) {
		return sqlSession.selectOne("user.loginUser", vo);
	}
	
	public UserVO getUser(UserVO vo) {
		return sqlSession.selectOne("user.getUser", vo);
	}
	
	public int userUpdate(UserVO vo) {
		int cnt = sqlSession.update("user.userUpdate", vo);
		System.out.println("UserDAO.userUpdate()");
		return cnt;
	}
}