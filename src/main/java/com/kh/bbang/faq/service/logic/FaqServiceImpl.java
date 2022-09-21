package com.kh.bbang.faq.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bbang.faq.domain.Faq;
import com.kh.bbang.faq.service.FaqService;
import com.kh.bbang.faq.store.FaqStore;

@Service("faqService")
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
	public List<Faq> printAllFaq(int currentPage, int limit) {
		List<Faq> faqList = faqStore.selectAllFaq(session, currentPage, limit);
		return faqList;
	}

	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int totalCount = faqStore.selectTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}

	@Override
	public Faq printOneByNo(Integer FaqNo) {
		Faq Faq = faqStore.selectOneByNo(session, FaqNo);
		return Faq;
	}

	@Override
	public int removeOneByNo(int FaqNo) {
		int result = faqStore.deleteOneByNo(session, FaqNo);
		return result;
	}

	@Override
	public int modifyFaq(Faq Faq) {
		int result = faqStore.updateFaq(session, Faq);
		return result;
	}

	@Override
	public List<Faq> printAllByValue(String searchCondition, String searchValue, 
			int currentPage, int FaqLimit) {
		List<Faq> bList = faqStore.selectAllByValue(session, searchCondition, searchValue, currentPage, FaqLimit);
		return bList;
	}

	// 조회수?
	@Override
	public void faqViewCount(SqlSession session, int faqNo) {
//		faqMapper.faqViewCount(int faqNo);
		
	}
}
