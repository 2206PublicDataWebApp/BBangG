package com.kh.bbang.store.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.store.domain.Store;
import com.kh.bbang.store.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService sService;
	
	//관리자 점포 리스트 - 페이징완료
	@RequestMapping(value="/store/adminStoreList.kh", method=RequestMethod.GET)
	public ModelAndView adminStoreList(
			ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		//페이징처리
				int currentPage = (page != null) ? page : 1;
				int totalCount = sService.getTotalCount("","");
				int storeLimit = 10;
				int naviLimit = 5;
				int maxPage;
				int startNavi;
				int endNavi;
				
				maxPage = (int) ((double)totalCount / storeLimit + 0.9);
				startNavi = ((int)((double)currentPage / naviLimit + 0.9) -1) * naviLimit + 1;
				endNavi = startNavi + naviLimit - 1;
				if(maxPage < endNavi) {
					endNavi = maxPage;
				}
				
		List<Store> sList = sService.showAllStore(currentPage, storeLimit);
		if(!sList.isEmpty()) {
			mv.addObject("urlVal","adminStoreList");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("sList", sList);
		}
		mv.setViewName("store/adminStoreList");
		return mv;
	}
	
	//사용자 점포 리스트
	
	@RequestMapping(value="/store/userStoreList.kh", method=RequestMethod.GET)
	public ModelAndView userStoreList(
			ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		//페이징처리
		int currentPage = (page != null) ? page : 1;
		int totalCount = sService.getTotalCount("","");
		int storeLimit = 9;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int) ((double)totalCount / storeLimit + 0.9);
		startNavi = ((int)((double)currentPage / naviLimit + 0.9) -1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		
		
		List<Store> sList = sService.showAllStore(currentPage, storeLimit);
		if(!sList.isEmpty()) {
			mv.addObject("urlVal","userStoreList");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("sList", sList);
			
		}
		mv.setViewName("store/userStoreList");
		return mv;
	}
	
	// 점포 등록 페이지
	@RequestMapping(value="/store/storeRegistForm.kh", method=RequestMethod.GET)
	public String storeRegistForm() {
		return "store/storeRegistForm";
	}
	
	// 점포 등록
	@RequestMapping(value="/store/registStore.kh", method=RequestMethod.POST)
	public ModelAndView registStore(
			ModelAndView mv,
			@ModelAttribute Store store,   
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile,
			HttpServletRequest request) {
		try {
			String storeFilename = uploadFile.getOriginalFilename();
			if(!uploadFile.getOriginalFilename().equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				System.out.println(root);
				String savePath = root + "\\image\\store-images";
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
				String storeFileRename = sdf.format(new Date(System.currentTimeMillis()))+store.getStoreName()+"."+storeFilename.substring(storeFilename.lastIndexOf(".")+1);
				File file = new File(savePath);
				if(!file.exists()) {
					file.mkdir();
				}
				uploadFile.transferTo(new File(savePath+"\\"+storeFileRename));
				String storeFilepath = savePath+"\\"+storeFileRename;
				store.setStoreFilename(storeFilename);
				store.setStoreFileRename(storeFileRename);
				store.setStoreFilepath(storeFilepath);
			}
			int result = sService.registStore(store);
			mv.setViewName("redirect:/store/adminStoreList.kh");
			
			// 첨부파일 입력 코드.. 근데 다른 테이블을 사용함.. 어케하는지 조사..
			// SEQUENCE 점포코드 부여 방식 조사 할것 -> 001 
		}catch(Exception e) {
			mv.addObject("msg",e.getMessage());
			mv.setViewName("/common/errorPage");
		}
		return mv;
	}
	
	// 점포 상세 조회 - 기초 완료 
	@RequestMapping(value="/store/storeDetail.kh", method=RequestMethod.GET)
	public ModelAndView showStoreDetail(
			ModelAndView mv,
			@RequestParam Integer storeNo) {
		
		Store store = sService.showOneStoreById(storeNo);
		if(store != null) {
			mv.addObject("store",store);
			mv.setViewName("/store/storeDetailView");
		}
		return mv;
	}
	
	// 점포 삭제 - 기초 완료
	@RequestMapping(value="/store/removeStore.kh", method=RequestMethod.GET)
	public ModelAndView removeStore(
			ModelAndView mv,
			@RequestParam("storeNo") Integer storeNo) {
		try {
			int result = sService.removeStore(storeNo);
			if(result > 0) {
				mv.setViewName("redirect:/store/adminStoreList.kh");
			}
		}catch(Exception e) {
			mv.addObject("msg",e.toString());
			
			mv.setViewName("/common/errorPage");
		}
		return mv;
	}
	
	// 점포 수정 화면 - 기초 완료
	@RequestMapping(value="/store/modifyStore.kh", method=RequestMethod.GET)
	public ModelAndView storeModifyView(
			ModelAndView mv,
			@RequestParam Integer storeNo) {
		Store store = sService.showOneStoreById(storeNo);
		mv.addObject("store", store);
		mv.setViewName("/store/storeModifyForm");
		return mv;
	}
	
	// 정보 수정 - 기초완료 
	@RequestMapping(value="/store/storeModify.kh", method=RequestMethod.POST)
	public ModelAndView modifyStore(
			ModelAndView mv,
			@ModelAttribute Store store,
			@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile,
			
			HttpServletRequest request) {
		try {
			String storeFilename = reloadFile.getOriginalFilename();
			if(reloadFile != null && !storeFilename.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savedPath = root + "\\image\\store-images";
				File file = new File(savedPath + "\\" + store.getStoreFileRename());
				if(file.exists()) {
					file.delete();
				}
				String storeFileRename = store.getStoreName()+"."+storeFilename.substring(storeFilename.lastIndexOf(".")+1);
				String storeFilepath = savedPath+"\\"+storeFileRename;
				reloadFile.transferTo(new File(storeFilepath));
				store.setStoreFilename(storeFilename);
				store.setStoreFileRename(storeFileRename);
				store.setStoreFilepath(storeFilepath);
			}
			int result = sService.modifyStore(store);
			mv.setViewName("redirect:/store/adminStoreList.kh");
		}catch(Exception e) {
			mv.addObject("msg",e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 관라자 검색 기능
	@RequestMapping(value="/store/storeSearch.kh", method=RequestMethod.GET)
	public ModelAndView storeSearchedList(
			ModelAndView mv,
			@RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchValue") String searchValue,
			@RequestParam(value="page", required=false) Integer page) {
		try {
			//페이징처리
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getTotalCount(searchCondition,searchValue);
			int storeLimit = 10;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			
			maxPage = (int) ((double)totalCount / storeLimit + 0.9);
			startNavi = ((int)((double)currentPage / naviLimit + 0.9) -1) * naviLimit + 1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			
			List<Store> sList = sService.showSearchedStore(searchCondition, searchValue, currentPage, storeLimit);
			if(!sList.isEmpty()) {
				mv.addObject("sList", sList);
			}else {
				mv.addObject("sList", null);
			}
			mv.addObject("urlVal", "storeSearch");
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue",searchValue);
			mv.addObject("maxPage",maxPage);
			mv.addObject("currentPage",currentPage);
			mv.addObject("startNavi",startNavi);
			mv.addObject("endNavi",endNavi);
			mv.setViewName("store/adminStoreList");
		}catch(Exception e) {
			mv.addObject("msg",e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 사용자 검색
		@RequestMapping(value="/store/userStoreSearch.kh", method=RequestMethod.GET)
		public ModelAndView userStoreSearchedList(
				ModelAndView mv,
				@RequestParam("searchCondition") String searchCondition,
				@RequestParam("searchValue") String searchValue,
				@RequestParam(value="page", required=false) Integer page) {
			try {
				System.out.println(searchCondition);
				System.out.println(searchValue);
				//페이징처리
				int currentPage = (page != null) ? page : 1;
				int totalCount = sService.getTotalCount(searchCondition,searchValue);
				int storeLimit = 9;
				int naviLimit = 5;
				int maxPage;
				int startNavi;
				int endNavi;
				
				maxPage = (int) ((double)totalCount / storeLimit + 0.9);
				startNavi = ((int)((double)currentPage / naviLimit + 0.9) -1) * naviLimit + 1;
				endNavi = startNavi + naviLimit - 1;
				if(maxPage < endNavi) {
					endNavi = maxPage;
				}
				
				List<Store> sList = sService.showSearchedStore(searchCondition, searchValue, currentPage, storeLimit);
				if(!sList.isEmpty()) {
					mv.addObject("sList", sList);
				}else {
					mv.addObject("sList", null);
				}
				mv.addObject("urlVal", "storeSearch");
				mv.addObject("searchCondition", searchCondition);
				mv.addObject("searchValue",searchValue);
				mv.addObject("maxPage",maxPage);
				mv.addObject("currentPage",currentPage);
				mv.addObject("startNavi",startNavi);
				mv.addObject("endNavi",endNavi);
				mv.setViewName("store/userStoreList");
			}catch(Exception e) {
				mv.addObject("msg",e.toString()).setViewName("common/errorPage");
			}
			return mv;
		}
		
		// sort
		@RequestMapping(value="/store/userStoreSort.kh", method=RequestMethod.GET)
		public ModelAndView userStoreSortByRegion(
				ModelAndView mv,
				@RequestParam(value="page", required=false) Integer page,
				@RequestParam(value="region1") String region1,
				@RequestParam(value="region2") String region2) {
			try {
				//페이징처리
				int currentPage = (page != null) ? page : 1;
				int sortCount = sService.getSortCount(region1,region2);
				int storeLimit = 9;
				int naviLimit = 5;
				int maxPage;
				int startNavi;
				int endNavi;
				
				maxPage = (int) ((double)sortCount / storeLimit + 0.9);
				startNavi = ((int)((double)currentPage / naviLimit + 0.9) -1) * naviLimit + 1;
				endNavi = startNavi + naviLimit - 1;
				if(maxPage < endNavi) {
					endNavi = maxPage;
				}
				List<Store> sList = sService.showSortedStore(region1, region2, currentPage, storeLimit);
				if(!sList.isEmpty()) {
					mv.addObject("sList", sList);
				}else {
					mv.addObject("sList", null);
				}
				mv.addObject("urlVal", "userStoreSort");
				mv.addObject("region1", region1);
				mv.addObject("region2",region2);
				mv.addObject("maxPage",maxPage);
				mv.addObject("currentPage",currentPage);
				mv.addObject("startNavi",startNavi);
				mv.addObject("endNavi",endNavi);
				mv.setViewName("store/userStoreList");
			}catch(Exception e) {
				mv.addObject("msg",e.toString()).setViewName("common/errorPage");
			}
			return mv;
		}
}

