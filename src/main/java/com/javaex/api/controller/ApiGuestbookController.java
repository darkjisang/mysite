package com.javaex.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.GuestBookService;
import com.javaex.vo.GuestBookVO;
import com.javaex.vo.JsonResult;

@Controller
@RequestMapping(value = "/api/guestbook", method = RequestMethod.GET)
public class ApiGuestbookController {
	@Autowired
	private GuestBookService service;
	
	@RequestMapping(value = "/addList", method = RequestMethod.GET)
	public String writeForm(Model model) {
		List<GuestBookVO> list = service.getBoardList();
		model.addAttribute("list", list);
		return "/guestbook/ajaxList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	public JsonResult boardInsert(@ModelAttribute GuestBookVO vo) {
		//System.out.println(service.ajaxInsert(vo));
		GuestBookVO data = service.ajaxInsert(vo);
		JsonResult js = new JsonResult();
		js.success(data);
//		if (service.boardInsert(vo) > 0) {
//			System.out.println("Insert 성공");
//		}else {
//			System.out.println("Insert 실패");
//		}
		return js;
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardRemove", method = RequestMethod.POST)
	public JsonResult remove(@ModelAttribute GuestBookVO vo) {
		int cnt = service.boardDelete(vo);
		JsonResult js = new JsonResult();
		js.success(cnt);
		if(cnt > 0) {
			System.out.println(vo);
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		return js;
	}
	
}