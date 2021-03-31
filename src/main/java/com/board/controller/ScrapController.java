package com.board.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.dao.ScrapDAO;
import com.board.dao.ScrapDAOImpl;




//@Controller
@RequestMapping("/scrap")

public class ScrapController {
	//private static final Logger logger = LoggerFactory.getLogger(ScrapController.class);
	ScrapDAOImpl dao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	public void setDao(ScrapDAOImpl dao) {
		this.dao = dao;
	}
	

	
	@RequestMapping("/list")
	public String list(Model model) {
//		ArrayList<ContentDto> dtos = dao.listDao();
		ScrapDAO dao = sqlSession.getMapper(ScrapDAO.class);
//		ArrayList<ContentDto> dtos = dao.listDao();
		model.addAttribute("list", dao.listDao());
		
		return "scrap/list";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		
		return "scrap/writeForm";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		dao.writeDao(request.getParameter("scrap_Title"),request.getRequestURL().toString()+ "?" + request.getQueryString(),request.getParameter("user_Id"));
		
		
		return "redirect:/scrap/list";
	}
	
	@RequestMapping("/view")
	public String view() {
		
		return "scrap/view";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		dao.deleteDao(request.getParameter("scrap_Id"));
		return "redirect:/scrap/list";
	}
	
}
