package com.kh.bbang.qna.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.qna.domain.Qna;
import com.kh.bbang.qna.domain.Reply;
import com.kh.bbang.qna.service.QnaService;
import com.kh.bbang.qna.store.QnaStore;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private SqlSession session;

	@Autowired
	private QnaStore qnaStore;

	@Override
	public int registerQna(Qna qna) {
		int result = qnaStore.insertQna(session, qna);
		return result;
	}

	@Override
	public int modifyQna(Qna qna) {
		int result = qnaStore.updateQna(session, qna);
		return result;
	}

	@Override
	public int removeOneByNo(int qnaNo) {
		int result = qnaStore.deleteOneByNo(session, qnaNo);
		return result;
	}

	@Override
	public List<Qna> printAllQna(int currentPage, int limit) {
		List<Qna> qnaList = qnaStore.selectAllQna(session, currentPage, limit);
		return qnaList;
	}

	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int totalCount = qnaStore.selectTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}

	@Override
	public Qna printOneByNo(Integer qnaNo) {
		Qna qna = qnaStore.selectOneByNo(session, qnaNo);
		int result = 0;
		if (qna != null) {
			result = qnaStore.updateQnaCount(session, qnaNo);
		}
		return qna;
	}

	@Override
	public List<Qna> printAllByValue(String searchCondition, String searchValue, int currentPage, int qnaLimit) {
		List<Qna> qnaList = qnaStore.selectAllByValue(session, searchCondition, searchValue, currentPage, qnaLimit);
		return qnaList;
	}

	@Override
	public int registerReply(Reply reply) {
		int result = qnaStore.insertReply(session, reply);
		return result;
	}

	@Override
	public int modifyReply(Reply reply) {
		int result = qnaStore.modifyReply(session, reply);
		return result;
	}

	@Override
	public int deleteReply(Integer replyNo) {
		int result = qnaStore.deleteReply(session, replyNo);
		return result;
	}

	@Override
	public List<Reply> printAllReply(int refQnaNo) {
		List<Reply> replyList = qnaStore.selectAllReply(session, refQnaNo);
		return replyList;
	}

	@Override
	public int registAnswer(Qna qna) {
		int result = qnaStore.insertAnswer(session, qna);
		return result;
	}

	

	

}
