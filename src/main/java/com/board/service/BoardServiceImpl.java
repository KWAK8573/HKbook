package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.domain.RboardVO;

@Service
public class BoardServiceImpl implements BoardService {

	 @Inject
	 BoardDAO dao;
	 
	 @Override
	 public List<RboardVO> list() throws Exception {
	
	  return dao.list();
	 }
	 @Override
	 public RboardVO read(int review_id) throws Exception {

	 	return dao.read(review_id);
	 }
}