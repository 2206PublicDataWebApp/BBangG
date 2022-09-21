package com.kh.bbang.user.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
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
import org.springframework.web.util.WebUtils;

import com.kh.bbang.user.domain.LoginVO;
import com.kh.bbang.user.domain.User;
import com.kh.bbang.user.interceptor.LoginInterceptor;
import com.kh.bbang.user.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	private final UserService userService;
	
	@Autowired
	private UserService uService;
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	public UserController(UserService userService) {
        this.userService = userService;
    }
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
			String hashedPw = BCrypt.hashpw(user.getUserPwd(), BCrypt.gensalt());
			user.setUserPwd(hashedPw);
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
	public String userLoginView(@ModelAttribute("loginVO") LoginVO loginVO) {
		return "/user/login";
	}
	
	@RequestMapping(value="/user/login" , method= RequestMethod.POST)
	public void loginPost(LoginVO loginVO, HttpSession httpSession,Model model)throws Exception{
		logger.info("loginVO"+loginVO.getUserId());
		User user = uService.login(loginVO);
		logger.info("Pwd"+user);
		if (user == null || !BCrypt.checkpw(loginVO.getUserPwd(), user.getUserPwd())) {
	        return;
	    }
		model.addAttribute("user", user);
		
		if(loginVO.isUseCookie()) {
			int amount = 60*60*24*7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
			uService.keepLogin(user.getUserId(), httpSession.getId(), sessionLimit);
		}
	}
	
	
	
	@RequestMapping(value="/user/logout" , method=RequestMethod.GET)
	public String logout(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession httpSession) throws Exception {

		Object object = httpSession.getAttribute("login");
		if (object != null) {
			User user = (User) object;
			httpSession.removeAttribute("login");
			httpSession.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				uService.keepLogin(user.getUserId(), "none", new Date());
			}
		}

		return "/user/logout";
	}
	
	@RequestMapping(value="/user/myPage.kh", method=RequestMethod.GET)
	public ModelAndView showMyPage(HttpServletRequest request
			, ModelAndView mv) {
		try {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("login");
			String userId = user.getUserId();
			
			User uOne = uService.printOneById(userId);
			mv.addObject("user", uOne);
			mv.setViewName("user/myPage");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/user/modify.kh", method=RequestMethod.POST)
	public ModelAndView modifyUser(
			@ModelAttribute User user
			, @RequestParam("zipCode") int zipCode
			, @RequestParam("address") String address
			, @RequestParam("addrDetail") String addrDetail
			, @RequestParam("extra") String extra
			, ModelAndView mv) {
		try {
			String hashedPw = BCrypt.hashpw(user.getUserPwd(), BCrypt.gensalt());
			user.setUserPwd(hashedPw);
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
	
	@RequestMapping(value="/user/remove.kh", method=RequestMethod.GET)
	public ModelAndView removeUser(HttpSession session
			, ModelAndView mv) {
		try {
			User user = (User)session.getAttribute("login");
			String userId = user.getUserId();
			int result = uService.removeUser(userId);
			mv.setViewName("redirect:/user/logout");
		} catch (Exception e) {

			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/user/findView", method=RequestMethod.GET)
	public String findView() throws Exception{
		return"/user/findView";
	}
	@RequestMapping(value="/user/findid.kh", method=RequestMethod.GET)
	public ModelAndView searchId(HttpServletRequest request
			, ModelAndView mv
			, @RequestParam("userId") String userId
			, @RequestParam("userEmail") String userEmail) {
		try {
			List<User> uList = uService.findId(userId, userEmail);
			logger.info("userId"+userId+" userEmail"+userEmail);
			if(!uList.isEmpty()) {
				mv.addObject("uList", uList);
			} else {
				mv.addObject("uList", null);
			}
			mv.addObject("uList", uList);
			mv.setViewName("/user/findId");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		
		return mv;
	}
}
