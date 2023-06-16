package com.javaex.vo;

import org.springframework.stereotype.Component;

@Component
public class GalleryVO {
	private int fileNo, userNo, fileSize;	//글번호, 회원번호, 파일사이즈 
	private String content;					//코멘트
	private String filePath;				//파일패스
	private String orgName;					//오리지널
	private String saveName;				//저장이름
	private String userName;				//작성자명
	
	public GalleryVO() {
		super();
	}

	public GalleryVO(int fileNo, int userNo, int fileSize, String content, String filePath, String orgName,
			String saveName) {
		super();
		this.fileNo = fileNo;
		this.userNo = userNo;
		this.fileSize = fileSize;
		this.content = content;
		this.filePath = filePath;
		this.orgName = orgName;
		this.saveName = saveName;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "GalleryVO [fileNo=" + fileNo + ", userNo=" + userNo + ", fileSize=" + fileSize + ", content=" + content
				+ ", filePath=" + filePath + ", orgName=" + orgName + ", saveName=" + saveName + ", userName="
				+ userName + "]";
	}
}