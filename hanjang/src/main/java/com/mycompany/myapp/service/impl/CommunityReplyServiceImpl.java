package com.mycompany.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.CommunityReplyService;
import com.mycompany.myapp.service.dao.ReplyDAO;
import com.mycompany.myapp.vo.CommunityReplyVO;

@Service("replyService")
public class CommunityReplyServiceImpl implements CommunityReplyService {
	
	@Autowired
	private ReplyDAO dao;

	@Override
	public List<CommunityReplyVO> getReplyList(int boardNo) {
		return dao.getReplyList(boardNo);
	}

	@Override
	public void insertReply(CommunityReplyVO rv) {
		dao.insertReply(rv);
	}

	@Override
	public void updateReply(CommunityReplyVO rv) {
		dao.updateReply(rv);
	}

	@Override
	public void deleteReply(int replyNo) {
		dao.deleteReply(replyNo);
	}

}
