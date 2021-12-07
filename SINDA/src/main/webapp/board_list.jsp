<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>게시글 목록</title>
<style>
.container {
  width: 1120px;
  max-width: none !important;
}
</style>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">SINDA</h1>
		</div>
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String name = request.getParameter("b_name");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		%>
		<div class="container">
		<a href="board.jsp" class="float-right btn btn-primary">글쓰기</a>
		<table class="table table-hover table-striped">
			<tr class="thead">
				<th width="10%">번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th width="20%">조회수</th>
			</tr>
			<%
		try {
			String sql = "select * from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()){
				%>
					<tr>
						<td><%=rs.getInt("b_no")%></td>
						<td><a href='content.jsp?b_no=<%=rs.getInt("b_no")%>&b_views=<%=rs.getInt("b_views")%>'/><%=rs.getString("b_subject")%></td>
						<td><%=rs.getString("b_name")%></td>
						<td><%=rs.getString("b_date")%></td>
						<td><%=rs.getString("b_views")%></td>
					</tr>
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
	</table>
</div>
</body>
</html>