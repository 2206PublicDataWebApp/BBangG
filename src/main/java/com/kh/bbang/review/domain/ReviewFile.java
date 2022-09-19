package com.kh.bbang.review.domain;

public class ReviewFile {
	private int reviewNo;
	private int reviewFileNo;
	private String reviewFileName;
	private String reviewFileRename;
	private String reviewFile;
	
	
	public ReviewFile () {}
	////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public String toString() {
		return "ReviewFile [reviewNo=" + reviewNo + ", reviewFileNo=" + reviewFileNo + ", reviewFileName="
				+ reviewFileName + ", reviewFileRename=" + reviewFileRename + ", reviewFile=" + reviewFile + "]";
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getReviewFileNo() {
		return reviewFileNo;
	}
	public void setReviewFileNo(int reviewFileNo) {
		this.reviewFileNo = reviewFileNo;
	}
	public String getReviewFileName() {
		return reviewFileName;
	}
	public void setReviewFileName(String reviewFileName) {
		this.reviewFileName = reviewFileName;
	}
	public String getReviewFileRename() {
		return reviewFileRename;
	}
	public void setReviewFileRename(String reviewFileRename) {
		this.reviewFileRename = reviewFileRename;
	}
	public String getReviewFile() {
		return reviewFile;
	}
	public void setReviewFile(String reviewFile) {
		this.reviewFile = reviewFile;
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	
	
	public ReviewFile(int reviewNo, int reviewFileNo, String reviewFileName, String reviewFileRename,
			String reviewFile) {
		super();
		this.reviewNo = reviewNo;
		this.reviewFileNo = reviewFileNo;
		this.reviewFileName = reviewFileName;
		this.reviewFileRename = reviewFileRename;
		this.reviewFile = reviewFile;
	}
	

}
