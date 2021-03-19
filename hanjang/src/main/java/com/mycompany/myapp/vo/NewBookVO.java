package com.mycompany.myapp.vo;

// 새로 나온 책 VO 
public class NewBookVO {

	private String itemID; // 책 고유번호
	private String title; // 책 제목
	private String isbn; // ISBN 번호
	private String author; // 책 저자
	private String description; // 책 설명
	private String priceStandard; // 상품 정가
	private String coverLargeUrl; // 책 썸네일 주소
	private String categoryId; // 카테고리아이디
	private String categoryName; // 카테고리이름
	private String publisher; // 출판사
	private String pubDate; // 출간일

	public String getItemID() {
		return itemID;
	}

	public void setItemID(String itemID) {
		this.itemID = itemID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPriceStandard() {
		return priceStandard;
	}

	public void setPriceStandard(String priceStandard) {
		this.priceStandard = priceStandard;
	}

	public String getCoverLargeUrl() {
		return coverLargeUrl;
	}

	public void setCoverLargeUrl(String coverLargeUrl) {
		this.coverLargeUrl = coverLargeUrl;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

}
