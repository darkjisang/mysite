package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GuestBookVO;

@Repository
public class GuestBookDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<GuestBookVO> getBoardList(){
		List<GuestBookVO> list = sqlSession.selectList("guestbook.getlist");
		return list;
	}
	
	public GuestBookVO getBoard(int no) {
		GuestBookVO vo = sqlSession.selectOne("guestbook.getBoard", no);
		return vo;
	}
	
	public int boardInsert(GuestBookVO vo) {
		int cnt = sqlSession.insert("guestbook.insert", vo);
		return cnt;
	}
	
	public int boardDelete(GuestBookVO vo) {
		int cnt = sqlSession.delete("guestbook.delete", vo);
		return cnt;
	}
}
