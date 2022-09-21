package com.kh.bbang.review.service;

import java.util.List;

import com.kh.bbang.review.domain.Review;

public interface ReviewService {
	
	public int registeReview(Review review);

	public Review printDetailOneByNo(Integer reviewNo);
	
	// REVIEW_TBL <- SELECT * FROM REVIEW_TBL WHERE B_STATUS = 'Y'
	public List<Review> printAllReview();
	
}
