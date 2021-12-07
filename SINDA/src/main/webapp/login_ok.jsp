<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "select m_id, m_pw from member where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()){
				String rid = rs.getString("m_id");
				String rpw = rs.getString("m_pw");
				
				if (m_id.equals(rid) && m_pw.equals(rpw)){
					session.setAttribute("userid", m_id);
					response.sendRedirect("login.jsp");
				}else {
					//response.sendRedirect("logout.jsp");
					%><script>
					alert("입력하신 비밀번호가 일치하지 않습니다!");
					location.href = "logout.jsp";
					</script><%
				}
			}else {
				//response.sendRedirect("logout.jsp");
				%><script>
				alert("입력하신 아이디가 존재하지 않습니다!");
				location.href = "logout.jsp";
				</script><%
			}
		}catch(SQLException e){
			out.println("오류 발생!");
		}finally{
			if (rs != null)rs.close();
			if (pstmt != null)pstmt.close();
			if (conn != null)conn.close();
		}
	%>
</body>
</html>