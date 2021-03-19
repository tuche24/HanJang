package com.mycompany.myapp;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.mycompany.myapp.service.BookDBService;
import com.mycompany.myapp.vo.NewBookVO;

// 책 정보를 DB에 넣는 컨트롤러 입니다
@Controller
public class BookDBController {

	@Resource(name = "bookDBService")
	private BookDBService service;
	
	// 책 정보를 DB에 넣는 메소드 입니다.
	public void DBinsert(NewBookVO newBookVO) {
		service.insertBook(newBookVO);
	}
	
}
