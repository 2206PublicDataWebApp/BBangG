package com.kh.bbang.review.domain;

import java.sql.Date;

/**
 * @author user
 *
 */
public class Review {
	private int reviewNo;
	private int storeNo;
	private String reviewWriter; 
	private String reviewContent;
	private String reviewFilename;
	private String reviewFileRename;
	private String reviewFilepath;
	private int reviewCount;
	private int starRating;
	private Date rCreateDate;	
	private Date rUpdateDate;
	private String useYn;
	
	private String userId;
	
	private int reviewHeart;

	private String storeName;
	
	public Review() {}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", storeNo=" + storeNo + ", reviewWriter=" + reviewWriter
				+ ", reviewContent=" + reviewContent + ", reviewFilename=" + reviewFilename + ", reviewFileRename="
				+ reviewFileRename + ", reviewFilepath=" + reviewFilepath + ", reviewCount=" + reviewCount
				+ ", starRating=" + starRating + ", rCreateDate=" + rCreateDate + ", rUpdateDate=" + rUpdateDate
				+ ", useYn=" + useYn + ", reviewHeart=" + reviewHeart + "]";
	}

	public Review(int reviewNo, int storeNo, String reviewWriter, String reviewContent, String reviewFilename,
			String reviewFileRename, String reviewFilepath, int reviewCount, int starRating, Date rCreateDate,
			Date rUpdateDate, String useYn, int reviewHeart) {
		super();
		this.reviewNo = reviewNo;
		this.storeNo = storeNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewFilename = reviewFilename;
		this.reviewFileRename = reviewFileRename;
		this.reviewFilepath = reviewFilepath;
		this.reviewCount = reviewCount;
		this.starRating = starRating;
		this.rCreateDate = rCreateDate;
		this.rUpdateDate = rUpdateDate;
		this.useYn = useYn;
		this.reviewHeart = reviewHeart;
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

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewFilename() {
		return reviewFilename;
	}

	public void setReviewFilename(String reviewFilename) {
		this.reviewFilename = reviewFilename;
	}

	public String getReviewFileRename() {
		return reviewFileRename;
	}

	public void setReviewFileRename(String reviewFileRename) {
		this.reviewFileRename = reviewFileRename;
	}

	public String getReviewFilepath() {
		return reviewFilepath;
	}

	public void setReviewFilepath(String reviewFilepath) {
		this.reviewFilepath = reviewFilepath;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getStarRating() {
		return starRating;
	}

	public void setStarRating(int starRating) {
		this.starRating = starRating;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Date getrUpdateDate() {
		return rUpdateDate;
	}

	public void setrUpdateDate(Date rUpdateDate) {
		this.rUpdateDate = rUpdateDate;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public int getReviewHeart() {
		return reviewHeart;
	}

	public void setReviewHeart(int reviewHeart) {
		this.reviewHeart = reviewHeart;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	
	
}
