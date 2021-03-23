package com.board.dao;

import java.util.ArrayList;
import java.util.List;

import com.board.domain.ScrapVO;


public interface IScrapDAO {


	public ArrayList<ScrapVO> readScraps();
	public void insertScrap(StringBuffer scrap_Address, String scrap_Title, String user_Id);
	public ScrapVO readScraps(String strID);
	public void deleteScrap(String bId);
	
	
	
	
}
