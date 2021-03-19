package com.mycompany.myapp.vo;

import java.sql.Date;

public class ReplyVO {
	
	private int replyNo;
	private int boardNo;
	private String replyContent;
	private String replyWriterId;
	private String replyWriterNick;
	private Date regDate;
	
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyWriterId() {
		return replyWriterId;
	}
	public void setReplyWriterId(String replyWriterId) {
		this.replyWriterId = replyWriterId;
	}
	public String getReplyWriterNick() {
		return replyWriterNick;
	}
	public void setReplyWriterNick(String replyWriterNick) {
		this.replyWriterNick = replyWriterNick;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", boardNo=" + boardNo + ", replyContent=" + replyContent
				+ ", replyWriterId=" + replyWriterId + ", replyWriterName=" + replyWriterNick + ", regDate=" + regDate
				+ "]";
	}
	

}
