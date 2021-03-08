package com.board.service;


import java.util.List;
import com.board.domain.RboardVO;

public interface BoardService {
	public List<RboardVO> list() throws Exception;
}
