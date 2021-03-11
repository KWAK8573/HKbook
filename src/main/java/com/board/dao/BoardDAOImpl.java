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

		@Override
		public void write(RboardVO boardVO) throws Exception {
			sql.insert("boardMapper.insert", boardVO);
		}
		
		// 게시물 수정
		@Override
		public void update(RboardVO boardVO) throws Exception {
			
			sql.update("boardMapper.update", boardVO);
		}

		// 게시물 삭제
		@Override
		public void delete(int review_id) throws Exception {
			
			sql.delete("boardMapper.delete", review_id);
		}
}