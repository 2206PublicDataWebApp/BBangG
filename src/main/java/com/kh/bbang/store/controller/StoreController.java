package com.kh.bbang.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.bbang.store.service.StoreService;

@Controller
public class StoreController {
	
	@RequestMapping(value="/store/storeList.kh", method=RequestMethod.GET)
	public String storeList() {
		return "store/storeList";
	}
	
	@RequestMapping(value="/store/storeRegistForm.kh", method=RequestMethod.GET)
	public String storeRegistForm() {
		return "store/storeRegistForm";
	}
	
}

