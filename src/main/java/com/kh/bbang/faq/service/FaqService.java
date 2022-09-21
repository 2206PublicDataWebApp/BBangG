package com.kh.bbang.faq.service;

import java.util.List;

import com.kh.bbang.faq.domain.Faq;

public interface FaqService {
	
	//registerFaq
	public int registerFaq(Faq faq);
	
	//printAllFaq
	
	public List<Faq> printAllFaq(int currentPage, int limit);
	
	// getTotalCount
	public int getTotalCount(String searchCondition, String searchValue);
	
	// printOneByNo
		public Faq printOneByNo(Integer faqNo);
		
		//removeOneByNo
		public int removeOneByNo(int faqNo);
		
		// modifyfaq
		public int modifyFaq(Faq faq);
		
		public List<Faq> printAllByValue(String searchCondition, String searchValue, 
				int currentPage, int faqLimit);
}
