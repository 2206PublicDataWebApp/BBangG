package com.kh.bbang.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.faq.domain.Faq;
import com.kh.bbang.faq.service.FaqService;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	@GetMapping(value="/faq/writeView.kh")
	public ModelAndView showFaqWrite(
			ModelAndView mv) {
		
		return mv;
	}
	
	@PostMapping(value="/faq/register.kh")
	public ModelAndView registerFaq(
			ModelAndView mv,
			@ModelAttribute Faq faq) {
		try {
			int result = faqService.registerFaq(faq);
			mv.setViewName("redirect:/faq/list.kh");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		
				return mv;
	}
}
