package com.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.LoginDTO;
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
	
	// 로그인 처리
	@Override
	public UserVO login(LoginDTO loginDTO)  throws Exception {
		return sql.selectOne(namespace + ".login", loginDTO);
	}
	
	//회원정보 수정
	@Override
	public void userUpdate(UserVO userVO) throws Exception {
		sql.update(namespace + ".userUpdate", userVO);
	}
}
