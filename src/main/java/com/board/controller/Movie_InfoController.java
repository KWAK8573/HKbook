package com.board.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.dao.Movie_InfoDAO;
import com.board.domain.PageMaker;
import com.board.domain.Criteria;
import com.board.domain.Movie_InfoVO;
import com.board.domain.SearchCriteria;
import com.board.service.Movie_InfoService;


@Controller
@RequestMapping("/movie_info/*")
public class Movie_InfoController {

	private static final Logger logger = LoggerFactory.getLogger(Movie_InfoController.class);

	@Inject
	Movie_InfoService service;

	// 게시판 목록 조회
	@RequestMapping(value = "/movielist", method = RequestMethod.GET)
	public String movielist(Model model, @ModelAttribute SearchCriteria scri) throws Exception {
		logger.info("movielist");

		model.addAttribute("movielist", service.movielist(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "movie_info/movielist";
	}

	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Movie_InfoVO movie_InfoVO) throws Exception{
		logger.info("write");
		service.write(movie_InfoVO);
		
		return "redirect:/movie_info/movielist";
	}
	
	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(Movie_InfoVO movie_InfoVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(movie_InfoVO.getMovie_id()));
		model.addAttribute("scri", scri);
		
		return "movie_info/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(Movie_InfoVO movie_InfoVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(movie_InfoVO.getMovie_id()));
		model.addAttribute("scri", scri);
		
		return "movie_info/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Movie_InfoVO movie_InfoVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("update");
		
		service.update(movie_InfoVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/movie_info/movielist";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Movie_InfoVO movie_InfoVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		service.delete(movie_InfoVO.getMovie_id());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/movie_info/movielist";
	}
}