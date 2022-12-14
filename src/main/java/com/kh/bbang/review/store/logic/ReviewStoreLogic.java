package com.kh.bbang.review.store.logic;

import java.util.HashMap;
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
	@Override
	public int insertHeartCount(SqlSession session, Review review) {
		int result = session.insert("ReviewMapper.insertHeartCount", review);
		return result;
	}
	@Override
	public int updateReview(SqlSession session, Review review) {
		int result = session.update("ReviewMapper.updateReview", review);
		return result;
	}
	@Override
	public int deleteOneByNo(SqlSession session, int reviewNo) {
		int result = session.delete("ReviewMapper.deleteReview", reviewNo);
		return result;
	}
	// 리뷰 상세
	@Override
	public Review selectOneByNo(SqlSession session, Integer reviewNo) {
		Review review = session.selectOne("ReviewMapper.selectOneByNo", reviewNo);
		return review;
	}
	
	@Override
	public Review selectStoreReview(SqlSession session, Integer reviewNo) {
		Review review = session.selectOne("ReviewMapper.selectStoreReview", reviewNo);
		return review;
	}
	
	// 조회수 
	@Override
	public int updateReviewCount(SqlSession session, int reviewNo) {
		int result = session.update("ReviewMapper.updateCount",reviewNo);
		return result;
	}
	
	// 전체게시글 목록
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
	
	// 게시글 조회수
	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String>paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("ReviewMapper.selectTotalCount", paramMap);
		return totalCount;

	}

	
	@Override
	public List<Review> selectAllByValue(SqlSession session, String searchCondition, String searchValue,int currentPage, int listLimit) {
		int offset = (currentPage-1) * listLimit;
		RowBounds rowBounds = new RowBounds(offset, listLimit);
		HashMap<String, String>paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		List<Review> rList = session.selectList("ReviewMapper.selectAllByValue", paramMap, rowBounds);
		return rList;
	}
	
	// 좋아요 베스트 게시물
	@Override
	public List<Review> heartCountBest(SqlSession session) {
			List<Review> rList = session.selectList("ReviewMapper.heartCountBest", null);
		return rList;
	}
	
	// 스토어 리뷰
	@Override
	public List<Review> storeReviewPrint(SqlSession session, int storeNo) {
			List<Review> rList = session.selectList("ReviewMapper.storeReviewPrint",storeNo);
			return rList;
	}
 
	

	

}
