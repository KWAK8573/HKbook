package com.board.dao;

import com.board.domain.LoginDTO;
import com.board.domain.UserVO;

public interface UserDAO {
	
	// 회원가입
	public void register(UserVO userVO) throws Exception;
	
	//로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;
	
	//회원정보 수정
	public void userUpdate(UserVO userVO) throws Exception;
	
	//회원정보 조회
	UserVO userInfo(String userId) throws Exception;
}
