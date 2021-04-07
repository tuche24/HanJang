package com.mycompany.myapp.vo;

import java.sql.Date;

public class CommunityVO {
	
	private int boardNo;
	private String title;
	private String content;
	private String writerId;
	private String writerNick;
	private Date regDate;
	private int viewCnt;
	private int reCnt;
	private String imgFile;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getWriterNick() {
		return writerNick;
	}
	public void setWriterNick(String writerNick) {
		this.writerNick = writerNick;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getReCnt() {
		return reCnt;
	}
	public void setReCnt(int reCnt) {
		this.reCnt = reCnt;
	}
	public String getImgFile() {
		return imgFile;
	}
	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}
	
	@Override
	public String toString() {
		return "CommunityVO [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", writerId="
				+ writerId + ", writerNick=" + writerNick + ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", reCnt="
				+ reCnt + ", imgFile=" + imgFile + "]";
	}

	
}
