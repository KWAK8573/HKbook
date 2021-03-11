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

import com.board.domain.M_CategoryVo;


public class M_CategoryDao implements IDao{

	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public M_CategoryDao() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public ArrayList<M_CategoryVo> listDao() {
		String query = "select * from M_CATEGORY order by category_Id desc";
		ArrayList<M_CategoryVo> dtos = (ArrayList<M_CategoryVo>) template.query(query, new BeanPropertyRowMapper<M_CategoryVo>(M_CategoryVo.class));
		return dtos;
	}
	
	
	@Override
	public void writeDao(final int category_Id,final String movie_Category) {
		System.out.println("writeDao()");
		
		this.template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				String query = "insert into M_CATEGORY (category_Id, movie_Category) values (?, ?)";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, category_Id);
				pstmt.setString(2, movie_Category);
				
				return pstmt;
			}
		});
		
	}

	
	@Override
	public M_CategoryVo viewDao(String strID) {
		System.out.println("viewDao()");
		
		String query = "select * from M_CATEGORY where category_Id = " + strID;
		return template.queryForObject(query, new BeanPropertyRowMapper<M_CategoryVo>(M_CategoryVo.class));
	}

	
	@Override
	public void deleteDao(final String bId) {
		System.out.println("deleteDao()");
		
		String query = "delete from M_CATEGORY where category_Id = ?";
		this.template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(bId));
			}
		});
		
	}

}
