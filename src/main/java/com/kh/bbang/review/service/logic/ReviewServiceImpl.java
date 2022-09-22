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
//		int result = rStore.
		return 0;
	}

	@Override
	public Review printDetailOneByNo(Integer reviewNo) {
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
	public int getTotalCount() {
		int totalCount = rStore.selectTotalCount(session);
		return totalCount;
	}

}
