package com.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.board.dao.Movie_InfoDAO;
import com.board.domain.Criteria;
import com.board.domain.Movie_InfoVO;
import com.board.domain.SearchCriteria;
import com.board.utils.FileUtils;



@Service
public class Movie_InfoServiceImpl implements Movie_InfoService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	Movie_InfoDAO dao;
	 
	@Override
	 public List<Movie_InfoVO> movielist(SearchCriteria scri) throws Exception {
	
	  return dao.movielist(scri);
	 }

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}

	@Override
	public void write(Movie_InfoVO movie_InfoVO, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(movie_InfoVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(movie_InfoVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
		
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public Movie_InfoVO read(int movie_id) throws Exception {
		dao.movieviews(movie_id);
//		dao.recommend(movie_id);
		return dao.read(movie_id);
	}

	@Override
	public void delete(int movie_id) throws Exception {
		dao.delete(movie_id);
		
	}

	@Override
	public void update(Movie_InfoVO movie_InfoVO) throws Exception {
		dao.update(movie_InfoVO);
		
	}
	
	@Override
	public void recommend(int movie_id) throws Exception {
		dao.recommend(movie_id);
		
		
	}

	@Override
	public List<Map<String, Object>> selectFileList(int movie_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(movie_id);
	}


//	@Override
//	public void countRecommend(HashMap<String, Object> params) throws Exception {
//		dao.countRecommend(params);
//		
//	}


}