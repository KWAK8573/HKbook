package com.board.service;

import java.util.ArrayList;

import com.board.dao.ScrapDao;
import com.board.domain.ScrapVO;



public class ScrapService implements IScrapService {
	
	
	
	
	ScrapDao scrapDao;
	
	public ScrapService() {
		scrapDao = new ScrapDao();
	}
	
	@Override
	public void insertScrap(int scrap_Id, String scrap_Title, String scrap_Address, String user_Id) {
		scrapDao.insertScrap(scrap_Id, scrap_Title, scrap_Address, user_Id);
	}

	@Override
	public ArrayList<ScrapVO> readScraps() {
		return scrapDao.readScraps();
	}

	@Override
	public ScrapVO readScrap(String scrap_Title) {
		return scrapDao.readScrap(scrap_Title);
	}

	@Override
	public void modifyScrap(int scrap_Id,  String scrap_Title, String scrap_Address,String user_Id) {
		scrapDao.updateScrap(scrap_Id,  scrap_Title, scrap_Address,user_Id);
	}

	@Override
	public void deleteScrap(String scrap_Title) {
		scrapDao.deleteScrap(scrap_Title);
		
	}

	




	
}
