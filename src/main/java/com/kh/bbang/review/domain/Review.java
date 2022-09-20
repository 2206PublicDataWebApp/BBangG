package com.kh.bbang.review.domain;

import java.sql.Date;

/**
 * @author user
 *
 */
public class Review {
	private int reviewNo; 
	private String userId;
	private int storeNo;
	private String reviewTitle;
	private int StarRating;
	private int ReviewCount;
	private Date reviewDate;
	private String reviewContents;
	private int HeartConut;
	private String reviewStatus;
	
	public Review() {}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public int getStarRating() {
		return StarRating;
	}

	public void setStarRating(int starRating) {
		StarRating = starRating;
	}

	public int getReviewCount() {
		return ReviewCount;
	}

	public void setReviewCount(int reviewCount) {
		ReviewCount = reviewCount;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}

	public int getHeartConut() {
		return HeartConut;
	}

	public void setHeartConut(int heartConut) {
		HeartConut = heartConut;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public Review(int reviewNo, String userId, int storeNo, String reviewTitle, int starRating, int reviewCount,
			Date reviewDate, String reviewContents, int heartConut, String reviewStatus) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.storeNo = storeNo;
		this.reviewTitle = reviewTitle;
		StarRating = starRating;
		ReviewCount = reviewCount;
		this.reviewDate = reviewDate;
		this.reviewContents = reviewContents;
		HeartConut = heartConut;
		this.reviewStatus = reviewStatus;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", userId=" + userId + ", storeNo=" + storeNo + ", reviewTitle="
				+ reviewTitle + ", StarRating=" + StarRating + ", ReviewCount=" + ReviewCount + ", reviewDate="
				+ reviewDate + ", reviewContents=" + reviewContents + ", HeartConut=" + HeartConut + ", reviewStatus="
				+ reviewStatus + "]";
	}

}
