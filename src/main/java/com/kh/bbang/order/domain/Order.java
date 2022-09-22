package com.kh.bbang.order.domain;




public class Order {
	private int orderNo;
	private String userId;
	private String orderName;
	private String orderPhone;
	private int storeNo;
	private String orderDetail;
	private int orderShipfee;
	private int totalPrice;
	private String orderDate;
	private String delivaryName;
	private String delivaryPhone;
	private String delivaryZipcode;
	private String delivaryAddr;
	private String delivaryAddrDetail;
	private String delivaryMemo;
	private int orderState;
	
	

	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	
	public String getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(String orderDetail) {
		this.orderDetail = orderDetail;
	}
	public int getOrderShipfee() {
		return orderShipfee;
	}
	public void setOrderShipfee(int orderShipfee) {
		this.orderShipfee = orderShipfee;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getDelivaryName() {
		return delivaryName;
	}
	public void setDelivaryName(String delivaryName) {
		this.delivaryName = delivaryName;
	}
	public String getDelivaryPhone() {
		return delivaryPhone;
	}
	public void setDelivaryPhone(String delivaryPhone) {
		this.delivaryPhone = delivaryPhone;
	}
	public String getDelivaryZipcode() {
		return delivaryZipcode;
	}
	public void setDelivaryZipcode(String delivaryZipcode) {
		this.delivaryZipcode = delivaryZipcode;
	}
	public String getDelivaryAddr() {
		return delivaryAddr;
	}
	public void setDelivaryAddr(String delivaryAddr) {
		this.delivaryAddr = delivaryAddr;
	}
	public String getDelivaryAddrDetail() {
		return delivaryAddrDetail;
	}
	public void setDelivaryAddrDetail(String delivaryAddrDetail) {
		this.delivaryAddrDetail= delivaryAddrDetail;
	}
	public String getDelivaryMemo() {
		return delivaryMemo;
	}
	public void setDelivaryMemo(String delivaryMemo) {
		this.delivaryMemo = delivaryMemo;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userId=" + userId + ", orderName=" + orderName + ", orderPhone="
				+ orderPhone + ", storeNo=" + storeNo + ", orderDetail=" + orderDetail + ", orderShipfee="
				+ orderShipfee + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate + ", delivaryName="
				+ delivaryName + ", delivaryPhone=" + delivaryPhone + ", delivaryZipcode=" + delivaryZipcode
				+ ", delivaryAddr=" + delivaryAddr + ", delivaryAddrDetail=" + delivaryAddrDetail + ", delivaryMemo="
				+ delivaryMemo + ", orderState=" + orderState + "]";
	}



}
