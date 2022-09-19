package com.kh.bbang.review.domain;

public class ReviewPageInfo {
	private int totalCount;	// 전체 게시글 개수
	private int listLimit;	// 한 페이지 안 게시글 개수
	private int currentPage; // 현재 페이지
	private int startPage;	// 페이징 바 시작 번호
	private int endPage;	// 페이징 바 마지막 번호
	private int pages;	// 전체 페이지 수
	private int prevPage;	// 이전 페이지
	private int nextPage;	// 다음 페이지
	
//	private boolean isFirstPage = false ;// 마지막 페이지인지 여부
//	private boolean isLastPage = false ;// 이전 페이지가 있는지 여부
//	private boolean hasPreviousPage = false ;// 다음 페이지가 있는지 여부
//	private boolean hasNextPage = false ;// 내비게이션 페이지 번호
//	private int navigatePages ;// 모든 내비게이션 페이지 번호
//	private int [ ] navigatepageNums ;// 내비게이션 바의 첫 페이지
//	private int navigateFirstPage ;// 내비게이션 바의 마지막 페이지
//	private int navigateLastPage ;

	
	public ReviewPageInfo() {}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getListLimit() {
		return listLimit;
	}

	public void setListLimit(int listLimit) {
		this.listLimit = listLimit;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	@Override
	public String toString() {
		return "ReviewPageInfo [totalCount=" + totalCount + ", listLimit=" + listLimit + ", currentPage=" + currentPage
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", pages=" + pages + ", prevPage=" + prevPage
				+ ", nextPage=" + nextPage + "]";
	}

	public ReviewPageInfo(int totalCount, int listLimit, int currentPage, int startPage, int endPage, int pages,
			int prevPage, int nextPage) {
		super();
		this.totalCount = totalCount;
		this.listLimit = listLimit;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.pages = pages;
		this.prevPage = prevPage;
		this.nextPage = nextPage;
	}
	
	
}
