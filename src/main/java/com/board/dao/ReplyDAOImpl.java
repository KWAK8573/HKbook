package com.board.dao;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.board.domain.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO {

	@Inject SqlSession sql;
	@Override
	public List<ReplyVO> readReply(int review_id) throws Exception {
		return sql.selectList("replyMapper.readReply", review_id);
	}

}
