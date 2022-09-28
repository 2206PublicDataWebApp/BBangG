package com.kh.bbang.order.domain;

public class SearchBasic {
	private String userId;
	private String dateFrom;
	private String dateTo;
	private String orderDate = "";
	private String searchCondition = "";
	private String searchValue = "";

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public SearchBasic() {
	}

	public SearchBasic(String userId, String dateFrom, String dateTo) {
		super();
		this.userId = userId;
		this.dateFrom = dateFrom;
		this.dateTo = dateTo;
	}

	public String getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(String dateFrom) {
		this.dateFrom = dateFrom;
	}

	public String getDateTo() {
		return dateTo;
	}

	public void setDateTo(String dateTo) {
		this.dateTo = dateTo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	};

}
