<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String p_id = request.getParameter("id");
	String m_id = (String) session.getAttribute("userid");
	PreparedStatement pstmt = null;
			
			String sql = "update cart set c_count = c_count + 1 where m_id = ? and p_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, p_id);
			pstmt.executeUpdate();
		%>
		<script>
		history.back();
		setTimeout("location.reload()",100);
		</script>
		<%
		if (pstmt != null)pstmt.close();
		if (conn != null)conn.close();
%>