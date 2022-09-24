package com.kh.bbang.order.domain;

public class SerchDate {
	private String userId;
	private String dateFrom;
	private String dateTo;
	
	public SerchDate() {}

	public SerchDate(String userId, String dateFrom, String dateTo) {
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
