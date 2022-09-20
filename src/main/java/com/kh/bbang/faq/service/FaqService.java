package com.kh.bbang.faq.service;

import java.util.List;

import com.kh.bbang.faq.domain.Faq;

public interface FaqService {
	
	//registerFaq
	public int registerFaq(Faq faq);
	
	//printAllFaq
	
	public List<Faq> printAllFaq();
	
	// getTotalCount
	public int getTotalCount();
	
	// printOneByNo
	// removeOneByNo
	// modifyFaq
}
