package com.mycompany.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.RecommendBookService;

@Controller
public class RecommendBookController {

	@Autowired
	private RecommendBookService service;
	
	@RequestMapping("recommendBookList.do")
	public ModelAndView booklist(@RequestParam(required=false)String keyword) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bookList", service.listBook());
		
		mav.setViewName("recommendList");
		return mav;
	}
	
	
}
