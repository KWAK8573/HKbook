package com.board.service;

import com.board.domain.UserVO;

public interface UserService {
	
	//회원가입처리
	public void register(UserVO userVO) throws Exception;
}
