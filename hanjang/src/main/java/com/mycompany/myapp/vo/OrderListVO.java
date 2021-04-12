package com.mycompany.myapp.vo;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;

public class OrderListVO {

	@Autowired
	private CartVO cartVO;
	@Autowired
	private BookVO bookVO;
	
	private int orderListNo; // 주문리스트번호
	private int userNo; // 유저 넘버
	private int cartNo; // 카트번호
	private String itemId; // 아이템 아이디
	private Timestamp regDate; // 등록일자
	private int isFinished; // 결제확인
	
	public int getOrderListNo() {
		return orderListNo;
	}
	public void setOrderListNo(int orderListNo) {
		this.orderListNo = orderListNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
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
	public int getIsFinished() {
		return isFinished;
	}
	public void setIsFinished(int isFinished) {
		this.isFinished = isFinished;
	}
	
}
