package com.kh.bbang.review.service;

import com.kh.bbang.review.domain.Review;

public interface ReviewService {
	
	public int registerReview(Review review);

	public Review printDetailOneByNo(Integer reviewNo);
}
