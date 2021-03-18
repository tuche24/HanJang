package com.mycompany.myapp.vo;

public class recommendBookVO {

	private String title; // 책 제목
	private String description; // 책 설명
	private String pubDate; // 출간일
	private String priceStandard; // 책 가격
	private String coverLargeUrl; // 책 이미지
	private String categoryName; // 카테고리 이름
	private String publisher; // 출판사
	private String author; // 저자
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
}
