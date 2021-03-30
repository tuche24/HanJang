package com.mycompany.myapp;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.NewBookService;
import com.mycompany.myapp.vo.BookVO;
// 새로 나온 책 DB와 View 연결 Controller
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
		List<BookVO> bookList = service.searchBook(categoryId);
		
		// DB에 VO 반복해 넣는 메소드
		for(BookVO vo: bookList) {
			dbcontroller.DBinsert(vo);
		}
		
		mav.addObject("categoryId", categoryId);
		
		mav.addObject("bookList", bookList);
		mav.setViewName("new_book/New_Book");
		return mav;
	}
	
	 /*protected void service(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		 int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		 System.out.println(categoryId);
		 request.setAttribute("categoryId", categoryId);
	 }*/
}
