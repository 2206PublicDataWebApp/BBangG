package com.kh.bbang.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.store.domain.Store;
import com.kh.bbang.store.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService sService;
	
	@RequestMapping(value="/store/storeList.kh", method=RequestMethod.GET)
	public String storeList() {
		return "store/storeList";
	}
	
	@RequestMapping(value="/store/storeRegistForm.kh", method=RequestMethod.GET)
	public String storeRegistForm() {
		return "store/storeRegistForm";
	}
	
	@RequestMapping(value="/store/storeRegist.kh", method=RequestMethod.POST)
	public ModelAndView registStore(ModelAndView mv) {
		Store store = new Store();
		int result = sService.registStore(store);
		if(result > 0) {
			mv.setViewName("/store/storeList.kh");
		}
		return mv;
	}
	
	@RequestMapping(value="/store/storeRemove.kh", method=RequestMethod.GET)
	public ModelAndView removeStore(ModelAndView mv) {
		int result = sService.removeStore();
		return mv;
	}
}

