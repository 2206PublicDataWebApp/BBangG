package com.kh.bbang.review.domain;

public class ReviewHeart {
	private int reviewHeart;	// 게시글 추천
	private int storeNo;	// 점포번호
	private String userId;	// 회원 아이디
	
	public ReviewHeart () {}

	@Override
	public String toString() {
		return "ReviewHeart [reviewHeart=" + reviewHeart + ", storeNo=" + storeNo + ", userId=" + userId + "]";
	}

	public ReviewHeart(int reviewHeart, int storeNo, String userId) {
		super();
		this.reviewHeart = reviewHeart;
		this.storeNo = storeNo;
		this.userId = userId;
	}

	public int getReviewHeart() {
		return reviewHeart;
	}

	public void setReviewHeart(int reviewHeart) {
		this.reviewHeart = reviewHeart;
	}

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
	
	
}
