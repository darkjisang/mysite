package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.FileUploadService;
import com.javaex.service.GalleryService;
import com.javaex.vo.GalleryVO;
import com.javaex.vo.JsonResult;

@Controller
@RequestMapping(value = "/gallery")
public class GalleryController {
	
	@Autowired
	private GalleryService service;
	
	@RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model) {
		List<GalleryVO> list = service.getList();
		System.out.println(list);
		model.addAttribute("list", list);
		return "/gallery/list";
	}	

	@RequestMapping(value = "/upload", method = {RequestMethod.GET, RequestMethod.POST})
	public String upload(@RequestParam("file") MultipartFile file, @ModelAttribute GalleryVO vo) {
		System.out.println(file);
		System.out.println(vo);
		service.restore(file);
		return "/gallery/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getGallery", method = {RequestMethod.GET, RequestMethod.POST})
	public JsonResult getGallery(@RequestParam("no") int no) {
		System.out.println("GalleryController.getGallery()");
		System.out.println(no);
		GalleryVO vo = service.getGallery(no);
		JsonResult js = new JsonResult();
		js.success(vo);
		System.out.println(vo);
		return js;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}