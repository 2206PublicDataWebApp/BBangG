package com.kh.bbang.faq.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.faq.domain.Faq;

public interface FaqStore {

	//inserFaq
	public int insertFaq(SqlSession session, Faq faq);
	
	//selectAllFaq
	// selectTotalCount
	// selectOneByNo
	// deleteOneByNo
	// updateFaq
	
}
