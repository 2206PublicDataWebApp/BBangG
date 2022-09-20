package com.kh.bbang.faq.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.faq.domain.Faq;
import com.kh.bbang.faq.service.FaqService;
import com.kh.bbang.faq.store.FaqStore;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private FaqStore faqStore;
	
	@Override
	public int registerFaq(Faq faq) {
		int result = faqStore.insertFaq(session, faq);
		return result;
	}

	@Override
	public List<Faq> printAllFaq() {
		List<Faq> faqList = faqStore.selectAllFaq(session);
		return faqList;
	}

	@Override
	public int getTotalCount() {
		int totalCount = faqStore.selectTotalCount(session);
		return totalCount;
	}

	
}
