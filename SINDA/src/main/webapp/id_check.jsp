<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>아이디 중복검사</title>
<script>
	function sendCheckValue(){
		opener.document.register.m_id_check.value="idCheck";
		opener.document.register.m_pw.focus();
		if (opener != null) {
			self.close();
		}
	}
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String m_id = request.getParameter("m_id");
		String rid = null;
		
		boolean id_check = true;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "select m_id from member where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m_id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				rid=rs.getString("m_id"); 
			}
			
			if(m_id.equals(rid)){
	%>
		<div class="container">
			<div class="jumbotron">
				<h5 class="display-5">
				중복된 아이디로 사용 불가능한 아이디 입니다. <br>
				새로운 아이디를 입력해 주세요! <br>
				</h5>
				<input type="button" value="닫기" onclick="window.close()" class="btn btn-secondary">
			</div>
		</div>
	<%
			} else {
	%>
		<div class="container">
			<div class="jumbotron">
				<h5 class="display-5">
				사용 가능한 아이디입니다. <br>
				</h5>
				<input type="button" value="사용하기" onclick="sendCheckValue()" class="btn btn-secondary">
			</div>
		</div>
	<%
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