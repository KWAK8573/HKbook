package com.board.dao;

import java.util.ArrayList;

import com.board.domain.M_CategoryVo;





public interface IDao {
	
	public ArrayList<M_CategoryVo> listDao();
	public void writeDao(int category_Id, String movie_Category);
	public M_CategoryVo viewDao(String strID);
	public void deleteDao(String bId);
	
}
