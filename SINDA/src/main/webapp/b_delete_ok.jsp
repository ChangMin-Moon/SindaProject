<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String b_no = request.getParameter("b_no");
		PreparedStatement pstmt = null;
			
	
		String sql = "delete from board where b_no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, b_no);
		pstmt.executeUpdate();
	%>
		<script>
			alert('게시글 삭제가 완료되었습니다.');
			location.href="board_list.jsp";
		</script>
	<%
		//response.sendRedirect("logout.jsp");
		
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	%>
</body>
</html>