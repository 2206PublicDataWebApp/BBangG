package com.kh.bbang.store.domain;

public class StoreImage {
	private int refStoreNo;
	private String storeFilename;
	private String storeFileRename;
	private String storeFilepath;
	
	public int getRefStoreNo() {
		return refStoreNo;
	}
	public void setRefStoreNo(int refStoreNo) {
		this.refStoreNo = refStoreNo;
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
	
	@Override
	public String toString() {
		return "StoreImage [refStoreNo=" + refStoreNo + ", storeFilename=" + storeFilename + ", storeFileRename="
				+ storeFileRename + ", storeFilepath=" + storeFilepath + "]";
	}
	
	
}
