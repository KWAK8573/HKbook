package com.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private static final String namespace = "com.board.mappers.UserMapper" ;
	
	private final SqlSession sql;
	
	@Inject 
	public UserDAOImpl(SqlSession sql) {
		this.sql = sql;
	}
	
	// 회원가입
	@Override
	public void register(UserVO userVO) throws Exception {
		sql.insert(namespace + ".register", userVO);
	}
}
