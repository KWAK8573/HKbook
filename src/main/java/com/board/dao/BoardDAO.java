package com.board.dao;

import java.util.List;

import com.board.domain.RboardVO;

public interface BoardDAO {
 
	public List<RboardVO> list() throws Exception; 
	
	public RboardVO read(int review_id) throws Exception;
}