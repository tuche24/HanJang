package com.mycompany.myapp.service;

import java.util.List;

import com.mycompany.myapp.vo.BoardVO;
import com.mycompany.myapp.vo.PageVO;

public interface BoardService {
	
	// 게시글 목록 조회
	List<BoardVO> getPostList();
	
	// 게시글 상세 조회
	BoardVO getPost(int boardNo);
	
	// 게시글 등록
	void insertPost(BoardVO post);
	
	// 게시글 수정
	void updatePost(BoardVO post);
	
	// 게시글 삭제
	void deletePost(int boardNo);
	
	// 조회수 증가
	void updateViewCnt(int boardNo);
	
	// 총 게시글 수 조회
	int countPosts();
	
	// 게시글 페이징 목록 조회
	List<BoardVO> getPostListPaging(PageVO pv);

}
