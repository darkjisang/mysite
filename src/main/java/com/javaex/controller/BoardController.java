package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.BoardService;
import com.javaex.vo.BoardVO;

@Controller
@RequestMapping(value = "/board", method = {RequestMethod.GET, RequestMethod.POST})
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardVO boardVO;
	
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model) {
		List<BoardVO> boardList = boardService.boardList();
		model.addAttribute("boardList", boardList);
		return "/board/boardList";
	}
	
	@RequestMapping(value = "/writeForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeForm() {
		return "/board/writeForm";
	}
	
	@RequestMapping(value = "/boardInsert", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardInsert(@ModelAttribute BoardVO vo) {
		if(boardService.boardInsert(vo) > 0) {
			System.out.println("Insert 성공");
			return "redirect:/board/list";
		}else {
			return "/board/writeForm";
		}
	}
	
	public String getBoard() {
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}