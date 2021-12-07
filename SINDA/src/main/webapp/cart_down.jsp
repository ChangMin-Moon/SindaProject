<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 상품 삭제처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String p_id = request.getParameter("id");
		String m_id = (String) session.getAttribute("userid");
		PreparedStatement pstmt = null;
			
	
		String sql = "delete from cart where m_id=? and p_id=? order by c_id desc limit 1";
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
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	%>
</body>
</html>