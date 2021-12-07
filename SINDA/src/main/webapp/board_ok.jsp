<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String b_name = request.getParameter("b_name");
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content");
		String b_date = request.getParameter("b_date");
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into board(b_name, b_subject, b_content, b_date, b_views) values(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_name);
			pstmt.setString(2, b_subject);
			pstmt.setString(3, b_content);
			pstmt.setString(4, b_date);
			pstmt.setInt(5, 0);
			pstmt.executeUpdate();
			%>
			<script>
			alert('게시글 작성 완료');
			location.href = "board_list.jsp";
			</script>
			<%
		}catch (SQLException e) {
			%>
			<script>
			alert('게시글 작성 실패');
			location.href = "board_list.jsp";
			</script>
			<%
		}finally{
			if (pstmt != null)pstmt.close();
			if (conn != null)conn.close();
		}
		
	//response.sendRedirect("board_list.jsp");
	%>
	
</body>
</html>