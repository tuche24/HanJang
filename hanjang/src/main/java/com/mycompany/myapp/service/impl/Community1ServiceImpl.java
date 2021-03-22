package com.mycompany.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.CommunityService;
import com.mycompany.myapp.service.dao.Community1DAO;
import com.mycompany.myapp.vo.CommunityVO;
import com.mycompany.myapp.vo.PageVO;

@Service("community1Service")
public class Community1ServiceImpl implements CommunityService {
	
	@Autowired
	private Community1DAO dao;

	@Override
	public List<CommunityVO> getPostListPaging(PageVO pv) {
		return dao.getPostListPaging(pv);
	}

	@Override
	public CommunityVO getPost(int boardNo) {
		return dao.getPost(boardNo);
	}

	@Override
	public void insertPost(CommunityVO post) {
		dao.insertPost(post);
	}

	@Override
	public void updatePost(CommunityVO post) {
		dao.updatePost(post);
	}

	@Override
	public void deletePost(int boardNo) {
		dao.deletePost(boardNo);
	}

	@Override
	public void updateViewCnt(int boardNo) {
		dao.updateViewCnt(boardNo);
	}

	@Override
	public int countPosts() {
		return dao.countPosts();
	}

}
