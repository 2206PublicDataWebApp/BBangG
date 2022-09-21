package com.kh.bbang.user.service.logic;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.mindrot.jbcrypt.BCrypt;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kh.bbang.user.domain.LoginVO;
import com.kh.bbang.user.domain.User;
import com.kh.bbang.user.service.UserService;
import com.kh.bbang.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private UserStore uStore;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Override
	public int registerUser(User user) {
		int result = uStore.insertUser(session, user);
		return result;
	}

	@Override
	public User login(LoginVO loginVO)throws Exception{
		return uStore.login(loginVO);
	}

	@Override
	public User printOneById(String userId) {
		User uOne = uStore.selectOneById(session, userId);
		return uOne;
	}

	@Override
	public int modifyUser(User user) {
		int result = uStore.updateUser(session, user);
		return result;
	}

	@Override
	public int removeUser(String userId) {
		int result = uStore.deleteUser(session, userId);
		return result;
	}

	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception{
		uStore.keepLogin(userId, sessionId, sessionLimit);
	}

	public User checkLoginBefore(String value) throws Exception{
		return uStore.checkUserWithSessionKey(value);
	}

	@Override
	public List<User> findId(String userName, String userEmail) {
		List<User> uList = uStore.findId(session, userName, userEmail);
		return uList;
	}

	@Override
	public int findPwd(String userId, String userEmail) {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		String userPwd = BCrypt.hashpw(Integer.toString(checkNum),BCrypt.gensalt());
		String setFrom = "reg901@naver.com";
        String toMail = userEmail;
        String title = "빵지순례 임시 비밀번호 입니다.";
        String content = 
                "임시 비밀번호는 " + checkNum + "입니다." + 
                "<br><br>" + 
                "<br/>로그인 후 비밀번호 변경을 해주세요."+
				"<a href='http://localhost:8249/user/loginView"+
				">로그인 페이지</a>";
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom, "빵지순례");
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        int result = uStore.findPwd(session, userId, userEmail, userPwd);
        return result;
	}

}
