package com.board.service;

import java.util.List;

import com.board.domain.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> readReply(int review_id) throws Exception;
}
