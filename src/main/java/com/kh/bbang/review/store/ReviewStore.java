package com.kh.bbang.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.review.domain.Review;

public interface ReviewStore {
	
	// insert
	// 리뷰 등록
	public int insertReview(SqlSession session, Review review);
	
	public int insertHeartCount(SqlSession session, Review review);

	public int updateReview(SqlSession session, Review review);

	// 게시글 삭제
	public int deleteOneByNo(SqlSession session, int reviewNo);

	// select
	// 리뷰 게시판 리스트
	public List<Review> selectAllReview(SqlSession session, int currentPage, int limit);
	// 페이징
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);
	
	// 리뷰 상세
	public Review selectOneByNo(SqlSession session, Integer reviewNo);

	// 스토어 리뷰
	public Review selectStoreReview(SqlSession session, Integer reviewNo);
		
	// 조회수
	public int updateReviewCount(SqlSession session, int reviewNo);

	public List<Review> selectAllByValue(SqlSession session, String searchCondition, String searchValue, int currentPage, int listLimit);

	

	
	
	

}
