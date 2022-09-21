package com.kh.bbang.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bbang.review.domain.Review;
import com.kh.bbang.review.store.ReviewStore;
// @Repository 퍼시스턴스 레이어, DB나 파일같은 외부 I/O 작업을 처리
@Repository
public class ReviewStoreLogic implements ReviewStore{

	// 리뷰 등록
	@Override
	public int insertReview(SqlSession session, Review review) {
		int result = session.insert("ReviewMapper.insertReview", review);
		return result;
	}
	
	// 리뷰 검색
	@Override
	public Review selectOneByNo(SqlSession session, Integer reviewNo) {
		Review review = session.selectOne("ReviewMapper.selectOneByNo", reviewNo);
		return review;
	}
	
	// 조회수 
	@Override
	public int updateReviewCount(SqlSession session, int reviewNo) {
		int result = session.update("ReviewMapper.updateCount",reviewNo);
		return result;
	}

	@Override
	public List<Review> selectAllReview(SqlSession session) {
		List<Review> rList = session.selectList("ReviewMapper.selectAllReview");
		return rList;
	}

}
