package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;





//public class ScrapDao implements IScrapDao2{

//	JdbcTemplate template;
//	
//	@Autowired
//	public void setTemplate(JdbcTemplate template) {
//		this.template = template;
//	}
//	
//	public ScrapDao() {
//		// TODO Auto-generated constructor stub
//	}
//	
//	@Override
//	public ArrayList<ScrapVO> readScrap() {
//		String query = "select * from scrap order by scrap_Id desc";
//		ArrayList<ScrapVO> dtos = (ArrayList<ScrapVO>) template.query(query, new BeanPropertyRowMapper<ScrapVO>(ScrapVO.class));
//		return dtos;
//	}
//	
//	
//	@Override
//	public void insertScrap(final int scrap_Id, final String scrap_Title, final String scrap_Address, final String user_Id) {
//		System.out.println("insertScrap()");
//		
//		this.template.update(new PreparedStatementCreator() {
//			
//			@Override
//			public PreparedStatement createPreparedStatement(Connection con)
//					throws SQLException {
//				String query = "insert into scrap * values (scrap_seq.nextval, ?, ?, ?)";
//				PreparedStatement pstmt = con.prepareStatement(query);
//				pstmt.setString(1, scrap_Title);
//				pstmt.setString(2, scrap_Address);
//				pstmt.setString(3, user_Id);
//				return pstmt;
//			}
//		});
//		
//	}
//
//	
//	@Override
//	public ScrapVO viewDao(String strID) {
//		System.out.println("viewDao()");
//		
//		String query = "select * from board where mId = " + strID;
//		return template.queryForObject(query, new BeanPropertyRowMapper<ScrapVO>(ScrapVO.class));
//	}
//
//	
//	@Override
//	public void deleteDao(final String bId) {
//		System.out.println("deleteDao()");
//		
//		String query = "delete from board where mId = ?";
//		this.template.update(query, new PreparedStatementSetter() {
//			
//			@Override
//			public void setValues(PreparedStatement ps) throws SQLException {
//				ps.setInt(1, Integer.parseInt(bId));
//			}
//		});
//		
//	}
//
//}
