package com.javaex.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class BoardVO {
	private int boardNo, cnt, userNo;
	private String title, content, userName;
	private Date regdate;
	
	public BoardVO() {
		super();
	}

	public BoardVO(int boardNo, int cnt, int userNo, String title, String content, String userName, Date regdate) {
		super();
		this.boardNo = boardNo;
		this.cnt = cnt;
		this.userNo = userNo;
		this.title = title;
		this.content = content;
		this.userName = userName;
		this.regdate = regdate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", cnt=" + cnt + ", userNo=" + userNo + ", title=" + title + ", content="
				+ content + ", userName=" + userName + ", regdate=" + regdate + "]";
	}
	
}