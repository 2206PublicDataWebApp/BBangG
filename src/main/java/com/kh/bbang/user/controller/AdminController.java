package com.kh.bbang.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.user.domain.User;
import com.kh.bbang.user.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService aService;
	
	@RequestMapping(value="/admin/userList", method=RequestMethod.GET)
	public ModelAndView AdminListView(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = aService.getTotalCount("","");
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<User> uList = aService.printAllUser(currentPage, boardLimit);
		if(!uList.isEmpty()) {
			mv.addObject("urlVal", "userList");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("uList", uList);
		}
		mv.setViewName("admin/adminUserList");
		return mv;
	}
	
	@RequestMapping(value="/admin/userSearch", method=RequestMethod.GET)
	public ModelAndView userSearchList(
			ModelAndView mv
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int totalCount = aService.getTotalCount(searchCondition, searchValue);
			int boardLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage = (int)((double)totalCount/boardLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<User> uList = aService.printAllbyValue(searchCondition, searchValue, currentPage, boardLimit);
			if(!uList.isEmpty()) {
				mv.addObject("uList", uList);
			}else {
				mv.addObject("uList", null);
			}
			mv.addObject("urlVal", "userSearch");
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.setViewName("admin/adminUserList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/admin/remove", method=RequestMethod.GET)
	public ModelAndView useRemove(
			ModelAndView mv
			, User user
			, @RequestParam("id") String userId) {
		try {
			user.setUserId(userId);
			int result = aService.removeUser(userId);
			if(result > 0) {
				mv.setViewName("admin/adminUserRemove");
			}else {
				mv.addObject("msg", "존재하지 않는 아이디 입니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
}
