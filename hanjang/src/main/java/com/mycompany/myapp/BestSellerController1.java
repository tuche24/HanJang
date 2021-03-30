package com.mycompany.myapp;
	
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.BestSellerService;
import com.mycompany.myapp.service.SearchService;
import com.mycompany.myapp.vo.BookVO;
// 새로 나온 책 DB와 View 연결 Controller
@Controller
public class BestSellerController1 {

	@Autowired
	private BestSellerService service;
	@Autowired
	private BookDBController dbcontroller;
	@Autowired
	private SearchService sservice1;
	@RequestMapping("BestSellerList1.do")
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
		mav.setViewName("best_seller/Best_Seller");
		return mav;
	}
	
	//검색어로 검색
	@RequestMapping("BookList.do")
	public ModelAndView bookList1(@RequestParam(required=false) String keyword) {
		ModelAndView mav = new ModelAndView();
		
		// xml 파싱 후 VO로 값을 받음
		List<BookVO> bookList = sservice1.searchBook(keyword);

		// DB에 VO 반복해 넣는 메소드
		for(BookVO vo: bookList) {
			dbcontroller.DBinsert(vo);
		}
		
		
		mav.addObject("bookList", bookList);
		mav.setViewName("best_seller/Best_Seller");
		return mav;
	}
	
	
}
