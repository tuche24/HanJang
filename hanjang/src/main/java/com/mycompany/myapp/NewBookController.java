package com.mycompany.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NewBookController {

	@RequestMapping(value = "/goToNewBook.do")
	public String goToNewBook() {
		return "new_book/New_Book";
	}
	
	@RequestMapping(value = "/goToGenre.do")
	public String goToGenre() {
		return "new_book/New_Book_bottomline";
	}
}
