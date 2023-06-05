package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;
import com.javaex.vo.JsonResult;
import com.javaex.vo.UserVO;

@Controller
@RequestMapping(value = "/user", method = { RequestMethod.GET, RequestMethod.POST })
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserVO userVO;

	@RequestMapping(value = "/joinForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm() { // 회원가입폼
		return "/user/joinForm";
	}

	@RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
	public String join(@ModelAttribute UserVO vo) {
		if (userService.userInsert(vo) > 0) {
			System.out.println("Insert 성공");
			return "redirect:/user/joinOk";
		} else {
			System.out.println("Insert 실패");
			return "/user/joinForm";
		}
	}

	@RequestMapping(value = "/loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginForm() {
		return "/user/loginForm";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@ModelAttribute UserVO vo, HttpSession session) {
		userVO = userService.loginUser(vo);
		if (userVO != null) {
			System.out.println("Login 성공");
			session.setAttribute("user", userVO);
			return "redirect:/main";
		} else {
			System.out.println("Login 실패");
			return "/user/loginFail";
		}
	}

	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:/main";
	}

	@RequestMapping(value = "/modifyForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String modifyForm(HttpSession session, Model model) {
		userVO = userService.getUser((UserVO) session.getAttribute("user"));
		model.addAttribute("model", userVO);
		return "/user/modifyForm";
	}

	@RequestMapping(value = "/userUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public String userUpdate(@ModelAttribute UserVO vo, HttpSession session) {
		if (userService.userUpdate(vo) > 0) {
			System.out.println("Updat 성공");
			session.setAttribute("user.name", vo.getName());
			return "redirect:/main";
		} else {
			System.out.println("Updat 실패");
			return "/user/modifyForm";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/idCheck", method = { RequestMethod.GET, RequestMethod.POST })
	public JsonResult idCheck(@RequestParam("id") String id) {
		boolean data = userService.idCheck(id);
		JsonResult js = new JsonResult();
		js.success(data);
		//js.fail("통신오류");
//		js.setResult("success");
//		js.setData(data);
//		
//		js.setResult("fail");
//		js.setFailMsg("통신오류");
		return js;
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/idCheck", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public UserVO idCheck(@ModelAttribute UserVO vo) {
	 * System.out.println(userService.getUser(vo)); return userService.getUser(vo);
	 * }
	 */

}