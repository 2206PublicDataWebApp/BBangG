package com.kh.bbang.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.review.domain.Review;

public interface ReviewStore {
	
	public List<Review> selectAllReview(SqlSession session);

	// 리뷰 등록
	public int insertReview(SqlSession session, Review review);
	// 리뷰 검색
	public Review selectOneByNo(SqlSession session, Integer reviewNo);

	// 조회수
	public int updateReviewCount(SqlSession session, int reviewNo);
	
	
	

}
