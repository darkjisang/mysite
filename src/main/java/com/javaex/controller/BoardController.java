package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.dto.PageMakerDTO;
import com.javaex.service.BoardService;
import com.javaex.vo.BoardVO;
import com.javaex.vo.Criteria;

@Controller
@RequestMapping(value = "/board", method = {RequestMethod.GET, RequestMethod.POST})
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardVO boardVO;
	
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model, Criteria cri) {
		List<BoardVO> boardList = boardService.boardList(cri);
		model.addAttribute("boardList", boardList);
		int total = boardService.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(total, cri);
		model.addAttribute("pageMake", pageMake);
		return "/board/boardList";
	}
	
	@RequestMapping(value = "/serchBoard", method = {RequestMethod.GET, RequestMethod.POST})
	public String serchBoard(Model model, @ModelAttribute BoardVO vo) {
		List<BoardVO> boardList = boardService.serchBoard(vo);
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
			System.out.println("Insert 실패");
			return "/board/writeForm";
		}
	}
	
	@RequestMapping(value = "/read/{no}", method = {RequestMethod.GET, RequestMethod.POST})
	public String getBoard(@PathVariable("no") int no, Model model) {
		boardVO = boardService.cntBoard(no);
		model.addAttribute("boardList", boardVO);
		return "/board/read";
	}
	
	@RequestMapping(value = "/modifyForm/{no}", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateForm(@PathVariable("no") int no, Model model) {
		boardVO = boardService.getBoard(no);
		//boardVO = boardService.getBoard((int)session.getAttribute("user.userNo"));
		model.addAttribute("boardList", boardVO);
		return "/board/modifyForm";
	}
	
	@RequestMapping(value = "/update", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardUpdate(@ModelAttribute BoardVO vo) {
		if(boardService.boardUpdate(vo) > 0) {
			System.out.println("Update 성공");
			return "redirect:/board/list";
		}else {
			System.out.println("Update 실패");
		}
		return "/board/modifyForm";
	}
	
	@RequestMapping(value = "/delete/{no}", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardDelete(@PathVariable("no") int no, Model model) {
		model.addAttribute("boardList", boardVO);
		boardService.boardDelete(no);
		return "redirect:/board/list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}