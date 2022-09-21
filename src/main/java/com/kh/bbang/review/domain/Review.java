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
	private int starRating;
	private int reviewCount;
	private Date rCreateDate;	
	private String reviewContents;
	private String useYn;
	private Date rUpdateDate;
	
	private int reviewFileNo;
	private String reviewFileName;
	private String reviewFileRename;
	private String reviewFilepath;
	
	private int reviewHeart;

	public Review() {}

	public Review(int reviewNo, String userId, int storeNo, int starRating, int reviewCount, Date rCreateDate,
			String reviewContents, String useYn, Date rUpdateDate, int reviewFileNo, String reviewFileName,
			String reviewFileRename, String reviewFilepath, int reviewHeart) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.storeNo = storeNo;
		this.starRating = starRating;
		this.reviewCount = reviewCount;
		this.rCreateDate = rCreateDate;
		this.reviewContents = reviewContents;
		this.useYn = useYn;
		this.rUpdateDate = rUpdateDate;
		this.reviewFileNo = reviewFileNo;
		this.reviewFileName = reviewFileName;
		this.reviewFileRename = reviewFileRename;
		this.reviewFilepath = reviewFilepath;
		this.reviewHeart = reviewHeart;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", userId=" + userId + ", storeNo=" + storeNo + ", starRating="
				+ starRating + ", reviewCount=" + reviewCount + ", rCreateDate=" + rCreateDate + ", reviewContents="
				+ reviewContents + ", useYn=" + useYn + ", rUpdateDate=" + rUpdateDate + ", reviewFileNo="
				+ reviewFileNo + ", reviewFileName=" + reviewFileName + ", reviewFileRename=" + reviewFileRename
				+ ", reviewFilepath=" + reviewFilepath + ", reviewHeart=" + reviewHeart + "]";
	}

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

	public int getStarRating() {
		return starRating;
	}

	public void setStarRating(int starRating) {
		this.starRating = starRating;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public Date getrUpdateDate() {
		return rUpdateDate;
	}

	public void setrUpdateDate(Date rUpdateDate) {
		this.rUpdateDate = rUpdateDate;
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

	public String getReviewFilepath() {
		return reviewFilepath;
	}

	public void setReviewFilepath(String reviewFilepath) {
		this.reviewFilepath = reviewFilepath;
	}

	public int getReviewHeart() {
		return reviewHeart;
	}

	public void setReviewHeart(int reviewHeart) {
		this.reviewHeart = reviewHeart;
	}

	
}
