package com.mycompany.myapp.service;

import com.mycompany.myapp.vo.NewBookVO;

// 장바구니 담은 정보를 DB에 넣는 것을 도와주는 Service 입니다
public interface BookDBService {

	// 책 정보 입력 메소드
	void insertBook(NewBookVO newBookVO);
	
}
