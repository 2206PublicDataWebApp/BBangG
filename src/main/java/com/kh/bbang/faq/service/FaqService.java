package com.kh.bbang.faq.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.bbang.faq.domain.Faq;

public interface FaqService {

	public int registerFaq(Faq faq);

	public List<Faq> printAllFaq(int currentPage, int limit);

	public int getTotalCount(String searchCondition, String searchValue);

	public Faq printOneByNo(Integer faqNo);

	public int removeOneByNo(int faqNo);

	public int modifyFaq(Faq faq);

	public List<Faq> printAllByValue(String searchCondition, String searchValue, int currentPage, int faqLimit);

	// 조회수
	public void faqViewCount(SqlSession session, int faqNo);
}
