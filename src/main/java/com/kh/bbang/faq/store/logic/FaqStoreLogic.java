package com.kh.bbang.faq.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bbang.faq.domain.Faq;
import com.kh.bbang.faq.store.FaqStore;

@Repository
public class FaqStoreLogic implements FaqStore {

	@Override
	public int insertFaq(SqlSession session, Faq faq) {
		int result = session.insert("", faq);
		return result;
	}

	

}
