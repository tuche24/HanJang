package com.mycompany.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.ReplyService;
import com.mycompany.myapp.service.dao.ReplyDAO;
import com.mycompany.myapp.vo.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO dao;

	@Override
	public List<ReplyVO> getReplyList(int boardNo) {
		return dao.getReplyList(boardNo);
	}

	@Override
	public void insertReply(ReplyVO rv) {
		dao.insertReply(rv);
	}

	@Override
	public void updateReply(ReplyVO rv) {
		dao.updateReply(rv);
	}

	@Override
	public void deleteReply(int replyNo) {
		dao.deleteReply(replyNo);
	}

}
