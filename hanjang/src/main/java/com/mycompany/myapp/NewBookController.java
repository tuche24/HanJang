package com.mycompany.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NewBookController {

	@RequestMapping(value = "/goToNewBook.do")
	public String goToNewBook() {
		return "new_book/New_Book";
	}
	
	@RequestMapping(value = "/goToNewBookGenre.do")
	public String goToNewBookGenre() {
		return "new_book/New_Book_bottomline";
	}
}
