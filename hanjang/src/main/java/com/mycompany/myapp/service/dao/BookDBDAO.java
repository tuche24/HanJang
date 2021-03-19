package com.mycompany.myapp.service.dao;

import com.mycompany.myapp.vo.NewBookVO;

// 책 정보를 api에서 DB로 넣는 작업입니다
public interface BookDBDAO {

	void insertBook(NewBookVO newBookVO);
}
