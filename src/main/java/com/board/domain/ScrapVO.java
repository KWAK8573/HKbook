package com.board.domain;

public class ScrapVO {
	
	private int scrap_Id;
	private String scrap_Title;
	private String scrap_Address;
	private String user_Id;
	public int getScrap_Id() {
		return scrap_Id;
	}
	public void setScrap_Id(int scrap_Id) {
		this.scrap_Id = scrap_Id;
	}
	public String getScrap_Title() {
		return scrap_Title;
	}
	public void setScrap_Title(String scrap_Title) {
		this.scrap_Title = scrap_Title;
	}
	public String getScrap_Address() {
		return scrap_Address;
	}
	public void setScrap_Address(String scrap_Address) {
		this.scrap_Address = scrap_Address;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	@Override
	public String toString() {
		return "Scrap [scrap_Id=" + scrap_Id + ", scrap_Title=" + scrap_Title + ", scrap_Address=" + scrap_Address
				+ ", user_Id=" + user_Id + "]";
	}
	
	
	
	
	
	
}