package com.board.dao;

import com.board.domain.UserVO;

public interface UserDAO {
	
	// 회원가입
	public void register(UserVO userVO) throws Exception;
}
