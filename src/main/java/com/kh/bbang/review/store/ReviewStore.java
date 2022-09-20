package com.kh.bbang.review.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.review.domain.Review;

public interface ReviewStore {

	// 리뷰 검색
	public Review selectOneByNo(SqlSession session, Integer reviewNo);

	// 조회수
	public int updateReviewCount(SqlSession session, int reviewNo);
	
	
	

}
