package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession sqlsession;
	
	public List<BoardVO> boardList(){
		List<BoardVO> boardList = sqlsession.selectList("board.boardList");
		return boardList;
	}
	
	public int boardInsert(BoardVO vo) {
		int cnt = sqlsession.insert("board.boardInsert", vo);
		return cnt;
	}
	
	public BoardVO getBoard(int no) {
		BoardVO vo = sqlsession.selectOne("board.getBoard", no);
		System.out.println("BoardDAO.getBoard()");
		return vo;
	}
}