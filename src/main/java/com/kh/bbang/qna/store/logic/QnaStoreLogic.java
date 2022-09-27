package com.kh.bbang.qna.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bbang.qna.domain.Qna;
import com.kh.bbang.qna.domain.Reply;
import com.kh.bbang.qna.service.QnaService;
import com.kh.bbang.qna.store.QnaStore;

@Repository
public class QnaStoreLogic implements QnaStore {

	@Override
	public int insertQna(SqlSession session, Qna qna) {
		int result = session.insert("QnaMapper.insertQna", qna);
		return result;
	}

	@Override
	public int updateQna(SqlSession session, Qna qna) {
		int result = session.update("QnaMapper.updateQna", qna);
		return result;
	}

	@Override
	public int deleteOneByNo(SqlSession session, int qnaNo) {
		int result = session.delete("QnaMapper.deleteQna", qnaNo);
		return result;
	}

	@Override
	public int updateQnaCount(SqlSession session, int QnaNo) {
		int result = session.update("QnaMapper.updateCount", QnaNo);
		return result;
	}

	@Override
	public List<Qna> selectAllQna(SqlSession session, int currentPage, int limit) {
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Qna> qnaList = session.selectList("QnaMapper.selectAllQna", null, rowBounds);
		return qnaList;
	}

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("QnaMapper.selectTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public Qna selectOneByNo(SqlSession session, Integer QnaNo) {
		Qna qna = session.selectOne("QnaMapper.selectOneByNo", QnaNo);
		return qna;
	}

	@Override
	public List<Qna> selectAllByValue(SqlSession session, String searchCondition, String searchValue, int currentPage,
			int qnaLimit) {
		int offset = (currentPage - 1) * qnaLimit;
		RowBounds rowBounds = new RowBounds(offset, qnaLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		List<Qna> qnaList = session.selectList("QnaMapper.selectAllByValue", paramMap, rowBounds);
		return qnaList;
	}

	@Override
	public int insertReply(SqlSession session, Reply reply) {
		int result = session.insert("QnaMapper.insertReply", reply);
		return result;
	}

	@Override
	public int modifyReply(SqlSession session, Reply reply) {
		int result = session.update("QnaMapper.modifyReply", reply);
		return result;
	}

	@Override
	public int deleteReply(SqlSession session, Integer replyNo) {
		int result = session.delete("QnaMapper.deleteReply", replyNo);
		return result;
	}

	@Override
	public List<Reply> selectAllReply(SqlSession session, int refQnaNo) {
		List<Reply> qnaList = session.selectList("QnaMapper.selectAllReply", refQnaNo);
		return qnaList;
	}

	@Override
	public int insertAnswer(SqlSession session, Qna qna) {
		int result = session.insert("QnaMapper.insertAnswer", qna);
		return result;
	}

}
