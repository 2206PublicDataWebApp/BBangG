package com.kh.bbang.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bbang.order.domain.Order;
import com.kh.bbang.order.domain.OrderProduct;

import com.kh.bbang.order.service.OrderService;
import com.kh.bbang.product.domain.Product;
import com.kh.bbang.store.domain.Store;
import com.kh.bbang.user.domain.User;


@Controller
public class OrderController {
	
	@Autowired
	private OrderService oService;
	
	//해당점포 물품정보 들고오기


	
	//주문하기 화면
	@RequestMapping(value="/order/orderForm.kh", method=RequestMethod.GET)
	public ModelAndView orderFormView(ModelAndView mv
			,HttpSession session) {
		int StoreNo = 35; //하드
		List<Product> pList = oService.findAllProduct(StoreNo);
		User user = (User) session.getAttribute("loginUser");
		mv.addObject("user", user);
		
		mv.addObject("pList", pList);
		return mv;
	}
	//사용자 주문입력후 보내기
	@RequestMapping(value="/order/sendOrder.kh", method=RequestMethod.POST)
	public ModelAndView orderSend(
			ModelAndView mv
			,@ModelAttribute Order order
			,@ModelAttribute OrderProduct oProduct
			) {
//			Order order = new Order(delivaryName, delivaryPhone, delivaryZipcode, delivaryAddressFirst,
//					delivaryAddressSecond, delivaryMemo);
//		
		int result = oService.registerOrder(order);
		String tmp[]=new String[oProduct.getOrderProductNm().length];
		for(int i=0; i<oProduct.getOrderProductNm().length;i++) {
			tmp[i]=oProduct.getOrderProductNm()[i]+" "+oProduct.getOrderProductCtn()[i]+"개 "+oProduct.getOrderProductPrice()[i]+"원";
		}
		order.setOrderDetail(String.join("/",tmp));
//		System.out.println(order.toString());
//		System.out.println(order.getTotalPrice());
		
		if(result>0) {
			mv.setViewName("redirect:/order/userOrderList.kh?");
		}else {
			mv.addObject("msg","주문실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	//사용자 주문리스트 출력
	@RequestMapping(value="/order/userOrderList.kh", method=RequestMethod.GET)
	public ModelAndView allOrderById(ModelAndView mv) {
		String userId="testId"; //하드
		
		List<Order> oList = oService.findOrderById(userId);
	
		
		
		try {
			mv.addObject("oList", oList);
			mv.setViewName("order/userOrderList");
			
		} catch (Exception e) {
			mv.addObject("msg",e.toString());
			mv.setViewName("common/errorPage");
		}
		
		
		return mv;
		
	}
	//사용자 주문상세화면
	@RequestMapping(value="/order/userOrderDetail.kh", method=RequestMethod.GET)
	public ModelAndView detailOrderView(ModelAndView mv
			,@RequestParam("orderNo") Integer orderNo
			,HttpSession session) {
		Order order = oService.findOneOrder(orderNo);
		String delivaryFullAdd=order.getDelivaryAddr()+""+order.getDelivaryAddrDetail();
		Store store = oService.findStore(order.getStoreNo());
		System.out.println(delivaryFullAdd);
		mv.addObject("order", order);
		mv.addObject("store", store);
		mv.addObject("delivaryFullAdd",delivaryFullAdd);
		session.setAttribute("orderNo",order.getOrderNo());
		
		
		return mv;
		
	}
	
	//사용자 주문즉시취소
	@RequestMapping(value="/order/orderRemove.kh", method=RequestMethod.GET)
	public String orderRemove(HttpSession session, Model model) {
		try {
			int orderNo = (int) session.getAttribute("orderNo");
			int result = oService.removeOrder(orderNo);
			if(result>0) {
				session.removeAttribute("orderNo");
			}
			return "redirect:/order/userOrderList.kh";
		} catch (Exception e) {
			model.addAttribute("msg",e.toString());
			return "common/errorPage";
		}
		
	}
	//사용자 주문취소요청
	@RequestMapping(value="/order/orderRemoveRequest.kh", method=RequestMethod.GET)
	public String orderRemoveRequest(Model model
			,@RequestParam("orderNo") Integer orderNo) {
		try {
			int result = oService.removeOrderRequest(orderNo);
			return "redirect:/order/userOrderDetail.kh?orderNo="+orderNo;
		} catch (Exception e) {
			model.addAttribute("msg",e.toString());
			return "common/errorPage";
		}
	}
	//사용자 주문 수정화면
	@RequestMapping(value="/order/orderModifyView.kh", method=RequestMethod.GET)
	public ModelAndView modifyOrderView(ModelAndView mv
			,@RequestParam("orderNo") Integer orderNo) {
		try {
			
			Order order = oService.findOneOrder(orderNo);
			
			mv.addObject("order", order);
			mv.setViewName("order/orderModifyForm");
			
		} catch (Exception e) {
			mv.addObject("msg",e.toString());
			mv.setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	//사용자 주문 수정 보내기
	@RequestMapping(value="/order/orderModify.kh",method=RequestMethod.POST )
	public ModelAndView modifyOrderSend(ModelAndView mv
			,@ModelAttribute Order order
			,@RequestParam("orderNo") Integer orderNo) {
		order.setOrderNo(orderNo);
		int result = oService.modifyOrder(order);
		if(result>0) {
			mv.setViewName("redirect:/order/userOrderDetail?orderNo="+orderNo);
		}else {
			mv.addObject("msg","수정실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	//사용자 구매확정 
	@RequestMapping(value="/order/orderConfirm.kh",method=RequestMethod.GET)
	public String orderConfirm(Model model
			,HttpSession session) {
		int orderNo=(int) session.getAttribute("orderNo");
		int result = oService.confirmDelivary(orderNo);
		if(result>0) {
			return "redirect:/order/userOrderList.kh";
		}else {
			model.addAttribute("msg","구매확정 실패");
			return "common/errorPage";
			
		}
		
	}
	///////////////////////////////////////////////////////////////////////////관리자
	
	//관리자 주문리스트(날짜별)
	@RequestMapping(value="/admin/adminOrderList.kh", method=RequestMethod.GET)
	public ModelAndView allOrderByDate(ModelAndView mv
			,@RequestParam(name="orderDate",required=false) String orderDate
			) {
		System.out.println(orderDate);
		
		try {
			List<Order> oList=oService.findOrderByDate(orderDate);
			mv.addObject("oList",oList);
			
		} catch (Exception e) {
			mv.addObject("msg",e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
