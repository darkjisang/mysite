package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.GuestBookDAO;
import com.javaex.vo.GuestBookVO;

@Service
public class GuestBookService {
	@Autowired
	private GuestBookDAO guestBookDAO;
	@Autowired
	private GuestBookVO guestBookVO;
	
	public List<GuestBookVO> getBoardList(){
		List<GuestBookVO> getBoardList = guestBookDAO.getBoardList();
		return getBoardList;
	}
	
	public GuestBookVO getBoard(int no) {
		guestBookVO = guestBookDAO.getBoard(no);
		return guestBookVO;
	}
	
	public int boardInsert(GuestBookVO vo) {
		int cnt = guestBookDAO.boardInsert(vo);
		return cnt;
	}
	
	public int boardDelete(GuestBookVO vo) {
		int cnt = guestBookDAO.boardDelete(vo);
		return cnt;
	}
}