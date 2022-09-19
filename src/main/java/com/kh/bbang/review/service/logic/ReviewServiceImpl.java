package com.kh.bbang.review.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.bbang.review.domain.Review;
import com.kh.bbang.review.service.ReviewService;
import com.kh.bbang.review.store.ReviewStore;

public class ReviewServiceImpl implements ReviewService{
	// 의존성을 주입, 필요한 의존 객체의 “타입"에 해당하는 빈을 찾아 주입한다. *생성자* *setter* *필드*
	@Autowired
	private SqlSession session;
	
	@Autowired
	private ReviewStore rStore;

	@Override
	public int registerReview(Review review) {
//		int result = rStore.
		return 0;
	}

}
