package com.kh.bbang.review.service;

import java.util.List;

import com.kh.bbang.review.domain.Review;

public interface ReviewService {
	
	public int registeReview(Review review);

	public Review printDetailOneByNo(Integer reviewNo);
	
	// selectAllReview 리뷰게시판 리스트
	// REVIEW_TBL <- SELECT * FROM REVIEW_TBL WHERE USE_YN = 'Y'
	public List<Review> printAllReview(int currentPage, int limit);
	
	// getTotalCount 페이징
	// REVIEW_TBL <- SELECT COUNT (*) FROM REVIEW_TBL WHERE USE_YN = 'Y'
	public int getTotalCount();
}
