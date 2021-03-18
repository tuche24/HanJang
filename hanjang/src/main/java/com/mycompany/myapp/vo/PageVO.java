package com.mycompany.myapp.vo;

public class PageVO {
	
	private int page;	// 사용자가 클릭한 페이지 번호
	private int countPerPage;	// 한 페이지 당 출력될 게시글 수
	
	public PageVO() {
		this.page = 1;
		this.countPerPage = 10;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	
	
	@Override
	public String toString() {
		return "PageVO [page=" + page + ", countPerPage=" + countPerPage + "]";
	}
	
}