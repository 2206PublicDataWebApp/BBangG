package com.kh.bbang.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.product.domain.Product;
import com.kh.bbang.product.service.ProductService;
import com.kh.bbang.review.domain.Review;
import com.kh.bbang.review.service.ReviewService;
import com.kh.bbang.store.domain.Store;
import com.kh.bbang.store.domain.StoreImage;
import com.kh.bbang.store.service.StoreService;
import com.kh.bbang.user.domain.User;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService sService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private ReviewService rService;
	
	//관리자 점포 리스트
	@RequestMapping(value="/store/adminStoreList.kh", method=RequestMethod.GET)
	public ModelAndView adminStoreList(
			ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page,
			HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("login");
			if(user.getStatus().equals("0")) {
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
			}else {
				mv.setViewName("common/alert");
			}
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
		int storeLimit = 12;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		
		maxPage = (int) ((double)totalCount / storeLimit + 1);
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
	public ModelAndView storeRegistForm(
			HttpServletRequest request,
			ModelAndView mv) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("login");
		if(user.getStatus().equals("0")) {
			mv.setViewName("/store/storeRegistForm");
		}else {
			mv.setViewName("common/alert");
		}
		return mv;
	}
	
	// 점포 등록
	@RequestMapping(value="/store/registStore.kh", method=RequestMethod.POST)
	public ModelAndView registStore(
			ModelAndView mv,
			@ModelAttribute Store store,
			@ModelAttribute StoreImage sImage,
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile,
			HttpServletRequest request) {
		try {
			String storeFilename = uploadFile.getOriginalFilename();
			if(!uploadFile.getOriginalFilename().equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\image\\store-images";
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
				String storeFileRename = sdf.format(new Date(System.currentTimeMillis()))+store.getStoreName()+"."+storeFilename.substring(storeFilename.lastIndexOf(".")+1);
				File file = new File(savePath);
				if(!file.exists()) {
					file.mkdir();
				}
				uploadFile.transferTo(new File(savePath+"\\"+storeFileRename));
				String storeFilepath = savePath+"\\"+storeFileRename;
				sImage.setStoreFilename(storeFilename);
				sImage.setStoreFileRename(storeFileRename);
				sImage.setStoreFilepath(storeFilepath);
			}
			int result = sService.registStore(store);
			sImage.setRefStoreNo(store.getStoreNo());
			int result2 = sService.registStoreImage(sImage);
			if(result > 0 && result2 > 0) {
				mv.setViewName("redirect:/store/adminStoreList.kh");
			}
		}catch(Exception e) {
			mv.addObject("msg",e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 점포 상세 조회 
	@RequestMapping(value="/store/storeDetail.kh", method=RequestMethod.GET)
	public ModelAndView showStoreDetail(
			ModelAndView mv,
			@RequestParam Integer storeNo) {
		
		Store store = sService.showOneStoreById(storeNo);
		List<Product> pList = pService.printAllProduct(storeNo);
		Product product1 = pList.get(0);
		Product product2 = pList.get(1);
		Product product3 = pList.get(2);
		Review review = rService.printOneByNo(9);
		System.out.println(review);
		if(store != null) {
			mv.addObject("store",store);
			mv.addObject("product1", product1);
			mv.addObject("product2", product2);
			mv.addObject("product3", product3);
			mv.addObject("review",review);
			mv.setViewName("/store/storeDetailView");
		}
		return mv;
	}
	
	// 점포 삭제
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
	
	// 점포 수정 화면
	@RequestMapping(value="/store/modifyStore.kh", method=RequestMethod.GET)
	public ModelAndView storeModifyView(
			ModelAndView mv,
			@RequestParam Integer storeNo,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("login");
		if(user.getStatus().equals("0")) {
			Store store = sService.showOneStoreById(storeNo);
			mv.addObject("store", store);
			mv.setViewName("/store/storeModifyForm");
		}else {
			mv.setViewName("common/alert");
		}
		return mv;
	}
	
	// 정보 수정 
	@RequestMapping(value="/store/storeModify.kh", method=RequestMethod.POST)
	public ModelAndView modifyStore(
			ModelAndView mv,
			@ModelAttribute Store store,
			@ModelAttribute StoreImage sImage,
			@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile,
			
			HttpServletRequest request) {
		try {
			String storeFilename = reloadFile.getOriginalFilename();
			if(reloadFile != null && !storeFilename.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savedPath = root + "\\image\\store-images";
				File file = new File(savedPath + "\\" + sImage.getStoreFileRename());
				if(file.exists()) {
					file.delete();
				}
				String storeFileRename = store.getStoreName()+"."+storeFilename.substring(storeFilename.lastIndexOf(".")+1);
				String storeFilepath = savedPath+"\\"+storeFileRename;
				reloadFile.transferTo(new File(storeFilepath));
				sImage.setRefStoreNo(store.getStoreNo());
				sImage.setStoreFilename(storeFilename);
				sImage.setStoreFileRename(storeFileRename);
				sImage.setStoreFilepath(storeFilepath);
			}
			int result = sService.modifyStore(store);
			int result2 = sService.modifyStoreImage(sImage);
			if(result > 0 && result2 > 0) {
				mv.setViewName("redirect:/store/adminStoreList.kh");
				
			}
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
				//페이징처리
				int currentPage = (page != null) ? page : 1;
				int totalCount = sService.getTotalCount(searchCondition,searchValue);
				int storeLimit = 12;
				int naviLimit = 5;
				int maxPage;
				int startNavi;
				int endNavi;
				
				maxPage = (int) ((double)totalCount / storeLimit + 1);
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
				int storeLimit = 12;
				int naviLimit = 5;
				int maxPage;
				int startNavi;
				int endNavi;
				
				maxPage = (int) ((double)sortCount / storeLimit + 1);
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

