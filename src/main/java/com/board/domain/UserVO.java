package com.board.domain;

import java.sql.Timestamp;

public class UserVO {
	private String userId;
	private String pw;
	private String email;
	private Timestamp memberDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(Timestamp memberDate) {
		this.memberDate = memberDate;
	}
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", pw=" + pw + ", email=" + email + ", memberDate=" + memberDate + "]";
	}
	
	
}
