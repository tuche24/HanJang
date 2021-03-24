package com.mycompany.myapp;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.BestSellerService;
import com.mycompany.myapp.vo.BookVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@Autowired
	private BestSellerService service;
	@Autowired
	private BookDBController dbcontroller;
	
	@RequestMapping("mainAll.do")
	public ModelAndView bookList(@RequestParam(required=false) String categoryId) {
		ModelAndView mav = new ModelAndView();
		
		// xml 파싱 후 VO로 값을 받음
		List<BookVO> bookList = service.searchBook(categoryId);
		
		// DB에 VO 반복해 넣는 메소드
		for(BookVO vo: bookList) {
			dbcontroller.DBinsert(vo);
		}
		
		
		mav.addObject("bookList", bookList);
		mav.setViewName("main");
		return mav;
	}
	@RequestMapping(value="/loginform.do")
	public String goToLogin() {
		return "LoginForm";
	}
	@RequestMapping(value="/joinform.do")
	public String goToJoinform() {
		return "JoinForm";
		
	}
	@RequestMapping(value = "/testError.do")
	public String goToError() {
		return "error/1111";
	}
	
	@RequestMapping(value="/search.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String json(Locale locale, Model model) {
		String[] array= {"엽기떡볶이","신전떡볶이","걸작떡볶이","신당동떡볶이"};
		
		
		return null;
		
		
	}
	
	/*@RequestMapping(value = "/goToNewBook.do")
	public String goToNewBook() {
		return "new_book/New_Book";
	}*/
	
	@RequestMapping(value = "/goToCart.do")
	public String goToCart() {
		return "cart/cart";
	}
	
}
