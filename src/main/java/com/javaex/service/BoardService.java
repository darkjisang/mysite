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
		System.out.println("BoardService.list()");
		List<BoardVO> boardList = boardDAO.boardList();
		return boardList;
	}
	
	public int boardInsert(BoardVO vo) {
		System.out.println("BoardService.boardInsert()");
		int cnt = boardDAO.boardInsert(vo);
		return cnt;
	}
}