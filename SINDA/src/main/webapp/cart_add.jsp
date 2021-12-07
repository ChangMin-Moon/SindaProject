<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String p_id = request.getParameter("id");
	String m_id = (String) session.getAttribute("userid");
	PreparedStatement pstmt = null;
			
			String sql = "insert into cart(m_id, p_id) values(?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, p_id);
			pstmt.executeUpdate();
		%>
		<script>
		alert('장바구니에 추가 되었습니다.');
		history.back();
		</script>
		<%
		if (pstmt != null)pstmt.close();
		if (conn != null)conn.close();
%>