package com.mycompany.myapp;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.google.gson.Gson;
import com.mycompany.myapp.service.SearchService;
import com.mycompany.myapp.vo.BookVO;
import com.mycompany.myapp.vo.PaymentVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private BookDBController dbcontroller;
	@Autowired
	private SearchService sservice1;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	
	@RequestMapping(value="/joinform.do")
	public String goToJoinform() {
		return "member/JoinForm";
		
	}
	@RequestMapping(value="/event.do")
	public String goToevent() {
		return "event";
		
	}
	@RequestMapping(value = "/testError.do")
	public String goToError() {
		return "error/1111";
	}
	
	@RequestMapping(value = "/search.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String json(@RequestParam("searchValue") String searchValue,Locale locale, Model model) {    
		
		List<BookVO> bookList = sservice1.searchBook(searchValue);
		ArrayList<String> bbb =new ArrayList<String>();
		for(BookVO vo: bookList) {
		bbb.add(vo.getTitle());
		}

		
	        Gson gson = new Gson();
	    return gson.toJson(bbb);
	}
	
	/*@RequestMapping(value = "/goToNewBook.do")
	public String goToNewBook() {
		return "new_book/New_Book";
	}*/
	
	
	@RequestMapping(value = "/goToPay.do")
	public String goToPay() {
		return "payment/Payment";
	}
	
	@RequestMapping(value = "/goToComplete.do")
	public ModelAndView goToComplete(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		PaymentVO paymentVO = (PaymentVO) session.getAttribute("payment");
		session.removeAttribute("payment"); // 주문내역서 paymentVO에 옮기고 세션에서 지우기
		
		mav.addObject("payment", paymentVO);
		mav.setViewName("payment/Complete");
		return mav;
	}
}
