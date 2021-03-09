package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.RboardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	 @Inject
	 private SqlSession sql;
	 
	
	 // 게시물 목록
	 @Override
	 public List<RboardVO> list() throws Exception { 
	  
	  return sql.selectList("boardMapper.list");
	  
	  }
	  
	  @Override
	  public RboardVO read(int review_id) throws Exception {
	  		
	  	return sql.selectOne("boardMapper.read", review_id);
 }

}