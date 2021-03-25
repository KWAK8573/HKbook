package com.board.dao;

import java.util.ArrayList;

import com.board.domain.ScrapVO;



public interface ScrapDAO {
	
	public ArrayList<ScrapVO> listDao();
	public void writeDao(String scrap_Title, String scrap_Address,String user_Id);
	public ScrapVO viewDao(String strID);
	public void deleteDao(String bId);
	
}
