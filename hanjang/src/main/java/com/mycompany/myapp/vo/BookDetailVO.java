package com.mycompany.myapp.vo;

public class BookDetailVO {

	private String BookIntro; // 책소개
	private String BookAuthor; // 책 저자
	private String BookReview; // 출판사 서평
	
	public String getBookIntro() {
		return BookIntro;
	}
	public void setBookIntro(String bookIntro) {
		BookIntro = bookIntro;
	}
	public String getBookAuthor() {
		return BookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		BookAuthor = bookAuthor;
	}
	public String getBookReview() {
		return BookReview;
	}
	public void setBookReview(String bookReview) {
		BookReview = bookReview;
	}
}
