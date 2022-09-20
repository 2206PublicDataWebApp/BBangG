package com.kh.bbang.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.faq.domain.Faq;
import com.kh.bbang.faq.service.FaqService;

@Controller
public class FaqController {

	@Autowired
	private FaqService faqService;

	@GetMapping(value = "/faq/writeView.kh")
	public ModelAndView showFaqWrite(ModelAndView mv) {

		return mv;
	}

	@PostMapping(value = "/faq/register.kh")
	public ModelAndView registerFaq(ModelAndView mv, @ModelAttribute Faq faq) {
		try {
			int result = faqService.registerFaq(faq);
			mv.setViewName("redirect:/faq/list.kh");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	@GetMapping(value = "/faq/list.kh")
	public ModelAndView faqListView(ModelAndView mv,
			@RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = faqService.getTotalCount();
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1) * naviLimit + 1;
		endNavi = startNavi + naviLimit -1;
		if (maxPage < endNavi) {
			endNavi = maxPage;
		}
		
		
		List<Faq> faqList = faqService.printAllFaq();
		if (!faqList.isEmpty()) {
			mv.addObject("faqList", faqList);
		}
		mv.setViewName("faq/listView");
		return mv;
	}

}
