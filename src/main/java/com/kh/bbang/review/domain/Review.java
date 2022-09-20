package com.kh.bbang.review.domain;

import java.sql.Date;

/**
 * @author user
 *
 */
public class Review {
	private int storeNo;
	private String userId;
	private int reviewNo;
	private String reviewTitle;
	private int StarRating;
	private int ReviewCount;
	private Date reviewDate;
	private String reviewContents;
	private int reviewHeartConut;
	private String reviewStatus;
	
	
	////////////////////////////////////////////////////////////////////////////////////
	
	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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

	public int getReviewHeartConut() {
		return reviewHeartConut;
	}

	public void setReviewHeartConut(int reviewHeartConut) {
		this.reviewHeartConut = reviewHeartConut;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	
	@Override
	public String toString() {
		return "Review [storeNo=" + storeNo + ", userId=" + userId + ", reviewNo=" + reviewNo + ", reviewTitle="
				+ reviewTitle + ", StarRating=" + StarRating + ", ReviewCount=" + ReviewCount + ", reviewDate="
				+ reviewDate + ", reviewContents=" + reviewContents + ", reviewHeartConut=" + reviewHeartConut
				+ ", reviewStatus=" + reviewStatus + "]";
	}

	////////////////////////////////////////////////////////////////////////////////////
	
	public Review(int storeNo, String userId, int reviewNo, String reviewTitle, int starRating, int reviewCount,
			Date reviewDate, String reviewContents, int reviewHeartConut, String reviewStatus) {
		super();
		this.storeNo = storeNo;
		this.userId = userId;
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		StarRating = starRating;
		ReviewCount = reviewCount;
		this.reviewDate = reviewDate;
		this.reviewContents = reviewContents;
		this.reviewHeartConut = reviewHeartConut;
		this.reviewStatus = reviewStatus;
	}




	
	
	

}
