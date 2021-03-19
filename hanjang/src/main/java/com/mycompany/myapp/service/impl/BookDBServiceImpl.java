package com.mycompany.myapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.myapp.service.BookDBService;
import com.mycompany.myapp.service.dao.BookDBDAO;
import com.mycompany.myapp.vo.NewBookVO;

// 책 정보를 DB에 넣는 서비스 입니다
@Service("bookDBService")
public class BookDBServiceImpl implements BookDBService{

	@Autowired
	private BookDBDAO dao;
	
	@Override
	public void insertBook(NewBookVO newBookVO) {
		// TODO Auto-generated method stub
		dao.insertBook(newBookVO);
	}

}
