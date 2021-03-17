package com.mycompany.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.DataForLibraryService;

@Controller
public class PopularBookController {

	@Autowired
	private DataForLibraryService service;
	
	@RequestMapping("popularList.do")
	public ModelAndView bookList(@RequestParam(required=false)String keyword) { // 여기서 인자 값으로 무엇을 넣어야할지
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("bookList", service.popularBook(1, 5));
		mav.setViewName("popularBook");
		return mav;
	}
	
	@RequestMapping("goToPopular.do")
	public String goToJSP() {
		return "popularBook";
	}
}
