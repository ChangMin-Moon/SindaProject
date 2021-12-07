<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String m_id = request.getParameter("m_id");
		//String passwd = request.getParameter("passwd");
		String m_ssn = request.getParameter("m_ssn");
		String m_email = request.getParameter("m_email") + "@" + request.getParameter("m_email2");
		String m_gender = request.getParameter("m_gender");
		String m_size = request.getParameter("m_size");
		String m_zipcode = request.getParameter("m_zipcode");
		String m_addr1 = request.getParameter("m_addr1");
		String m_addr2 = request.getParameter("m_addr2");
		PreparedStatement pstmt = null;

		try{
			String sql = "update member set m_ssn=?, m_email=?, m_gender, m_size, m_zipcode=?, m_addr1=?, m_addr2=? where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_ssn);
			pstmt.setString(2, m_email);
			pstmt.setString(3, m_gender);
			pstmt.setString(4, m_size);
			pstmt.setString(5, m_zipcode);
			pstmt.setString(6, m_addr1);
			pstmt.setString(7, m_addr2);
			pstmt.setString(8, m_id);
			pstmt.executeUpdate();
				
			%>
			<script>
			alert('회원정보 수정이 완료되었습니다');
			location.href = "login.jsp";
			</script>
			<%
			//response.sendRedirect("list.jsp");
		} catch(SQLException e){
			%>
			<script>
			alert('회원정보 수정이 실패하였습니다');
			location.href = "login.jsp";
			</script>
			<%
		} finally{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		
	%>
</body>
</html>