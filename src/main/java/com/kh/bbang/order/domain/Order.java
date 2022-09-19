package com.kh.bbang.order.domain;


import java.util.Date;

public class Order {
	private int orderNo;
	private String userId;
	private int storeNo;
	private String orderDetail;
	private int orderShipfee;
	private int totalPrice;
	private Date orderDate;
	private String delivaryName;
	private String delivaryPhone;
	private String delivaryZipcode;
	private String delivaryAddressFirst;
	private String delivaryAddressSecond;
	private String delivaryMemo;
	private int orderState;
	private String date;
	
	

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
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
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
	public String getDelivaryAddressFirst() {
		return delivaryAddressFirst;
	}
	public void setDelivaryAddressFirst(String delivaryAddressFirst) {
		this.delivaryAddressFirst = delivaryAddressFirst;
	}
	public String getDelivaryAddressSecond() {
		return delivaryAddressSecond;
	}
	public void setDelivaryAddressSecond(String delivaryAddressSecond) {
		this.delivaryAddressSecond = delivaryAddressSecond;
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
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userId=" + userId + ", storeNo=" + storeNo + ", orderDetail="
				+ orderDetail + ", orderShipfee=" + orderShipfee + ", totalPrice=" + totalPrice + ", orderDate="
				+ orderDate + ", delivaryName=" + delivaryName + ", delivaryPhone=" + delivaryPhone
				+ ", delivaryZipcode=" + delivaryZipcode + ", delivaryAddressFirst=" + delivaryAddressFirst
				+ ", delivaryAddressSecond=" + delivaryAddressSecond + ", delivaryMemo=" + delivaryMemo
				+ ", orderState=" + orderState + "]";
	}



}
