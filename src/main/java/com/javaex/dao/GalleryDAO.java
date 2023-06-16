package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GalleryVO;

@Repository
public class GalleryDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<GalleryVO> getList(){
		List<GalleryVO> galleryList = sqlsession.selectList("gallery.getlist");
		return galleryList;
	}
	
	public GalleryVO getGallery(int no) {
		System.out.println("GalleryDAO.getGallery");
		return sqlsession.selectOne("gallery.getGallery", no);
	}
}