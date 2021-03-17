package com.board.service;

import com.board.domain.LoginDTO;
import com.board.domain.UserVO;

public interface UserService {
	

	//회원가입처리
	public void register(UserVO userVO) throws Exception;
	
	//로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;
	
	//회원 수정
	public void userUpdate(UserVO userVO) throws Exception;
	
	//아이디 중복 체크
	public int idChk(String userId) throws Exception;


	//회원 탈퇴표시
	public void userBlock(UserVO userVO) throws Exception;
	
	//Xid 로그인 막기
	public int Xid(String userId) throws Exception;

}
