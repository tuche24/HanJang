package com.mycompany.myapp.service.dao;

import java.util.List;

import com.mycompany.myapp.vo.CommunityReplyVO;

public interface Community2ReplyDAO {

	// 댓글 목록
	List<CommunityReplyVO> getReplyList(int boardNo);
	
	// 댓글 등록
	void insertReply(CommunityReplyVO rv);
	
	// 댓글 수정
	void updateReply(CommunityReplyVO rv);
	
	// 댓글 삭제
	void deleteReply(CommunityReplyVO rv);
	
}
