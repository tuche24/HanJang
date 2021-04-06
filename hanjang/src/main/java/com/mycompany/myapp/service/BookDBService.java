package com.mycompany.myapp.service;

import com.mycompany.myapp.vo.BookVO;

// 장바구니 담은 정보를 DB에 넣는 것을 도와주는 Service 입니다
public interface BookDBService {

	// 책 정보 입력 메소드
	void insertBook(BookVO newBookVO);
	// 책 정보를 출력하는 메소드입니다
	BookVO selectDetail(String title);
}
