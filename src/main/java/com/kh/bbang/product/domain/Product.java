package com.kh.bbang.product.domain;

public class Product {
	private int refStoreNo;
	private int productCode;
	private String productName;
	private int productPrice;
	

	public int getRefStoreNo() {
		return refStoreNo;
	}
	public void setRefStoreNo(int refStoreNo) {
		this.refStoreNo = refStoreNo;
	}
	
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
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
		return "Product [refStoreNo=" + refStoreNo + ", productCode=" + productCode + ", productName=" + productName
				+ ", productPrice=" + productPrice + "]";
	}
	
	
}
