package com.kh.bbang.store.domain;

import java.sql.Date;

public class Store {
	private int storeNo;
	private String storeName;
	private String storeZipCode;
	private String storeAddr;
	private String storeAddrDetail;
	private String storeCeo;
	private String storeTel;
	private String storeUrl;
	private String storeAccount;
	private String storeFilename;
	private String storeFileRename;
	private String storeFilepath;
	private String storeStatus;
	private String storeBank;
	private Date storeUpdateDate;
	
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreZipCode() {
		return storeZipCode;
	}
	public void setStoreZipCode(String storeZipCode) {
		this.storeZipCode = storeZipCode;
	}
	public String getStoreAddr() {
		return storeAddr;
	}
	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}
	public String getStoreAddrDetail() {
		return storeAddrDetail;
	}
	public void setStoreAddrDetail(String storeAddrDetail) {
		this.storeAddrDetail = storeAddrDetail;
	}
	public String getStoreCeo() {
		return storeCeo;
	}
	public void setStoreCeo(String storeCeo) {
		this.storeCeo = storeCeo;
	}
	public String getStoreTel() {
		return storeTel;
	}
	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}
	public String getStoreUrl() {
		return storeUrl;
	}
	public void setStoreUrl(String storeUrl) {
		this.storeUrl = storeUrl;
	}
	public String getStoreAccount() {
		return storeAccount;
	}
	public void setStoreAccount(String storeAccount) {
		this.storeAccount = storeAccount;
	}
	public String getStoreFilename() {
		return storeFilename;
	}
	public void setStoreFilename(String storeFilename) {
		this.storeFilename = storeFilename;
	}
	public String getStoreFileRename() {
		return storeFileRename;
	}
	public void setStoreFileRename(String storeFileRename) {
		this.storeFileRename = storeFileRename;
	}
	public String getStoreFilepath() {
		return storeFilepath;
	}
	public void setStoreFilepath(String storeFilepath) {
		this.storeFilepath = storeFilepath;
	}
	public String getStoreStatus() {
		return storeStatus;
	}
	public void setStoreStatus(String storeStatus) {
		this.storeStatus = storeStatus;
	}
	public String getStoreBank() {
		return storeBank;
	}
	public void setStoreBank(String storeBank) {
		this.storeBank = storeBank;
	}
	public Date getStoreUpdateDate() {
		return storeUpdateDate;
	}
	public void setStoreUpdateDate(Date storeUpdateDate) {
		this.storeUpdateDate = storeUpdateDate;
	}
	@Override
	public String toString() {
		return "Store [storeNo=" + storeNo + ", storeName=" + storeName + ", storeZipCode=" + storeZipCode
				+ ", storeAddr=" + storeAddr + ", storeAddrDetail=" + storeAddrDetail + ", storeCeo=" + storeCeo
				+ ", storeTel=" + storeTel + ", storeUrl=" + storeUrl + ", storeAccount=" + storeAccount
				+ ", storeFilename=" + storeFilename + ", storeFileRename=" + storeFileRename + ", storeFilepath="
				+ storeFilepath + ", storeStatus=" + storeStatus + ", storeBank=" + storeBank + ", storeUpdateDate="
				+ storeUpdateDate + "]";
	}
	
	
	
	
	
	
	
}
