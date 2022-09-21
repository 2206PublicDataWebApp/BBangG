package com.kh.bbang.faq.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.faq.domain.Faq;

public interface FaqStore {

	//inserFaq
	public int insertFaq(SqlSession session, Faq faq);
	
	//selectAllFaq
	public List<Faq> selectAllFaq(SqlSession session, int currentPage, int limit);
	
	// selectTotalCount
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);
	
public Faq selectOneByNo(SqlSession session, Integer FaqNo);
	
	public int deleteOneByNo(SqlSession session, int FaqNo);
	
	public int updateFaq(SqlSession session, Faq Faq);

	public List<Faq> selectAllByValue(SqlSession session, 
			String searchCondition, String searchValue, 
			int currentPage, int FaqLimit);
	
}
