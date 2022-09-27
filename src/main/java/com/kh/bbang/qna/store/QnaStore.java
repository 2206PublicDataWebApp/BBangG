package com.kh.bbang.qna.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.qna.domain.Qna;
import com.kh.bbang.qna.domain.Reply;

public interface QnaStore {

	public int insertQna(SqlSession session, Qna qna);

	public int updateQna(SqlSession session, Qna qna);

	public int deleteOneByNo(SqlSession session, int qnaNo);

	public int updateQnaCount(SqlSession session, int qnaNo);

	public List<Qna> selectAllQna(SqlSession session, int currentPage, int limit);

	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);

	public Qna selectOneByNo(SqlSession session, Integer qnaNo);

	public List<Qna> selectAllByValue(SqlSession session, String searchCondition, String searchValue, int currentPage,
			int qnaLimit);

	public int insertReply(SqlSession session, Reply reply);

	public int modifyReply(SqlSession session, Reply reply);

	public int deleteReply(SqlSession session, Integer replyNo);

	public List<Reply> selectAllReply(SqlSession session, int refQnaNo);
	
	public int insertAnswer(SqlSession session, Qna qna);
}