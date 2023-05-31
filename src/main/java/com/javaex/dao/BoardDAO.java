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
	
	public List<BoardVO> boardList(BoardVO vo){
		List<BoardVO> boardList = sqlsession.selectList("board.boardList", vo);
		return boardList;
	}
	
	public List<BoardVO> serchBoard(BoardVO vo){
		List<BoardVO> boardList = sqlsession.selectList("board.serchBoard",vo);
		return boardList;
	}
	
	public int boardInsert(BoardVO vo) {
		int cnt = sqlsession.insert("board.boardInsert", vo);
		return cnt;
	}
	
	public BoardVO getBoard(int no) {
		return sqlsession.selectOne("board.getBoard", no);
	}
	
	public void cntUpdate(int no) {
		sqlsession.update("board.cntUpdate", no);
	}
	
	public int boardUpdate(BoardVO vo) {
		System.out.println("BoardDAO.boardUpdate()");
		int cnt = sqlsession.update("board.boardUpdate", vo);
		return cnt;
	}
	
	public void boardDelete(int no) {
		sqlsession.delete("board.boardDelete", no);
	}
	
}