package com.board.controller;


import java.sql.Timestamp;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.dao.Movie_InfoDAO;
import com.board.domain.PageMaker;
import com.board.domain.Criteria;
import com.board.domain.Movie_InfoVO;
import com.board.domain.SearchCriteria;
import com.board.domain.UserVO;
import com.board.service.Movie_InfoService;
import com.board.service.UserService;


@Controller
@RequestMapping("/movie_info/*")
public class Movie_InfoController {

	private static final Logger logger = LoggerFactory.getLogger(Movie_InfoController.class);

	@Autowired
	private Movie_InfoService service;
	
	@Autowired
	private UserService userService;
	
	
	
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
	public String read(Movie_InfoVO movie_InfoVO , @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		
		logger.info("read");
		
		
//		// 현재 세션 로그인 유저 아이디 가져오기
//		UserVO uvo = (UserVO) session.getAttribute( "login_session");
//		// 유저 추천 활성화 시간 조회, "board/recommend" 요청 결과 값을 view.jsp hidden값(u_r_a_t) 갱신을 위해 조회하여 model에 추가한다
//		if(uvo != null){
//			Timestamp u_recommend_active_time = userService.checkRecommendActiveTime(uvo.getUserId());
//			model.addAttribute("u_recommend_active_time", u_recommend_active_time);
//		}

		
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
	

	//게시물 추천 관련 메소드
    @RequestMapping("/recommend")
    public String recommend (@RequestParam int movie_id) throws Exception {
        
       service.recommend(movie_id);
    
        return "redirect:/movie_info/movielist"; //페이지값을 그대로 넘겨받기위해서 포워딩을 사용해 컨트롤러로 리턴시킨다.
    }

	 
	
	//	// 추천하기
	//	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	//	public String responseRecommned(@RequestParam HashMap<String, Object> params) throws Exception {
	//		logger.info("responseRecommned");
	//		
	//		// 현재시간 > u_recommend_active_time 인 경우, 추천Go
	//		service.countRecommend(params);
	//		// 추천 후, 유저 u_recommend_active_time에 현재시간+1분(시간 변경가능, movie_info_Mapper) 업데이트
	//		userService.updateRecommendActiveTime((String) params.get("userId"));
	//
	//		return "redirect:movielist?movie_id=" + params.get("movie_id") + "&page=" + params.get("page") + "&perPageNum=" + params.get("perPageNum");
	//	}



	

}