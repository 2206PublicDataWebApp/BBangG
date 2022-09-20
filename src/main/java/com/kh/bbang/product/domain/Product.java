package com.kh.bbang.product.domain;

public class Product {
	private int storeNo;
	private String productCode;
	private String productName;
	private int productPrice;
	
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	@Override
	public String toString() {
		return "Product [storeNo=" + storeNo + ", productCode=" + productCode + ", productName=" + productName
				+ ", productPrice=" + productPrice + "]";
	}
	
	
}
