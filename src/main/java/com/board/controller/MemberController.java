package com.board.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.UserVO;
import com.board.service.UserService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private final UserService userService;
	
	@Inject
	public MemberController(UserService userService) {
		this.userService = userService;
	}
	
	// 회원가입 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		logger.info("get register");
		return "/member/register";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(UserVO userVO, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("post register");
		
		//비밀번호 암호화 처리 
		//BCrypt.hashpw() 메서드는 첫번째 파라미터에는 암호화할 비밀번호
		//두번째 파라미터는 BCrypt.gensalt() 받고 암호화된 비밀번호를 리턴한다
		String hashedPW = BCrypt.hashpw(userVO.getPw(), BCrypt.gensalt());
		
		//암호화된 비밀번호를 다시 회원 객체에 저장
		userVO.setPw(hashedPW);
		
		//서비스 회원가입 메서드 호출
		userService.register(userVO);
		
		//String을 전달
		//post 형식으로 전달, 한 번만 사용되면 사라진다
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		
		//회원 가입 완료 후 로그인 페이지로 이동
		return "redirect:/member/login";
	}
	
	//회원 수정 페이지 이동
	@RequestMapping(value = "/userModifyView", method = RequestMethod.GET)
	public String userModifyGET() throws Exception {
		return "/member/userModifyView";
	}
	
	//회원 수정처리
	@RequestMapping(value = "/userModify", method = RequestMethod.POST) 
	public String userModifyPOST(UserVO userVO, HttpSession httpsession) throws Exception { 
		logger.info("회원 수정처리");
		
		//비밀번호 암호화 처리 
		String hashedPW = BCrypt.hashpw(userVO.getPw(), BCrypt.gensalt());
		userVO.setPw(hashedPW);

		//서비스 회원정보 수정 메서드 호출
		userService.userUpdate(userVO);
		
		//정보를 수정했으니 다시 로그인 하기위해 세션값을 날린다
		httpsession.invalidate();
		return "redirect:/"; 
	}
	
	//회원 조회
	@RequestMapping(value="/userInfo", method = RequestMethod.GET)
	public String userInfo(Object handler, UserVO userVO, HttpServletRequest request, Model model) throws Exception{
		
		HttpSession httpSession = request.getSession();
		System.out.println(httpSession);
		
		Object id = httpSession.getAttribute("login");
		System.out.println(id);
		System.out.println(userVO.getUserId());


		UserVO uesrVO = userService.userInfo("userId");
		model.addAttribute("userInfo", uesrVO);

		return "/member/userInfo";
	}

}



