package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BoardDAO;
import com.javaex.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardVO> boardList(){
		List<BoardVO> boardList = boardDAO.boardList();
		return boardList;
	}
	
	public int boardInsert(BoardVO vo) {
		int cnt = boardDAO.boardInsert(vo);
		return cnt;
	}
	
	public BoardVO cntBoard(int no) {
		System.out.println("BoardService.getBoard()");
		boardDAO.cntUpdate(no);
		return boardDAO.getBoard(no);
	}
	
	public BoardVO getBoard(int no) {
		System.out.println("BoardService.getBoard()");
		return boardDAO.getBoard(no);
	}
}