package com.mycompany.myapp.vo;

public class PagingObject {
	
	private PageVO paging;
	private int postTotalCount;
	private int firstPage;
	private int lastPage;
	private boolean prev;
	private boolean next;
	
	// 한번에 보여질 페이지 버튼 수
	private final int pageBtnNum = 5;
	
	private void calcPageData() {
		
		lastPage = (int)(Math.ceil(paging.getPage() / (double)pageBtnNum) * pageBtnNum);
		
		firstPage = (lastPage-pageBtnNum)+1;
		
		prev = firstPage == 1 ? false : true;
		
		next = (lastPage * paging.getCountPerPage()) >= postTotalCount ? false : true;
		
		if(!isNext()) {
			lastPage = (int)(Math.ceil(postTotalCount / (double)paging.getCountPerPage()));
		}
	}
	
	public PageVO getPaging() {
		return paging;
	}

	public void setPaging(PageVO paging) {
		this.paging = paging;
	}

	public int getPostTotalCount() {
		return postTotalCount;
	}

	public void setPostTotalCount(int postTotalCount) {
		this.postTotalCount = postTotalCount;
		calcPageData();
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPageBtnNum() {
		return pageBtnNum;
	}

	@Override
	public String toString() {
		return "PagingObject [pv=" + paging + ", postTotalCount=" + postTotalCount + ", firstPage=" + firstPage
				+ ", lastPage=" + lastPage + ", prev=" + prev + ", next=" + next + ", pageBtnNum=" + pageBtnNum + "]";
	}

}
