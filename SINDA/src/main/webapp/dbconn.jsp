<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/sindadb?serverTimezone=UTC";
	String user = "root";
	String password = "12345";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
%>