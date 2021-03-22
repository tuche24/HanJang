package com.mycompany.myapp.vo;

import org.springframework.beans.factory.annotation.Autowired;

// 카트 VO와 책 VO 내부조인 쿼리때문에 VO를 합치는 VO를 만듦
public class CartProductVO {
	
	@Autowired
	private CartVO cartVO;
	@Autowired
	private BookVO bookVO;
	
	public CartVO getCartVO() {
		return cartVO;
	}
	public void setCartVO(CartVO cartVO) {
		this.cartVO = cartVO;
	}
	public BookVO getBookVO() {
		return bookVO;
	}
	public void setBookVO(BookVO bookVO) {
		this.bookVO = bookVO;
	}
	

}
