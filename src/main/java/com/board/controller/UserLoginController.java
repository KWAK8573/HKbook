package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.board.domain.LoginDTO;
import com.board.domain.UserVO;
import com.board.service.UserService;

@Controller
@RequestMapping("/member/*")
public class UserLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	private final UserService userService;
	
	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}
	
	//로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@ModelAttribute("loginDTO") LoginDTO loginDTO){
		logger.info("get login");
		return "/member/login";
	}
	
	//로그인처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPost(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception{
		logger.info("post login");
		
		//login에서 받은 데이터(아이디, 비밀번호) 중에서 
		//아이디를 통해 select한 회원 정보를 변수 userVO에 담는다
		UserVO userVO = userService.login(loginDTO);
		
		//만역 userVO가 null 또는 BCrypt.checkpw()를 통해 맞지 않으면 메서드 종료
		if (userVO ==null || !BCrypt.checkpw(loginDTO.getPw(), userVO.getPw())) {
			return;
		}
		//비밀번호가 일치하면 model에 userVO를 user란 변수로 저장한다
		model.addAttribute("user", userVO);
	}
	
	//로그아웃 처리
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception{
//		logger.info("get logout");
//		
//		Object object = httpSession.getAttribute("login");
//		if (object != null) {
//			UserVO userVO = (userVO) object;
//			httpSession.removeAttribute("login");
//			httpSession.invalidate();
//			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//			if (loginCookie != null) {
//				loginCookie.setPath("/");
//				loginCookie.setMaxAge(0);
//				response.addCookie(loginCookie);
//				userService.keepLogin(userVO.getUserId(), "none", new Date());
//			}
//		}
//		
//		return "/member/logout";
//	}
	
	
}






