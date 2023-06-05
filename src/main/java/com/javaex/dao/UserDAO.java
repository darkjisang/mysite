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
		System.out.println("UserDAO" + vo);
		return sqlSession.selectOne("user.getUser", vo);
	}

	public UserVO getUser(String id) { 
		return sqlSession.selectOne("user.idCheck", id); 
	}

	public int userUpdate(UserVO vo) {
		return sqlSession.update("user.userUpdate", vo);
	}
}