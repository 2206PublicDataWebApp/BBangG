package com.kh.bbang.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.review.domain.Review;

@Controller
public class ReviewController {
	@Autowired
//	private ReviewService rService;
	
	/**
	 * 게시글 등록 화면
	 * @return
	 */
	@RequestMapping(value = "/review/writeView", method = RequestMethod.GET)
	public String reviewWrite() {
		return "review/reviewWriteForm";
	}
	
	/**
	 * 게시글 등록
	 * @param mv
	 * @param review
	 * @return
	 *  RequestMapping 특정 메서드와 매핑하기 위해 사용
	 *  value는 요청받을 url을 설정
	 *  method는 어떤 요청으로 받을지 정의 (GET, POST, PUT, DELETE 등)
	 */
	@RequestMapping(value = "/review/registe", method = RequestMethod.POST)
	public ModelAndView reviewRegister(
			ModelAndView mv
			, @ModelAttribute Review review
			// ModelAttribute 1. 파라미터로 넘겨 준 타입의 오브젝트를 자동으로 생성한다. 2. 생성된 오브젝트(test) HTTP로 넘어 온 값들을 자동으로 바인딩한다.
			, @RequestParam(value="reviewFile", required = false) MultipartFile reviewFile 
			// 쿼리 스트링 정보를 가져오는 데 사용 // (required=false)로 지정하면 해당 키값이 존재하지 않다고 해서 BadRequest가 발생하지 않는다.
			, HttpServletRequest request) {
		
		return mv;
		
	}
}
