package com.mycompany.myapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.BoardService;
import com.mycompany.myapp.service.dao.BoardDAO;
import com.mycompany.myapp.vo.BoardVO;
import com.mycompany.myapp.vo.PageVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;

	@Override
	public List<BoardVO> getPostList() {
		return dao.getPostList();
	}

	@Override
	public BoardVO getPost(int boardNo) {
		return dao.getPost(boardNo);
	}

	@Override
	public void insertPost(BoardVO post) {
		dao.insertPost(post);
	}

	@Override
	public void updatePost(BoardVO post) {
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

	@Override
	public List<BoardVO> getPostListPaging(PageVO pv) {
		return dao.getPostListPaging(pv);
	}

}
