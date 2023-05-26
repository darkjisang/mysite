package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.vo.UserVO;

@Controller
public class MainController {
	
	@RequestMapping(value = "/main", method = {RequestMethod.GET, RequestMethod.POST})
	public String main(@ModelAttribute UserVO vo) {
		return	"/main/main";
	}
}