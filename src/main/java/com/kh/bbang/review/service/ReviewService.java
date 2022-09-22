package com.kh.bbang.review.service;

import java.util.List;

import com.kh.bbang.review.domain.Review;

public interface ReviewService {
	
	// registerReview
	// REVIEW_TBL <- INSERT INTO REVIEW_TBL VALUES(...
	public int registeReview(Review review);
	
	public int insertHeartCount(Review review);
	// printAllBoard
	// BOARD_TBL <- SELECT * FROM BOARD_TBL WHERE B_STATUS = 'Y'
	public Review printDetailOneByNo(Integer reviewNo);
	
	// selectAllReview 리뷰게시판 리스트
	// REVIEW_TBL <- SELECT * FROM REVIEW_TBL WHERE USE_YN = 'Y'
	public List<Review> printAllReview(int currentPage, int limit);
	
	// getTotalCount 페이징
	// REVIEW_TBL <- SELECT COUNT (*) FROM REVIEW_TBL WHERE USE_YN = 'Y'
	public int getTotalCount(String searchCondition, String searchValue);
	
	
	// printOneByNo
	// REVIEW_TBL <- SELECT * FROM REVIEW_TBL WHERE REVIEW_NO = 11
	public Review printOneByNo(Integer reivewNo);
}
