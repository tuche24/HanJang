package com.mycompany.myapp.service.dao;

import java.util.List;

import com.mycompany.myapp.vo.ReplyVO;

public interface ReplyDAO {

	// 댓글 목록
	List<ReplyVO> getReplyList(int boardNo);
	
	// 댓글 입력
	void insertReply(ReplyVO rv);
	
	// 댓글 수정
	void updateReply(ReplyVO rv);
	
	// 댓글 삭제
	void deleteReply(int replyNo);
	
}
