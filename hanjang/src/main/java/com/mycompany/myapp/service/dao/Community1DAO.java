package com.mycompany.myapp.service.dao;

import java.util.List;

import com.mycompany.myapp.vo.CommunityVO;
import com.mycompany.myapp.vo.PageVO;

public interface Community1DAO {
	
	// 게시글 목록 조회 + 페이징
	List<CommunityVO> getPostListPaging(PageVO pv);
	
	// 게시글 상세 조회
	CommunityVO getPost(int boardNo);
	
	// 게시글 등록
	void insertPost(CommunityVO post);
	
	// 게시글 수정
	void updatePost(CommunityVO post);
	
	// 게시글 삭제
	void deletePost(int boardNo);
	
	// 조회수 증가
	void updateViewCnt(int boardNo);
	
	// 총 게시글 수 조회
	int countPosts();

}
