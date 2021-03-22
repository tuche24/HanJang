package com.mycompany.myapp.service;

import java.util.List;

import com.mycompany.myapp.vo.CommunityReplyVO;

public interface CommunityReplyService {
	
	// 댓글 목록
	List<CommunityReplyVO> getReplyList(int boardNo);
	
	// 댓글 입력
	void insertReply(CommunityReplyVO rv);
	
	// 댓글 수정
	void updateReply(CommunityReplyVO rv);
	
	// 댓글 삭제
	void deleteReply(int replyNo);
	
}
