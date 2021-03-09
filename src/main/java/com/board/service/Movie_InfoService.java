package com.board.service;


import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.board.domain.Criteria;
import com.board.domain.Movie_InfoVO;
import com.board.domain.SearchCriteria;


public interface Movie_InfoService {
	
	public List<Movie_InfoVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public void write(Movie_InfoVO movie_InfoVO) throws Exception;
	
	public Movie_InfoVO read(int movie_id) throws Exception;
	
	public void delete(int movie_id) throws Exception;
	
	public void update(Movie_InfoVO movie_InfoVO) throws Exception;
}

