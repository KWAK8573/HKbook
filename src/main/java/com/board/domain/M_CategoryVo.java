package com.board.domain;

public class M_CategoryVo {

	private int category_Id;
	private String movie_Category;
	
	public int getCategory_Id() {
		return category_Id;
	}
	public void setCategory_Id(int category_Id) {
		this.category_Id = category_Id;
	}
	public String getMovie_Category() {
		return movie_Category;
	}
	public void setMovie_Category(String movie_Category) {
		this.movie_Category = movie_Category;
	}
	@Override
	public String toString() {
		return "M_CategoryVo [category_Id=" + category_Id + ", movie_Category=" + movie_Category + "]";
	}
	
	



}
