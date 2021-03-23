package com.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.inject.Inject;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;


import com.board.domain.ScrapVO;





public class ScrapDao2 implements IScrapDao {
	
//	protected Log log = LogFactory.getLog(ScrapDao.class);
//
//	
	@Autowired 
	private SqlSessionTemplate sqlSession;

		
	// 템플릿을 사용하기 있지만 setter해주는 부분
JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
		
	
	@Override
	public void insertScrap(int scrap_Id,  String scrap_Title, String scrap_Address,String user_Id) {
		return sqlSession.insert(int scrap_Id);
		
//		try {
//			return sqlSession.insert(scrap_Id) 
//							
//		} finally {
//			closeSqlSession(ssqlSession) ;
//			
		}
		
		
//		ScrapVO scrap = new ScrapVO();
//		
//		scrap.setScrap_Id(scrap_Id);
//		scrap.setScrap_Title(scrap_Title);
//		scrap.setScrap_Address(scrap_Address);
//		scrap.setUser_Id(user_Id);
//		dbScrap.put(scrap_Title, scrap);
//		
//	}
//	@Override
//	public void insertScrap(int scrap_Id,  String scrap_Title, String scrap_Address,String user_Id){ 
//		
//	sqlSession.insert(scrap_Title);
//			
//		}

	
	
	
	
	
	
	
	private HashMap<String, ScrapVO> dbScrap;
	public ScrapDao2() {
		dbScrap = new HashMap<String, ScrapVO>();
	}
	
	
	
	@Override
	public ArrayList<ScrapVO> readScraps() {
		
		ArrayList<ScrapVO> scraps = new ArrayList<ScrapVO>();
		
		Set<String> keys = dbScrap.keySet();
		Iterator<String> iterator = keys.iterator();
		
		while (iterator.hasNext()) {
			String key = iterator.next();
			ScrapVO scrap = dbScrap.get(key);
			scraps.add(scrap);
		}
		
		return scraps;
	}

	@Override
	public ScrapVO readScrap(String scrap_Title) {
		
		return dbScrap.get(scrap_Title);
	}

	@Override
	public void updateScrap(int scrap_Id,  String scrap_Title, String scrap_Address,String user_Id) {
		
		ScrapVO scrap = dbScrap.get(scrap_Title);
		
		scrap.setScrap_Id(scrap_Id);
		scrap.setScrap_Title(scrap_Title);
		scrap.setScrap_Address(scrap_Address);
		scrap.setUser_Id(user_Id);
	}

	@Override
	public void deleteScrap(String scrap_Title) {
		dbScrap.remove(scrap_Title);
	}


	

	
	
}
