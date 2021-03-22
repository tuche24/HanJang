package com.mycompany.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BestSellerController {

	@RequestMapping(value = "/goToBestSeller.do")
	public String goToNewBook() {
		return "best_seller/Best_Seller";
	}
	
	@RequestMapping(value = "/goToBestSellerGenre.do")
	public String goToBestSellerGenre() {
		return "best_seller/Best_Seller_bottomline";
	}
	
	/*@RequestMapping(value = "/goToBookDetail.do")
	public String goToBookDetail() {
		return "book_detail/Book_Detail";
	}*/
}

