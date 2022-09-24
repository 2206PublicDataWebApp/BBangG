package com.kh.bbang.review.service;

import java.util.List;

import com.kh.bbang.review.domain.Review;

public interface ReviewService {
	
	// 게시물 작성
	public int registeReview(Review review);
	// 추천 
	public int insertHeartCount(Review review);
	
	// 페이징
	public int getTotalCount(String searchCondition, String searchValue);
	
	// 게시글 상세
	public Review printOneByNo(Integer reivewNo);
	
	// 뷰게시판 리스트
	public List<Review> printAllReview(int currentPage, int limit);
	
	// 게시물 삭제
	public int removeOneByNo(int reviewNo);
}
