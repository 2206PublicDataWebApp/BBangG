package com.kh.bbang.faq.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bbang.faq.domain.Faq;
import com.kh.bbang.faq.store.FaqStore;

@Repository
public class FaqStoreLogic implements FaqStore {

	@Override
	public int insertFaq(SqlSession session, Faq faq) {
		int result = session.insert("FaqMapper.insertFaq", faq);
		return result;
	}

	@Override
	public List<Faq> selectAllFaq(SqlSession session) {
		List<Faq> faqList = session.selectList("FaqMapper.selectAllFaq");
		return faqList;
	}

	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("FaqMapper.selectTotalCount");
		return totalCount;
	}

	

}
