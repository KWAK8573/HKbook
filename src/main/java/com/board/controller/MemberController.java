package com.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model)  {
		System.out.println("login()");
		//model.addAttribute("request", request);

		return "member/login";
	}
}