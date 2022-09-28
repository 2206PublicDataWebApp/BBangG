package com.kh.bbang.qna.service;



import java.util.List;

import com.kh.bbang.qna.domain.Qna;
import com.kh.bbang.qna.domain.Reply;

public interface QnaService {
	
		public int registerQna(Qna qna);
		
		public int modifyQna(Qna qna);
		
		public int removeOneByNo(int qnaNo);
	
		public List<Qna> printAllQna(int currentPage, int limit);
	
		public int getTotalCount(String searchCondition, String searchValue);
	
		public Qna printOneByNo(Integer qnaNo);
		
		public List<Qna> printAllByValue(String searchCondition, String searchValue, int currentPage, int qnaLimit);
		
		public int registerReply(Reply reply);
		
		public int modifyReply(Reply reply);
		
		public int deleteReply(Integer replyNo);
		
		public List<Reply> printAllReply(int refQnaNo);
		
		public int registAnswer(Qna qna);

		public int modifyAnswer(Qna qna);
	}
