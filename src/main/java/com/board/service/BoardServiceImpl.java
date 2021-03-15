package com.board.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	 
	 @Override
		public void write(RboardVO boardVO) throws Exception {
			dao.write(boardVO);
	 }
	 
	 @Override
		public void update(RboardVO boardVO) throws Exception {

			dao.update(boardVO);
		}

		@Override
		public void delete(int review_id) throws Exception {
			
			dao.delete(review_id);
		}
		
	@Override
	public void boardHit(int review_id, HttpSession session) throws Exception{
		long update_time = 0;
		if(session.getAttribute("update_time_"+review_id) != null) {
			update_time = (long)session.getAttribute("update_time_"+review_id);
		}
		long current_time = System.currentTimeMillis();
		if(current_time - update_time > 5*1000) {
			dao.boardHit(review_id);
			session.setAttribute("update_time_"+review_id, current_time);
		}
	}
}