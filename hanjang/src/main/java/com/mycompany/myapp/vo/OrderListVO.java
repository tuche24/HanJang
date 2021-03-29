package com.mycompany.myapp.vo;

public class OrderListVO {

	private String orderListNo; // 주문리스트번호
	private int userNo; // 유저 넘버
	private int cartNo; // 카트번호
	private String itemId; // 아이템 아이디
	
	
	public String getOrderListNo() {
		return orderListNo;
	}
	public void setOrderListNo(String orderListNo) {
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
	
}
