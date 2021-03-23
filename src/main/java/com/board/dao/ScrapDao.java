package com.board.dao;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.board.domain.ScrapVO;






public class ScrapDao implements IScrapDAO {

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public ScrapDao() {
		// TODO Auto-generated constructor stub
	}
	
		
	@Override
	public ArrayList<ScrapVO> readScraps() {
		String query = "select * from scrap order by scrap_Id desc";
		ArrayList<ScrapVO> dtos = (ArrayList<ScrapVO>) template.query(query, new BeanPropertyRowMapper<ScrapVO>(ScrapVO.class));
		return dtos;
	}
	
	@Override
	public void insertScrap(final StringBuffer scrap_Address, final String scrap_Title, final String user_Id) {
		System.out.println("insertScrap()");
		
	}

	//	this.template.update(new PreparedStatementCreator() {
			
			private String scrap_Id, scrap_Title, user_Id;
			
			StringBuffer scrap_Address;

//			@Override
//			public PreparedStatement createPreparedStatement(Connection con)
//					throws SQLException {
//				String query = "insert into scrap (scrap_Id, scrap_Address, scrap_Title, user_Id) values (scrap_seq.nextval, ?, ?,?)";
//				PreparedStatement pstmt = con.prepareStatement(query);
//				
//			
//				
//				pstmt.getParameterMetaData();
//				
//				
//			pstmt.setStringBuffer(1, scrap_Address);
//					pstmt.setString(2, scrap_Title);
//				pstmt.setString(3, user_Id);
//				return pstmt;
//			}
			
			private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
				//HttpServletRequest request=new HttpServletRequest();
				request.setCharacterEncoding("EUC-KR");
				scrap_Id = request.getParameter("scrap_Id");
				scrap_Address = request.getRequestURL();
				scrap_Title = request.getParameter("scrap_Title");
				user_Id = request.getParameter("user_Id");
				
			
	//		}
			
			
		//	}		
			//	);
		
	}

	@Override
	public ScrapVO readScraps(String strID) {
		System.out.println("viewDao()");
		
		String query = "select * from scrap where scrap_Id = " + strID;
		return template.queryForObject(query, new BeanPropertyRowMapper<ScrapVO>(ScrapVO.class));
	}

	@Override
	public void deleteScrap(String bId) {
		System.out.println("deleteDao()");
		
		String query = "delete from scrap where scrap_Id = ?";
		this.template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(bId));
			}
		});

	}
	

	
	
	
	
}
