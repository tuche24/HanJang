package com.mycompany.myapp.vo;

public class PageVO {
	
	private int page;	// 사용자가 클릭한 페이지 번호
	private int countPerPage;	// 한 페이지 당 출력될 게시글 수
	private int skip;	// 페이징 이동시 스킵할 게시물 수
	
	public PageVO() {
		this.page = 1;
		this.countPerPage = 10;
		this.skip = 0;
	}
	
	public PageVO(int page, int countPerPage) {
		this.page = page;
		this.countPerPage = countPerPage;
		this.skip = (page-1)*countPerPage;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
		this.skip = (page-1)*this.countPerPage;
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
		this.skip = (this.page-1)*countPerPage;
	}
	public int getSkip() {
		return skip;
	}
	public void setSkip(int skip) {
		this.skip = skip;
	}

	@Override
	public String toString() {
		return "PageVO [page=" + page + ", countPerPage=" + countPerPage + ", skip=" + skip + "]";
	}
	
}
