package com.board.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JoinOk
 */
//@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private Connection connection;
	private Statement stmt;
	
	private String scrap_Id, scrap_Title, user_Id;

	StringBuffer scrap_Address;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinOk() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		scrap_Id = request.getParameter("scrap_Id");
		scrap_Title = request.getParameter("scrap_Title");
		scrap_Address=request.getRequestURL();
		user_Id = request.getParameter("user_Id");
			
		
		String query = "insert into scrap values('" + scrap_Id + "','" + scrap_Title + "', '" + scrap_Title+ "', '" + user_Id + "' )";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "mboard" , "mboard");
			stmt = connection.createStatement();
			int i = stmt.executeUpdate(query);
			if(i == 1){
				System.out.println("insert success");
				response.sendRedirect("joinResult.jsp");
			} else {
				System.out.println("insert fail");
				response.sendRedirect("join.html");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt != null) stmt.close();
				if(connection != null) connection.close();
			} catch (Exception e) {}
		}
		
	}

}
