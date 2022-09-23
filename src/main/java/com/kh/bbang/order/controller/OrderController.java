package com.kh.bbang.order.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
			,HttpServletRequest request
			,@RequestParam("storeNo") Integer refStoreNo) {
	
		List<Product> pList = oService.findAllProduct(refStoreNo);
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("login");
		String userId = user.getUserId();
		System.out.println(userId);
		mv.addObject("storeNo", refStoreNo);
		mv.addObject("user", user);
		mv.addObject("pList", pList);
		return mv;
	}///
	//사용자 주문입력후 보내기
	@RequestMapping(value="/order/sendOrder.kh", method=RequestMethod.POST)
	public ModelAndView orderSend(
			ModelAndView mv
			,@ModelAttribute Order order
			,@ModelAttribute OrderProduct orderProduct
			,@RequestParam("storeNo") Integer storeNo
			) {
//			Order order = new Order(delivaryName, delivaryPhone, delivaryZipcode, delivaryAddressFirst,
//					delivaryAddressSecond, delivaryMemo);
//		
		String tmp[]=new String[orderProduct.getOrderProductNm().length];
		for(int i=0; i<orderProduct.getOrderProductNm().length;i++) {
			tmp[i]=orderProduct.getOrderProductNm()[i]+" "+orderProduct.getOrderProductCtn()[i]+"개 "+orderProduct.getOrderProductPrice()[i]+"원";
		}
		
		order.setStoreNo(storeNo);
		order.setOrderDetail(String.join("/",tmp));
		int result = oService.registerOrder(order);
		
		//System.out.println(order);
		//System.out.println(orderProduct.toString());
		//System.out.println(orderProduct.getTotalPrice());
		
		if(result>0) {
			mv.setViewName("redirect:/order/userOrderList.kh?userId="+order.getUserId()+"");
		}else {
			mv.addObject("msg","주문실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	//사용자 주문리스트 출력
	@RequestMapping(value="/order/userOrderList.kh", method=RequestMethod.GET)
	public ModelAndView allOrderById(ModelAndView mv
			,HttpSession session
			,@RequestParam(required = false, name="userId") String userId
			,@RequestParam(required = false, name="dateFrom") String dateFrom
			,@RequestParam(required = false, name="dateTo") String dateTo
			) {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	     Calendar c1 = Calendar.getInstance();
		 String strToday = sdf.format(c1.getTime());
		 List<Order> oList;
		if(dateFrom==null&&dateTo==null) {
			oList = oService.findOrderById(userId,"","");
		}else if(dateFrom==null||dateTo==null) {
			if(dateFrom==null) {
				oList = oService.findOrderById(userId,"1900-00-00",dateTo);
			}else {
				oList = oService.findOrderById(userId,dateFrom,strToday);
			}
			
		}else {
			oList = oService.findOrderById(userId, dateFrom, dateTo);
		}
		
		System.out.println("----------------userId" + userId);
		int payState=0;
		int delivaryState=0;
		int cancleState=0;
		try {
			if(!oList.isEmpty()) {
				for(int i=0; i<oList.size(); i++) {
					switch (oList.get(i).getOrderState()) {
					case 1:payState+=1;break;
					case 2:payState+=1;break;
					case 3:delivaryState+=1;break;
					case 4:delivaryState+=1;break;
					case 5:cancleState+=1;break;
					default: break;
					}
				}
			}
			mv.addObject("payState",payState);
			mv.addObject("delivaryState",delivaryState);
			mv.addObject("cancleState",cancleState);
//			mv.addObject("orderState", orderState);
			mv.addObject("userId", userId);
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
			,HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("login");
		Order order = oService.findOneOrder(orderNo);
		String delivaryFullAdd=order.getDelivaryAddr()+""+order.getDelivaryAddrDetail();
		Store store = oService.findStore(order.getStoreNo());
		//System.out.println(delivaryFullAdd);
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
	/////////////////////////////////////////////////////////////////////////
	
	//사용자 배송상태 순차적으로 변경 
	@RequestMapping(value="/order/userChangeOrdeState.kh",method=RequestMethod.GET)
	public String userChangeOrdeState(Model model
			,@RequestParam("orderNo") Integer orderNo) {
		int result = oService.changeOrdeState(orderNo);
		if(result>0) {
			return "redirect:/order/userOrderDetail.kh?orderNo="+orderNo;
		}else {
			model.addAttribute("msg","주문상태 변경실패");
			return "common/errorPage";
			
		}
		
	}
	//관리자  배송상태 순차적으로 변경 
	@RequestMapping(value="/admin/adminChangeOrderState.kh",method=RequestMethod.GET)
	public String adminChangeOrdeState(Model model
			,@RequestParam("orderNo") Integer orderNo) {
		int result = oService.changeOrdeState(orderNo);
		if(result>0) {
			return "redirect:/admin/adminOrderDetail.kh?orderNo="+orderNo;
		}else {
			model.addAttribute("msg","주문상태 변경실패");
			return "common/errorPage";
			
		}
		
	}
	//관리자 주문 즉시취소
	@RequestMapping(value="/admin/adminOrderRemove.kh", method=RequestMethod.GET)
	public String adminOrderRemove(HttpSession session, Model model
			,@RequestParam("orderNo") Integer orderNo) {
		try {
			int result = oService.removeOrder(orderNo);
			if(result>0) {
				session.removeAttribute("orderNo");
			}
			return "redirect:/admin/adminOrderList.kh";
		} catch (Exception e) {
			model.addAttribute("msg",e.toString());
			return "common/errorPage";
		}
		
	}
	///////////////////////////////////////////////////////////////////////////관리자
	
	//관리자 주문리스트(날짜별)
	@RequestMapping(value="/admin/adminOrderList.kh", method=RequestMethod.GET)
	public ModelAndView allOrderByDate(ModelAndView mv
			,@RequestParam(name="orderDate",required=false) String orderDate
			,@RequestParam(value="page", required=false) Integer page
			) {
		int currentPage=(page!=null) ? page : 1;
		System.out.println(orderDate);
		try {
			int totalOrderCount;
			if(orderDate==null) {
				totalOrderCount = oService.getTotalOrderCount("");
			}else {
				totalOrderCount = oService.getTotalOrderCount(orderDate);
			}
			int boardLimit=10;
			int naviLimit=5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage=(int)((double)totalOrderCount/boardLimit+0.9);
			startNavi=((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi+naviLimit -1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<Order> oList;
			if(orderDate==null) {
				oList=oService.findOrderByDate("",currentPage,boardLimit);
			}else {
				oList=oService.findOrderByDate(orderDate,currentPage,boardLimit);
			}
//			List<Order> oList=oService.findOrderByDate(orderDate,currentPage,boardLimit);
			mv.setViewName("admin/adminOrderList");
			mv.addObject("orderDate", orderDate);
			mv.addObject("oList",oList);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			
		} catch (Exception e) {
			mv.addObject("msg",e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	//관리자 주문 상세화면
	@RequestMapping(value="/admin/adminOrderDetail.kh", method=RequestMethod.GET)
	public ModelAndView adminOrderDetail(ModelAndView mv
			,@RequestParam("orderNo") Integer orderNo) {
		try {
			
			Order order = oService.findOneOrder(orderNo);
			String delivaryFullAdd=order.getDelivaryAddr()+""+order.getDelivaryAddrDetail();
			Store store = oService.findStore(order.getStoreNo());
			mv.addObject("order", order);
			mv.addObject("store", store);
			mv.addObject("delivaryFullAdd", delivaryFullAdd);
		} catch (Exception e) {
			mv.addObject("msg",e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
