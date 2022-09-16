package com.kh.bbang.store.domain;

public class Store {
	private int storeNo;
	private String storeName;
	private String storeLocation;
	private String storeCeo;
	private String storeTel;
	private String storeAccount;
	private String storeFilename;
	private String storeFileRename;
	private String storeFilepath;
	private String storeStatus;
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
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
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
	@Override
	public String toString() {
		return "Store [storeNo=" + storeNo + ", storeName=" + storeName + ", storeLocation=" + storeLocation
				+ ", storeCeo=" + storeCeo + ", storeTel=" + storeTel + ", storeAccount=" + storeAccount
				+ ", storeFilename=" + storeFilename + ", storeFileRename=" + storeFileRename + ", storeFilepath="
				+ storeFilepath + ", storeStatus=" + storeStatus + "]";
	}
	
	
}
