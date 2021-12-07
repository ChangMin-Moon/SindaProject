<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String b_no = request.getParameter("b_no");
		String b_name = request.getParameter("b_name");
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content");
		PreparedStatement pstmt = null;
		 
		try{
			String sql = "update board set b_name=?, b_subject=?, b_content=? where b_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b_name);
			pstmt.setString(2, b_subject);
			pstmt.setString(3, b_content);
			pstmt.setString(4, b_no);
			pstmt.executeUpdate();
			%>
			<script>
			alert('게시글 수정이 완료되었습니다');
			location.href = "board_list.jsp";
			</script>
			<%
		} catch(SQLException e){
			%>
			<script>
			alert('게시글 수정이 실패하였습니다');
			location.href = "board_list.jsp";
			</script>
			<%
		} finally{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		
	%>
</body>
</html>