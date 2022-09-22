package com.kh.bbang.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	public List<Review> selectAllReview(SqlSession session, int currentPage, int limit) {
		// offset은 currentPage에 의해서 변경되기 때문에 currentPage가 필요하다.
		// limit은 한 페이지당 보여지는 게시물 수, limit은 고정값이다.
		// RowBounds란 쿼리문을 변경하지 않고도 페이징을 처리할 수 있게 해주는 클래스이며 offset과 limit값을 이용해 동작.
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = session.selectList("ReviewMapper.selectAllReview", null, rowBounds);
		return rList;
	}

	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("ReviewMapper.selectTotalCount");
		return totalCount;
	}

}
