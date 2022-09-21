package com.kh.bbang.faq.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.faq.domain.Faq;
import com.kh.bbang.faq.service.FaqService;

@Controller
public class FaqController {

	@Autowired
	private FaqService faqService;

	@GetMapping(value = "/faq/writeView.kh")
	public String showFaqWrite() {
		return "faq/faqWriteForm";
	}

	@PostMapping(value = "/faq/register.kh")
	public ModelAndView registerFaq(ModelAndView mv, @ModelAttribute Faq faq,
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile,
			HttpServletRequest request) {
		try {
			String faqFilename = uploadFile.getOriginalFilename();
			if (!faqFilename.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\faquploadFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String faqFileRename = sdf.format(new Date(System.currentTimeMillis())) + "."
						+ faqFilename.substring(faqFilename.lastIndexOf(".") + 1);
				File file = new File(savePath);
				if (!file.exists()) {
					file.mkdir();
				}
				uploadFile.transferTo(new File(savePath + "\\" + faqFileRename));
				String faqFilepath = savePath + "\\" + faqFileRename;
				faq.setFaqFilename(faqFilename);
				faq.setFaqFileRename(faqFileRename);
				faq.setFaqFilepath(faqFilepath);
			}
			int result = faqService.registerFaq(faq);
			mv.setViewName("redirect:/faq/list.kh");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}

	@GetMapping(value = "/faq/list.kh")
	public ModelAndView faqListView(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		/////////////////////////////////////////////////////////////////////////
		int currentPage = (page != null) ? page : 1;
		int totalCount = faqService.getTotalCount("","");
		int faqLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		// 23/5 = 4.8 + 0.9 = 5(.7)
		maxPage = (int)((double)totalCount/faqLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		
		List<Faq> faqList = faqService.printAllFaq(currentPage, faqLimit);
		if(!faqList.isEmpty()) {
			mv.addObject("urlValue", "list");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("faqList", faqList);
		}
		mv.setViewName("faq/listView");
		return mv;
	}
	
	@GetMapping(value = "/faq/detail.kh")
	public ModelAndView faqDetailView(ModelAndView mv, @RequestParam("faqNo") Integer faqNo,
			@RequestParam("page") Integer page, HttpSession session) {
		try {
			Faq faq = faqService.printOneByNo(faqNo);
			session.setAttribute("faqNo", faq.getFaqNo());
			mv.addObject("faq", faq);
			mv.addObject("page", page);
			mv.setViewName("faq/detailView");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@GetMapping(value = "/faq/remove.kh")
	public String faqRemove(HttpSession session, Model model,
			@RequestParam("page") Integer page) {
		try {
			int faqNo = (int) session.getAttribute("faqNo");
			int result = faqService.removeOneByNo(faqNo);
			if (result > 0) {
				session.removeAttribute("faqNo");
			}
			return "redirect:/faq/list.kh?page=" + page;
		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}

	@GetMapping("/faq/modifyView.kh")
	public ModelAndView faqModifyView(@RequestParam("faqNo") Integer faqNo, ModelAndView mv) {
		try {
			Faq faq = faqService.printOneByNo(faqNo);
			mv.addObject("faq", faq);
			mv.setViewName("faq/modifyForm");
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	@PostMapping(value = "/faq/modify.kh")
	public ModelAndView faqModify(@ModelAttribute Faq faq, ModelAndView mv,
			@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile,
			@RequestParam("page") Integer page, HttpServletRequest request) {
		try {
			String faqFilename = reloadFile.getOriginalFilename();
			if (reloadFile != null && !faqFilename.equals("")) {
				// 파일삭제
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savedPath = root + "\\faquploadFiles";
				File file = new File(savedPath + "\\" + faq.getFaqFileRename());
				if (file.exists()) {
					file.delete();
				}
				// 파일 다시 저장
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String faqFileRename = sdf.format(new Date(System.currentTimeMillis())) + "."
						+ faqFilename.substring(faqFilename.lastIndexOf(".") + 1);
				String faqFilepath = savedPath + "\\" + faqFileRename;
				reloadFile.transferTo(new File(faqFilepath));
				faq.setFaqFilename(faqFilename);
				faq.setFaqFileRename(faqFileRename);
				faq.setFaqFilepath(faqFilepath);
			}
			int result = faqService.modifyFaq(faq);
			mv.setViewName("redirect:/faq/list.kh?page=" + page);
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}

	@GetMapping(value = "/faq/search.kh")
	public ModelAndView faqSearchList(
			ModelAndView mv
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int totalCount = faqService.getTotalCount(searchCondition, searchValue);
			int faqLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage = (int)((double)totalCount/faqLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<Faq> faqList = faqService.printAllByValue(
					searchCondition, searchValue, currentPage, faqLimit);
			if(!faqList.isEmpty()) {
				mv.addObject("faqList", faqList);
			}else {
				mv.addObject("faqList", null);
			}
			mv.addObject("urlValue", "search");
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.setViewName("faq/listView");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}

}
