package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.GalleryDAO;
import com.javaex.vo.GalleryVO;

@Service
public class GalleryService {
	@Autowired
	private GalleryDAO dao;

	// 파일처리
	public String restore(MultipartFile file) {
		String saveDir = "C:/javaStudy/fileupload/";
		System.out.println("GalleryService.restore");
		System.out.println(file);
		// 오리지널파일
		String orgName = file.getOriginalFilename();
		System.out.println("orgName: " + orgName);
		// 확장자
		String exName = orgName.substring(orgName.indexOf("."));
		System.out.println("exName: " + exName);
		// 저장파일 이름(관리)
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println("saveName: " + saveName);
		// 파일패스
		String filePath = saveDir + saveName;
		System.out.println("filePath: " + filePath);
		// 파일사이즈
		long fileSize = file.getSize();
		System.out.println("fileSize: " + fileSize);
		// 파일 업로드(HDD save)
		try {
			byte[] fileData = file.getBytes(); // 리턴형 배열
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bout = new BufferedOutputStream(out);
			bout.write(fileData);
			bout.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return saveName;
	}
	
	public List<GalleryVO> getList(){
		return dao.getList();
	}
	
	public GalleryVO getGallery(int no) {
		System.out.println("GalleryService.getGallery");
		return dao.getGallery(no);
	}
}










