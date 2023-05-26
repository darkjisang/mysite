package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.GuestBookService;
import com.javaex.vo.GuestBookVO;

@Controller
@RequestMapping(value = "/guestbook", method = RequestMethod.GET)
public class GuestBookController {
	@Autowired
	private GuestBookService service;

	@RequestMapping(value = "/addList", method = RequestMethod.GET)
	public String writeForm(Model model) {
		List<GuestBookVO> list = service.getBoardList();
		model.addAttribute("list", list);
		return "/guestbook/addList";
	}

	@RequestMapping(value = "/boardInsert", method = RequestMethod.GET)
	public String boardInsert(@ModelAttribute GuestBookVO vo) {
		if (service.boardInsert(vo) > 0) {
			System.out.println("Insert 성공");
		}
		System.out.println("Insert 실패");
		return "redirect:/guestbook/addList";
	}

	@RequestMapping(value = "/deleteForm/{no}", method = RequestMethod.GET)
	public String boardDeleteForm(@PathVariable("no") int no, Model model) {
		GuestBookVO vo = service.getBoard(no);
		model.addAttribute("list", vo);
		return "/guestbook/deleteForm";
	}

	@RequestMapping(value = "deleteForm/deleteForm", method = RequestMethod.POST)
	public String boardDelete(@ModelAttribute GuestBookVO vo, Model model) {
		//int boardId = vo.getBoardId();
		if (service.boardDelete(vo) > 0) {
			System.out.println("delete 성공");
			return "redirect:/guestbook/addList";
		} else {
			System.out.println("delete 실패");
			model.addAttribute("boardId", vo.getBoardId());
			return "/guestbook/deleteFail";
		}
	}

}
