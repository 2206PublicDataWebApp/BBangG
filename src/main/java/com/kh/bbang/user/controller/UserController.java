package com.kh.bbang.user.controller;

import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.bbang.user.domain.LoginDTO;
import com.kh.bbang.user.domain.User;
import com.kh.bbang.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService uService;
	@Autowired
	private JavaMailSenderImpl mailSender;
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/user/joinView.kh", method=RequestMethod.GET)
	public String userJoinView() {
		return "user/join";
	}
	
	@RequestMapping(value="/user/join.kh", method=RequestMethod.POST)
	public ModelAndView userJoin(
			@ModelAttribute User user
			, @RequestParam("zipCode") int zipCode
			, @RequestParam("address") String address
			, @RequestParam("addrDetail") String addrDetail
			, @RequestParam("extra") String extra
			, ModelAndView mv) {
		try {
			user.setUserZipCode(zipCode);
			user.setAddr(address);
			user.setAddrDetail(addrDetail + " " + extra);
			int result = uService.registerUser(user);
			if(result > 0) {
				mv.setViewName("redirect:/home.kh");
			}else {
				mv.addObject("msg", "회원가입을 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public String emailAuth(String email) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내기 */
        String setFrom = "reg901@naver.com";
        String toMail = email;
        String title = "빵지순례 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return Integer.toString(checkNum);
 
	}

	@RequestMapping(value="/user/loginView.kh", method=RequestMethod.GET)
	public String userLoginView() {
		return "user/login";
	}
	
	@RequestMapping(value="/user/login.kh", method=RequestMethod.POST)
	public void userLogin(LoginDTO loginDTO, HttpSession httpSession, Model model) {
		
	}
	
	@RequestMapping(value="/user/logout.kh", method=RequestMethod.GET)
	public ModelAndView userLogout(
			HttpServletRequest request
			, ModelAndView mv) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
			mv.setViewName("redirect:/home.kh");
		}else {
			mv.addObject("msg", "로그아웃 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/user/myPage.kh", method=RequestMethod.GET)
	public ModelAndView showMyPage(HttpServletRequest request
			, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			String userId = user.getUserId();
			
			User uOne = uService.printOneById(userId);
			mv.addObject("user", uOne);
			mv.setViewName("user/myPage");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/member/modify.kh", method=RequestMethod.POST)
	public ModelAndView modifyMember(
			@ModelAttribute User user
			, @RequestParam("zipCode") int zipCode
			, @RequestParam("address") String address
			, @RequestParam("addrDetail") String addrDetail
			, @RequestParam("extra") String extra
			, ModelAndView mv) {
		try {
			user.setUserZipCode(zipCode);
			user.setAddr(address);
			user.setAddrDetail(addrDetail + " " + extra);
			int result = uService.modifyUser(user);
			if(result > 0) {
				mv.setViewName("redirect:/home.kh");
			}else {
				mv.addObject("msg", "회원 정보 수정 실패!");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/member/remove.kh", method=RequestMethod.GET)
	public ModelAndView removeMember(HttpSession session
			, ModelAndView mv) {
		try {
			User user = (User)session.getAttribute("loginUser");
			String userId = user.getUserId();
			int result = uService.removeUser(userId);
			mv.setViewName("redirect:/user/logout.kh");
		} catch (Exception e) {

			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}
