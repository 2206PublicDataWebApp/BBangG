package com.kh.bbang.review.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.review.domain.Review;
import com.kh.bbang.review.service.ReviewService;
import com.kh.bbang.user.domain.User;

// @Contoller 어노테이션을 붙이면 핸들러가 스캔할 수 있는 빈(Bean) 객체가 되어 서블릿용 컨테이너에 생성됩니다
// (프레젠테이션 레이어, 웹 요청과 응답을 처리
@Controller
public class ReviewController {
	@Autowired
	private ReviewService rService;
	
	/**
	 * 
	 * @param review
	 * @return
	 */
	@RequestMapping(value = "/review/writeView.kh", method = RequestMethod.GET)
	public ModelAndView reviewWrite(@ModelAttribute Review review) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("storeNo", review.getStoreNo());
		mv.setViewName("/review/reviewWriteForm");
		return mv;
	}
	
	/**
	 * 게시글, 첨부 파일 등록 ************************* 별점기능 추가 예정 *************************
	 * @param mv
	 * @param review
	 * @return
	 *  RequestMapping 특정 메서드와 매핑하기 위해 사용
	 *  value는 요청받을 url을 설정
	 *  method는 어떤 요청으로 받을지 정의 (GET, POST, PUT, DELETE 등)
	 */
	@RequestMapping(value = "/review/register.kh", method = RequestMethod.POST)
	public ModelAndView reviewRegist(
			ModelAndView mv
			, @ModelAttribute Review review
			// ModelAttribute 1. 파라미터로 넘겨 준 타입의 오브젝트를 자동으로 생성한다. 2. 생성된 오브젝트(test) HTTP로 넘어 온 값들을 자동으로 바인딩한다.
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile 
			// 쿼리 스트링 정보를 가져오는 데 사용 // (required=false)로 지정하면 해당 키값이 존재하지 않다고 해서 BadRequest가 발생하지 않는다.
			, HttpServletRequest request
			) {
		
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("login");
			review.setReviewWriter(user.getUserId());
			String reviewFilename = uploadFile.getOriginalFilename();
			if(!reviewFilename.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\reviewUploadFiles";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String reviewFileRename = sdf.format(new Date(System.currentTimeMillis())) +"."+ reviewFilename.substring(reviewFilename.lastIndexOf(".")+1);
				File file = new File(savePath);
				if(!file.exists()) {
					file.mkdir();
				}
				uploadFile.transferTo(new File(savePath+"\\"+reviewFileRename));
				// 파일 review/review-image 경로에 저장 하는 메소드
				String reviewFilepath = savePath+"\\"+reviewFileRename;
				review.setReviewFilename(reviewFilename);
				review.setReviewFileRename(reviewFileRename);
				review.setReviewFilepath(reviewFilepath);
			}
			int result = rService.registeReview(review);
			mv.setViewName("redirect:/review/list.kh");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg",e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	 /**
	  * 게시글 수정 화면 ************************* 별점기능 추가 예정 *************************
	  * @param mv
	  * @param reviewNo
	  * @param page
	  * @return
	  */
	 @RequestMapping(value = "/review/modifyView.kh", method = RequestMethod.GET)
	 public ModelAndView reviewModifyView(
			 ModelAndView mv 
			 ,@RequestParam("reviewNo") Integer reviewNo
//			 ,@RequestParam("page")int page
			 ){
		 try {
			 Review review = rService.printOneByNo(reviewNo);
			 mv.addObject("review", review);
//			 mv.addObject("page", page);
			 mv.setViewName("review/reviewModify");
			 }catch (Exception e) {
				mv.addObject("msg", e.toString());
				mv.setViewName("common/errorPage");
			}
			 return mv;
			 
		 }
		 
	 /**
	  * 게시글 수정 ************************* 별점기능 추가 예정 *************************
	  * @param review
	  * @param mv
	  * @param reloadFile
	  * @param page
	  * @param request
	  * @return
	  */
	@RequestMapping(value="/review/modify.kh", method = RequestMethod.POST)
	public ModelAndView reviewModify(
			@ModelAttribute Review review
			,ModelAndView mv
			,@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile
//			,@RequestParam("page") Integer page
			,HttpServletRequest request) {
		try {
			String reviewFilename = reloadFile.getOriginalFilename();
			if(reloadFile != null && !reviewFilename.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\reviewUploadFiles";
				File file = new File(savePath + "\\" + review.getReviewFileRename());
				if(file.exists()) {
					file. delete();
				}
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String reviewFileRename = sdf.format(new Date (System.currentTimeMillis())) + "." + reviewFilename.substring(reviewFilename.lastIndexOf(".")+1);
				String reviewFilepath = savePath + "\\" + reviewFileRename;
				reloadFile.transferTo(new File(reviewFilepath));
				review.setReviewFilename(reviewFilename);
				review.setReviewFileRename(reviewFileRename);
				review.setReviewFilepath(reviewFilepath);
			}
			int result = rService.modifyReview(review);
//			mv.setViewName("redirect:/review/list.kh?page="+page);
			mv.setViewName("redirect:/review/detail.kh?reviewNo="+review.getReviewNo());
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 *  게시물 삭제 
	 * @param session
	 * @param model
	 * @param page
	 * @return
	 */
	 @RequestMapping(value = "/review/remove.kh", method = RequestMethod.GET)
	 public String reviewRemove(
			 HttpSession session 
			 ,Model model
			 ,@RequestParam("reviewNo")int reviewNo
//			 ,@RequestParam("page")Integer page
			 ) {
		  try {
//			int reviewNo = (int)session.getAttribute("reviewNo");
			int result = rService.removeOneByNo(reviewNo);
//			if(result > 0) {
//				session.removeAttribute("reviewNo");
//			}
//			return "redirect:/review/list.kh?page="+page;
			return "redirect:/review/list.kh";
			
		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	 
	 }
	/**
	 * 게시글 상세 조회
	 * @param mv
	 * @param reviewNo
	 * @param session
	 * @return
	 */
	
	@RequestMapping(value = "/review/detail.kh", method=RequestMethod.GET)
	public ModelAndView reviewDetailView(
			ModelAndView mv
			, @RequestParam("reviewNo") Integer reviewNo
//			, @RequestParam("page") Integer page
			, HttpSession session) {
		try {
			System.out.println("reviewNo="+reviewNo);
			Review review = rService.printOneByNo(reviewNo);
			// List<ReviewComment> cList = rService.printAllComment(reivewNo);
//			session.setAttribute("reviewNo", review.getReviewNo());
			// mv.addObject("rList", attributeValue) List.jsp에 page있음 
			// mv.addObject("cList", cList); //commentList
			mv.addObject("review", review);
//			mv.addObject("page", page); 
			mv.setViewName("review/detail") ;
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}


	/**
	 * 게시글 리스트
	 * @param mv
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/review/list.kh", method = RequestMethod.GET)
	public ModelAndView reviewListView(
			ModelAndView mv
			,@RequestParam(value="page", required = false) Integer page) {
		// (required=false)로 지정하면 해당 키값이 존재하지 않다고(null) 해서 BadRequest가 발생하지 않는다.
		int currentPage = (page != null) ? page : 1;
		int totalCount = rService.getTotalCount("","");	// 전체 게시물 개수
		int listLimit = 20;	// 페이지당 보여질 게시물의 개수
		int naviLimit = 5;	// 보여질 페이지의 개수
		int maxPage;	// 전체 페이지 수
		int startNavi;	// 페이징 바 시작 번호
		int endNavi;	// 페이징 바 마지막 번호
		maxPage = (int)((double)totalCount/listLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<Review> rList= rService.printAllReview(currentPage, listLimit);
		if(!rList.isEmpty()) {
			mv.addObject("urlVal", "list");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("rList", rList);
		}
		mv.setViewName("/review/reviewList");
		return mv;
	}
	/**
	 * 게시글 추천 기능 ---------진행중---------
	 * @param mv
	 * @param review
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/review/heartCountUpdate.kh", method = RequestMethod.GET)
	public ModelAndView heartCountUpdate(
			ModelAndView mv
			, @ModelAttribute Review review
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("login");
		review.setUserId(user.getUserId());
		int result = rService.insertHeartCount(review);
		if(review.getStoreNo() == 0 ) {
			mv.setViewName("redirect:/review/detail.kh?reviewNo="+review.getReviewNo());			
		}else {
			mv.setViewName("redirect:/store/storeDetail.kh?storeNo="+review.getStoreNo());
		}
		return mv;
	}
	/**
	 * 게시글 조건 검색
	 * @param mv
	 * @param searchCondition
	 * @param searchValue
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/review/search.kh", method = RequestMethod.GET)
	public ModelAndView reviewSearchList(
			ModelAndView mv
			,@RequestParam("searchCondition")String searchCondition
			,@RequestParam("searchValue") String searchValue
			,@RequestParam(value = "page", required = false)Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int totalCount = rService.getTotalCount(searchCondition, searchValue);
			int listLimit = 20;
			int naviLimit = 5;	
			int maxPage;	
			int startNavi;	
			int endNavi;	
			maxPage = (int)((double)totalCount/listLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<Review> rList = rService.printAllByValue(searchCondition, searchValue, currentPage, listLimit);
			if(!rList.isEmpty()) {
				mv.addObject("rList", rList);
			}else {
				mv.addObject("rList", null);
			}
			mv.addObject("urlVal", "serach");
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.setViewName("review/reviewList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
	
}
