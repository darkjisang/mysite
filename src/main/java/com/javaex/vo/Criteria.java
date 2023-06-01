package com.javaex.vo;

import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class Criteria {
	private int pageNum, amount;	//현재 페이지, 페이지 당 보여질 게시물 갯수
	private String keyword, type;	//검색 키워드, 검색 타입
	private String[] typeArr;		//검색 타입 배열

	//기본 생성자 -> 기본세팅 : pageNum=1, amount=10
	public Criteria() {
		this(1, 10);
	}
	//생성자 -> 원하는 pageNum, 원하는 amount
	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
			
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}
	public String[] getTypeArr() {
		return typeArr;
	}
	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
				+ ", typeArr=" + Arrays.toString(typeArr) + "]";
	}
}