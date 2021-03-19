package com.mycompany.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.NewBookService;

@Controller
public class NewBookController1 {

	@Autowired
	private NewBookService service;
	
	@RequestMapping("NewBookList1.do")
	public ModelAndView bookList(@RequestParam(required=false) String categoryId) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bookList", service.searchBook(categoryId));
		mav.setViewName("new_book/New_Book");
		return mav;
	}
}
