package com.mycompany.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.myapp.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping(value = "/mainAll.do")
	public String goToMain() {
		
		return "main";
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
	
	@RequestMapping(value = "/goToLogin.do")
	public String goToLogin() {
		return "LoginForm";
	}
	
}
