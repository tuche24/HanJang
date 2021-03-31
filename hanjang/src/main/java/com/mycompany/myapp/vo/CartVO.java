package com.mycompany.myapp.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

// 장바구니 VO
@Component
public class CartVO {

	private int userNo; // 유저번호
	private String itemId; // 상품번호
	private int cartNo; // 장바구니 번호
	private int amount; // 수량
	private Timestamp regDate; // 등록된 시간
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
		
}
