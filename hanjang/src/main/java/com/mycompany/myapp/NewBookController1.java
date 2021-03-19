package com.mycompany.myapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.NewBookService;
import com.mycompany.myapp.vo.NewBookVO;

@Controller
public class NewBookController1 {

	@Autowired
	private NewBookService service;
	@Autowired
	private BookDBController dbcontroller;
	
	@RequestMapping("NewBookList1.do")
	public ModelAndView bookList(@RequestParam(required=false) String categoryId) {
		ModelAndView mav = new ModelAndView();
		
		// xml 파싱 후 VO로 값을 받음
		List<NewBookVO> bookList = service.searchBook(categoryId);
		// DB에 VO 반복해 넣는 메소드
		for(NewBookVO vo: bookList) {
			dbcontroller.DBinsert(vo);
		}
		
		
		mav.addObject("bookList", bookList);
		mav.setViewName("new_book/New_Book");
		return mav;
	}
}
