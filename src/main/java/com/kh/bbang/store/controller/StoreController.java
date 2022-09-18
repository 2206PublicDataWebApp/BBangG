package com.kh.bbang.store.controller;

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
	
	//관리자 점포 리스트 - DB에서 정보 불러오기까지 성공
	@RequestMapping(value="/store/adminStoreList.kh", method=RequestMethod.GET)
	public ModelAndView storeList(ModelAndView mv) {
		List<Store> sList = sService.showAllStore();
		if(!sList.isEmpty()) {
			mv.addObject("sList", sList);
			mv.setViewName("store/adminStoreList");
		}
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
			int result = sService.registStore(store);
			if(result > 0) {
				mv.setViewName("redirect:/store/adminStoreList.kh");
			}
			// 점포등록까지 성공
			// 첨부파일 입력 코드.. 근데 다른 테이블을 사용함.. 어케하는지 조사..
			// 다현, 진하님과 주소 통일여부 상의
			// SEQUENCE 점포코드 부여 방식 조사 할것 -> 001 
		}catch(Exception e) {
			
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
	

}

