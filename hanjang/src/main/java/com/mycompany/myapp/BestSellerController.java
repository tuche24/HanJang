package com.mycompany.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.BestSellerService;

@Controller
public class BestSellerController {
	@Autowired
	private BestSellerService service;

	@RequestMapping("bestSellerList.do")
	public ModelAndView bookList(@RequestParam(required = false) String keyword) { // String keyword 없는 값
		ModelAndView mav = new ModelAndView();

		mav.addObject("bookList", service.listBook(100));

		mav.setViewName("bestSeller");
		return mav;
	}

	@RequestMapping(value = "/goToBestSeller.do")
	public String goToNewBook() {
		return "best_seller/Best_Seller";
	}
	
	@RequestMapping(value = "/goToBestSellerGenre.do")
	public String goToBestSellerGenre() {
		return "best_seller/Best_Seller_bottomline";
	}
}

