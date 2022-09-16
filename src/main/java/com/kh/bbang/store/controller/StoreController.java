package com.kh.bbang.store.controller;

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
	
	// 점포 리스트 페이지로 가는 것 까지만 구현했음
	@RequestMapping(value="/store/storeList.kh", method=RequestMethod.GET)
	public String storeList() {
		return "store/storeList";
	}
	
	// 점포 등록 페이지
	@RequestMapping(value="/store/storeRegistForm.kh", method=RequestMethod.GET)
	public String storeRegistForm() {
		return "store/storeRegistForm";
	}
	
	// 점포 등록
	@RequestMapping(value="/store/storeRegist.kh", method=RequestMethod.POST)
	public ModelAndView registStore(
			ModelAndView mv,
			@ModelAttribute Store store,
			@RequestParam(value="uploadFile", required=false) MultipartFile uploadFile,
			@RequestParam(value="postCode") String postCode,
			@RequestParam(value="address1") String address1,
			@RequestParam(value="address2") String address2,
			HttpServletRequest request) {
		try {
			store.setStoreLocation(postCode + "," + address1 + "," + address2); 
			int result = sService.registStore(store);
			if(result > 0) {
				mv.setViewName("redirect:/store/storeList.kh");
			}
			// 점포등록까지 성공
			// 첨부파일 입력 코드.. 근데 다른 테이블을 사용함.. 어케하는지 조사..
			// 다현, 진하님과 주소 통일여부 상의
			// SEQUENCE 점포코드 부여 방식 조사 할것 -> 001 
		}catch(Exception e) {
			
		}
		return mv;
	}
	
	@RequestMapping(value="/store/storeRemove.kh", method=RequestMethod.GET)
	public ModelAndView removeStore(ModelAndView mv) {
		int result = sService.removeStore();
		return mv;
	}
}

