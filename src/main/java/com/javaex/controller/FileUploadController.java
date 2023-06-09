package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.FileUploadService;

@Controller
@RequestMapping(value = "/fileupload")
public class FileUploadController {
	@Autowired
	private FileUploadService service;
	@RequestMapping(value = "/form", method = {RequestMethod.GET, RequestMethod.POST})
	public String form() {
		return "/fileupload/form";
	}

	@RequestMapping(value = "/upload", method = {RequestMethod.GET, RequestMethod.POST})
	public String upload(@RequestParam("file") MultipartFile file, Model model) {
		String saveName = service.restore(file);
		model.addAttribute("saveName", saveName);
		return "/fileupload/result";
	}
	

}