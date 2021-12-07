<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_ssn = request.getParameter("m_ssn");
		String m_email = request.getParameter("m_email") + "@" + request.getParameter("m_email2");
		String m_gender = request.getParameter("m_gender");
		String m_size = request.getParameter("m_size");
		String m_zipcode = request.getParameter("m_zipcode");
		String m_addr1 = request.getParameter("m_addr1");
		String m_addr2 = request.getParameter("m_addr2");
		
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into member(m_id, m_pw, m_ssn, m_email, m_gender, m_size, m_zipcode, m_addr1, m_addr2) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			pstmt.setString(3, m_ssn);
			pstmt.setString(4, m_email);
			pstmt.setString(5, m_gender);
			pstmt.setString(6, m_size);
			pstmt.setString(7, m_zipcode);
			pstmt.setString(8, m_addr1);
			pstmt.setString(9, m_addr2);
			pstmt.executeUpdate();
			%>
			<script>alert('회원가입을 축하드립니다.');
					location.href = "login.jsp";
			</script>
			
			<%
			
		}catch (SQLException e) {
			out.println("테이블 삽입 실패!");
		}finally{
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>