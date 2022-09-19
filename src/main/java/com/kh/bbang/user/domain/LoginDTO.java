package com.kh.bbang.user.domain;

public class LoginDTO {

	private String userId;
    private String userPdw;
    private boolean useCookie;
    
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPdw() {
		return userPdw;
	}
	public void setUserPdw(String userPdw) {
		this.userPdw = userPdw;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [userId=" + userId + ", userPdw=" + userPdw + ", useCookie=" + useCookie + "]";
	}
}
