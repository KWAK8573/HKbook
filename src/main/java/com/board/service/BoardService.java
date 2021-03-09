package com.board.service;


import java.util.List;
import com.board.domain.RboardVO;

public interface BoardService {
	public List<RboardVO> list() throws Exception;
	
	// 게시물 목록 조회
	public RboardVO read(int review_id) throws Exception;
}
