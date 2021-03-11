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

import com.board.dao.M_CategoryDao;
import com.board.dao.IDao;


	/**
	 * Handles requests for the application home page.
	 */
	@Controller
	public class CategoryController {
		
		private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
		
		
	M_CategoryDao dao;
		
		@Autowired
		private SqlSession sqlSession;
		
		@Autowired
		public void setDao(M_CategoryDao dao) {
			this.dao = dao;
		}
		

		
		@RequestMapping("/list")
		public String list(Model model) {
//			ArrayList<ContentDto> dtos = dao.listDao();
			IDao dao = sqlSession.getMapper(IDao.class);
//			ArrayList<ContentDto> dtos = dao.listDao();
			model.addAttribute("list", dao.listDao());
			
			return "/category_Id/list";
		}
		
		@RequestMapping("/writeForm")
		public String writeForm() {
			
			return "/category_Id/writeForm";
		}
		
		@RequestMapping("/write")
		public String write(HttpServletRequest request, Model model) {
			dao.writeDao(Integer.parseInt(request.getParameter("category_Id")), request.getParameter("movie_Category"));
			return "redirect:list";
		}
		
		@RequestMapping("/view")
		public String view() {
			
			return "/view";
		}
		
		@RequestMapping("/delete")
		public String delete(HttpServletRequest request, Model model) {
			dao.deleteDao(request.getParameter("category_Id"));
			return "redirect:list";
		}
		
	}


