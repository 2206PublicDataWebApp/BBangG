package com.kh.bbang.faq.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.faq.domain.Faq;

public interface FaqStore {

	//inserFaq
	public int insertFaq(SqlSession session, Faq faq);
	
	//selectAllFaq
	public List<Faq> selectAllFaq(SqlSession session);
	
	// selectTotalCount
	public int selectTotalCount(SqlSession session);
	
	// selectOneByNo
	// deleteOneByNo
	// updateFaq
	
}
