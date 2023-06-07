package com.javaex.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	//방명록 첫페이지 write폼
	@RequestMapping(value = "/writeForm2", method = RequestMethod.GET)
	public String writeForm2() {
		System.out.println("ApiGuestbookController.writeForm2");
		return "/guestbook/ajaxList2";
	}
	
	//방명록 첫페이지 리스트(ajax 리스트 출력)
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public JsonResult list() {
		List<GuestBookVO> guestList = service.getBoardList();
		System.out.println(guestList);
		JsonResult js = new JsonResult();
		js.success(guestList);
		return js;
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardInsert2", method = RequestMethod.POST)
	public JsonResult boardInsert2(@RequestBody GuestBookVO data) {
		System.out.println("ApiGuestbookController.boardInsert2");
		GuestBookVO vo = service.ajaxInsert(data);
		JsonResult js = new JsonResult();
		js.success(vo);
		return js;
	}
	
	//방명록 첫페이지 (기본방식)
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