package com.board.dao;

import java.util.List;

import com.board.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> readReply(int review_id) throws Exception;
	
}
