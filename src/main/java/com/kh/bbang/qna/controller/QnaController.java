package com.kh.bbang.qna.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.qna.domain.Qna;
import com.kh.bbang.qna.domain.Reply;
import com.kh.bbang.qna.service.QnaService;
import com.kh.bbang.user.domain.User;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	@GetMapping(value="/qna/writeView.kh")
	public ModelAndView showQnaWrite(HttpSession session, ModelAndView mv) {
		mv.setViewName("qna/qnaWriteForm");
		User user = (User) session.getAttribute("login");
		if(user== null){
			mv.addObject("needLogin", "글을 작성하기 위해 로그인이 필요합니다.");
			mv.setViewName("qna/listView");
		}
		return mv;
	}
	
	@PostMapping(value="/qna/register.kh")
	public ModelAndView registQna(
			ModelAndView mv
			, @ModelAttribute Qna qna
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			,HttpServletRequest request) {
		
		try {
			String qnaFilename = uploadFile.getOriginalFilename();
			if(!qnaFilename.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\qnauploadFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String qnaFileRename 
				= sdf.format(new Date(System.currentTimeMillis()))+"."
						+qnaFilename.substring(qnaFilename.lastIndexOf(".")+1);
				File file = new File(savePath);
				if(!file.exists()) {
					file.mkdir();
				}
				uploadFile.transferTo(new File(savePath+"\\"+qnaFileRename)); 
				String qnaFilePath = savePath+"\\"+qnaFileRename;
				qna.setQnaFilename(qnaFilename);
				qna.setQnaFileRename(qnaFileRename);
				qna.setQnaFilePath(qnaFilePath);
			}
			int result = qnaService.registerQna(qna);
			mv.setViewName("redirect:/qna/list.kh");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@GetMapping(value="/qna/modifyView.kh")
	public ModelAndView qnaModifyView(
			ModelAndView mv
			,@RequestParam("qnaNo") Integer qnaNo
			,@RequestParam("page") int page) {
		try {
			Qna qna = qnaService.printOneByNo(qnaNo);
			mv.addObject("qna", qna);
			mv.addObject("page", page);
			mv.setViewName("qna/modifyForm");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@PostMapping(value="/qna/modify.kh")
	public ModelAndView qnaModify(
			@ModelAttribute Qna qna
			, ModelAndView mv
			,@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
			,@RequestParam("page") Integer page
			,HttpServletRequest request) {
		try {
			String qnaFilename = reloadFile.getOriginalFilename();
			if(reloadFile != null && !qnaFilename.equals("")) {
				
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savedPath = root + "\\qnauploadFiles";
				File file = new File(savedPath + "\\" + qna.getQnaFileRename());
				if(file.exists()) {
					file.delete();
				}
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String qnaFileRename = sdf.format(new Date(System.currentTimeMillis()))
						+ "." + qnaFilename.substring(qnaFilename.lastIndexOf(".")+1);
				String qnaFilePath = savedPath + "\\" + qnaFileRename;
				reloadFile.transferTo(new File(qnaFilePath));
				qna.setQnaFilename(qnaFilename);
				qna.setQnaFileRename(qnaFileRename);
				qna.setQnaFilePath(qnaFilePath);
			}
			int result = qnaService.modifyQna(qna);
			mv.setViewName("redirect:/qna/list.kh?page="+page);
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	@GetMapping(value="/qna/remove.kh")
	public String qnaRemove(
			HttpSession session
			, Model model
			, @RequestParam("page") Integer page) {
		try {
			int qnaNo = (int)session.getAttribute("qnaNo");
			int result = qnaService.removeOneByNo(qnaNo);
			if(result > 0) {
				session.removeAttribute("qnaNo");
			}
			return "redirect:/qna/list.kh?page="+page;
		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	@GetMapping(value="/qna/list.kh")
	public ModelAndView qnaListView(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = qnaService.getTotalCount("","");
		int qnaLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/qnaLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<Qna> qnaList = qnaService.printAllQna(currentPage, qnaLimit);
		if(!qnaList.isEmpty()) {
			mv.addObject("urlVal", "list");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("qnaList", qnaList);
		}
		mv.setViewName("qna/listView");
		return mv;
	}
	@GetMapping(value="/qna/detail.kh")
	public ModelAndView qnaDetailView(
			ModelAndView mv
			, @RequestParam("qnaNo") Integer qnaNo
			, @RequestParam("page") Integer page
			, HttpSession session) {
		try {
			boolean verified = true;
			Qna qna = qnaService.printOneByNo(qnaNo);

			int qnaSecret = qna.getQnaSecret();
			if(qnaSecret==1){
				verified = checkVerified(session, qna.getQnaWriter());
			}
			if(verified){
				List<Reply> replyList = qnaService.printAllReply(qnaNo);
				session.setAttribute("qnaNo", qna.getQnaNo());
				mv.addObject("replyList", replyList);
				mv.addObject("qna", qna);
				mv.addObject("page", page);
				mv.setViewName("qna/detailView");
				return mv;
			}
			mv.addObject("notVerified", "접근 권한이 없습니다.");
			mv.setViewName("/qna/listView");
			return mv;
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	private boolean checkVerified(HttpSession session, String qnaWriter) {
		User user = (User) session.getAttribute("login");
		if(user == null){
			return false;
		}
		if(user.getUserId().equals(qnaWriter) || user.getStatus().equals("0")){
			return true;
		}
		return false;
	}


	@GetMapping(value="/qna/search.kh")
	public ModelAndView qnaSearchList(
			ModelAndView mv
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int totalCount = qnaService.getTotalCount(searchCondition, searchValue);
			int qnaLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage = (int)((double)totalCount/qnaLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<Qna> qnaList = qnaService.printAllByValue(
					searchCondition, searchValue, currentPage, qnaLimit);
			if(!qnaList.isEmpty()) {
				mv.addObject("qnaList", qnaList);
			}else {
				mv.addObject("qnaList", null);
			}
			mv.addObject("urlVal", "search");
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.setViewName("qna/listView");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	//////////// 댓글 //////////////
	
	@PostMapping(value="/qna/addReply.kh")
	public ModelAndView addQnaReply(
			ModelAndView mv
			, @ModelAttribute Reply reply
			, @RequestParam("page") int page
			, HttpSession session) {
		User user = (User)session.getAttribute("login");
		String replyWriter = user.getUserId();

		int qnaNo = reply.getRefQnaNo();
		System.out.println("qnaNo = " + qnaNo);

		reply.setQnaReplyWriter(replyWriter);

		int result = qnaService.registerReply(reply);
		if(result > 0) {
			mv.setViewName(
			"redirect:/qna/detail.kh?qnaNo="+qnaNo+"&page="+page);
		}
		return mv;
	}
	
	@PostMapping(value="/qna/modifyReply.kh")
	public String modifyQnaReply(
			@ModelAttribute Reply reply) {
		int result = qnaService.modifyReply(reply);
		return "redirect:/qna/list.kh";
	}
	
	@PostMapping(value="/qna/removeReply.kh")
	public String removeQnaReply(
			@RequestParam("qnaReplyNo") Integer qnaReplyNo) {
		int result = qnaService.deleteReply(qnaReplyNo);
		return "redirect:/qna/list.kh";
	}
	
	
	
	/////////////// 답변 //////////////////
	@PostMapping(value="/qna/registAnswer.kh")
	public ModelAndView registAnswer(
			ModelAndView mv
			, @ModelAttribute Qna qna
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			,HttpServletRequest request
			) {
		try {
			String qnaFilename = uploadFile.getOriginalFilename();
			if(!qnaFilename.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\qnauploadFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String qnaFileRename 
				= sdf.format(new Date(System.currentTimeMillis()))+"."
						+qnaFilename.substring(qnaFilename.lastIndexOf(".")+1);
				File file = new File(savePath);
				if(!file.exists()) {
					file.mkdir();
				}
				uploadFile.transferTo(new File(savePath+"\\"+qnaFileRename)); 
				String qnaFilePath = savePath+"\\"+qnaFileRename;
				qna.setQnaFilename(qnaFilename);
				qna.setQnaFileRename(qnaFileRename);
				qna.setQnaFilePath(qnaFilePath);
			}
			int result = qnaService.registAnswer(qna);
			mv.setViewName("redirect:/qna/list.kh");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
//	@GetMapping(value="/qna/modifyAnswer.kh")
//	public ModelAndView answerModifyView(
//			ModelAndView mv
//			,@RequestParam("answerNo") Integer answerNo
//			,@RequestParam("page") int page) {
//		try {
//			Qna qna = qnaService.printAnswerOneByNo(answerNo);
//			mv.addObject("qna", qna);
//			mv.addObject("page", page);
//			mv.setViewName("qna/modifyForm");
//		} catch (Exception e) {
//			mv.addObject("msg", e.toString());
//			mv.setViewName("common/errorPage");
//		}
//		return mv;
//	}
	
	
	

}
