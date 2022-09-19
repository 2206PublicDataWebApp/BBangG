package com.kh.bbang.user.domain;

public class User {

	private String userId;
	private String userPwd;
	private String userName;
	private String userGender;
	private String userEmail;
	private String userPhone;
	private int userZipCode;
	private String addr;
	private String addrDetail;
	private String status;
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userGender="
				+ userGender + ", userEmail=" + userEmail + ", userPhone=" + userPhone + ", userZipCode=" + userZipCode
				+ ", addr=" + addr + ", addrDetail=" + addrDetail + ", status=" + status + "]";
	}

	public User() {}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public int getUserZipCode() {
		return userZipCode;
	}

	public void setUserZipCode(int userZipCode) {
		this.userZipCode = userZipCode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
}
