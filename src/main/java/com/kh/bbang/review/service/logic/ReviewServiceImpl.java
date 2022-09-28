package com.kh.bbang.review.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.review.domain.Review;
import com.kh.bbang.review.service.ReviewService;
import com.kh.bbang.review.store.ReviewStore;

// @Service : 서비스 레이어, 내부에서 자바 로직을 처리
@Service
public class ReviewServiceImpl implements ReviewService{
	
	// 의존성을 주입, 필요한 의존 객체의 “타입"에 해당하는 빈을 찾아 주입한다. *생성자* *setter* *필드*
	@Autowired
	private SqlSession session;
	
	@Autowired
	private ReviewStore rStore;

	@Override
	public int registeReview(Review review) {
		int result = rStore.insertReview(session, review);
		return result;
	}
	
	@Override
	public int modifyReview(Review review) {
		int result = rStore.updateReview(session, review);
		return result;
	}

	@Override
	public int removeOneByNo(int reviewNo) {
		int result = rStore.deleteOneByNo(session, reviewNo);
		return result;
	}

	@Override
	public int insertHeartCount(Review review) {
		int result = rStore.insertHeartCount(session, review);
		return result;
	}
	
	

	@Override
	public Review printOneByNo(Integer reviewNo) {
		Review review = rStore.selectOneByNo(session, reviewNo);
		int result = 0;
		if (review != null) {
			result = rStore.updateReviewCount(session, reviewNo);
			
		}
		return review;
	}

	

	@Override
	public List<Review> printAllReview(int currentPage, int limit) {
		List<Review> rList = rStore.selectAllReview(session, currentPage, limit);
		return rList;
	}

	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int totalCount = rStore.selectTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}

	@Override
	public List<Review> printAllByValue(String searchCondition, String searchValue, int currentPage, int listLimit) {
		List<Review> rList = rStore.selectAllByValue(session, searchCondition, searchValue, currentPage, listLimit);
		return rList;
	}

	@Override
	public List<Review> heartCountBest() {
		List<Review> rList = rStore.heartCountBest(session);
		return rList;
	}
	// 스토어 페이지 리뷰
	@Override
	public List<Review> storeReviewPrint(int storeNo, int currentPage, int listLimit) {
		List<Review> rList = rStore.storeReviewPrint(session, storeNo, currentPage, listLimit);
		return rList;
	}



	

	




	
}
