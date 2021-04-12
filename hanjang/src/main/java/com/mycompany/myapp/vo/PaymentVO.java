package com.mycompany.myapp.vo;

public class PaymentVO {

	private String title; // 상품명
	private int priceStandard; // 상품가격
	private int priceTotal; // 금액
	private String email; // 이메일
	private String name; // 이름
	private String phone; // 전화번호
	private String address; // 주소
	private int orderListNo; // 결제확인
	
	public PaymentVO(String title, int priceTotal, String email, String name, String phone,
			String address, int orderListNo) {
		this.title = title;
		this.priceTotal = priceTotal;
		this.email = email;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.orderListNo = orderListNo;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPriceStandard() {
		return priceStandard;
	}
	public void setPriceStandard(int priceStandard) {
		this.priceStandard = priceStandard;
	}
	public int getPriceTotal() {
		return priceTotal;
	}
	public void setPriceTotal(int priceTotal) {
		this.priceTotal = priceTotal;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public int getOrderListNo() {
		return orderListNo;
	}

	public void setOrderListNo(int orderListNo) {
		this.orderListNo = orderListNo;
	}
	
}
