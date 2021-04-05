package com.mycompany.myapp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.BookDetailService;
import com.mycompany.myapp.service.NewBookService;
import com.mycompany.myapp.vo.BookVO;

// 새로 나온 책 DB와 View 연결 Controller
@Controller
public class NewBookController1 {

	@Autowired
	private NewBookService service;
	@Autowired
	private BookDBController dbcontroller;
	@Resource(name = "bookDetailService")
	private BookDetailService detailService;

	@RequestMapping("NewBookList1.do")
	public ModelAndView bookList(@RequestParam(required = false) String categoryId) {
		ModelAndView mav = new ModelAndView();

		// xml 파싱 후 VO로 값을 받음
		List<BookVO> bookList = service.searchBook(categoryId);

		// DB에 VO 반복해 넣는 메소드
		for (BookVO vo : bookList) {
			dbcontroller.DBinsert(vo);
		}

		mav.addObject("categoryId", categoryId);

		mav.addObject("bookList", bookList);
		mav.setViewName("new_book/New_Book");
		return mav;
	}

	// 책 제목 인자로 받아 크롤링 컨트롤러
	@RequestMapping("goToBookDetailTest.do")
	public ModelAndView goToBookDetail(@RequestParam(required = false) String title, HttpServletRequest req) throws IOException, InterruptedException {
		ModelAndView mav = new ModelAndView();
		// 서비스 클래스에서 책 소개, 저자 및 역자 소개, 출판사 서평
		System.out.println("goToBookDetail title = " + title);
		// 검색할 url 받아오기
		String url = detailService.getCrawlingUrl(title);
		ArrayList<String> textList = detailService.seleniumExample(url, req);
		mav.addObject("textList", textList);
		mav.setViewName("book_detail/Book_Detail");
		return mav;
	}
	

	
}
