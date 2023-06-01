package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BoardDAO;
import com.javaex.vo.BoardVO;
import com.javaex.vo.Criteria;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardVO> boardList(Criteria cri){
		List<BoardVO> boardList = boardDAO.boardList(cri);
		return boardList;
	}

	public List<BoardVO> serchBoard(BoardVO vo){
		List<BoardVO> boardList = boardDAO.serchBoard(vo);
		return boardList;
	}
	
	public int boardInsert(BoardVO vo) {
		int cnt = boardDAO.boardInsert(vo);
		return cnt;
	}
	
	public BoardVO cntBoard(int no) {
		boardDAO.cntUpdate(no);
		return boardDAO.getBoard(no);
	}
	
	public BoardVO getBoard(int no) {
		return boardDAO.getBoard(no);
	}
	
	public int boardUpdate(BoardVO vo) {
		int cnt = boardDAO.boardUpdate(vo);
		return cnt;
	}
	
	public void boardDelete(int no) {
		boardDAO.boardDelete(no);
	}
	
	public int getTotal(Criteria cri) {
		return boardDAO.getTotal(cri);
	}
}