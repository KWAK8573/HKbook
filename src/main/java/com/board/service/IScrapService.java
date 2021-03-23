package com.board.service;

import java.util.ArrayList;

import com.board.domain.ScrapVO;





public interface IScrapService {
	
	void insertScrap(int scrap_Id, String scrap_Title, String scrap_Address, String user_Id);
	ArrayList<ScrapVO> readScraps();
	ScrapVO readScrap(String scrap_Title);
	void modifyScrap(int scrap_Id,  String scrap_Title, String scrap_Address,String user_Id);
	void deleteScrap(String scrap_Title);
	
	

	
}
