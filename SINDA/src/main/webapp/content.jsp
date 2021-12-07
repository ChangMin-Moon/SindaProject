<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>게시글 내용</title>
<style>
	.container {width: 1120px; max-width: none !important;}
	tr { display: block; float: left; }
	th, td { display: block; }
</style>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String b_no = request.getParameter("b_no");
		int b_views = Integer.parseInt(request.getParameter("b_views"));
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시글 내용</h1>
		</div>
	</div>
		<div class="container">
		<table class="table table-striped">
			<tr class="thead">
				<th>작성자명</th>
				<th>제 목</th>
				<th height="300px">내용</th>
			</tr>
 	<%
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select * from board where b_no = ?";

 		pstmt = conn.prepareStatement(sql);
 		pstmt.setString(1, b_no);
		rs = pstmt.executeQuery(); 
		
		sql = "update board set b_views = ? where b_no=?";
		
		if(rs.next()){
		%>
			<tr>
			<td><%=rs.getString("b_name")%></td>
			<td><%=rs.getString("b_subject")%></td>
			<td width="1000px"><%=rs.getString("b_content")%></td>
			</tr>
		<%
		String b_name = rs.getString("b_name");
		pageContext.setAttribute("b_name", b_name) ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, ++b_views);
		pstmt.setString(2, b_no);
		pstmt.executeUpdate();
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	%> 
	</table>
	<div class="text-align : center">
						<c:choose>
						<c:when test="${empty userid}">
							<a href="board_list.jsp" class="float-right btn btn-secondary">목록으로</a> 
						</c:when>
						<c:when test="${userid == 'admin'}">
							<a href="b_delete.jsp?b_no=<%=b_no%>" class="float-right btn btn-danger">글 삭제</a> 
							<a href="b_modify.jsp?b_no=<%=b_no%>" class="float-right btn btn-primary">글 수정</a> 
							<a href="board_list.jsp" class="float-right btn btn-secondary">목록으로</a> 
						</c:when>
						<c:when test="${userid == b_name}">
							<a href="b_delete.jsp?b_no=<%=b_no%>" class="float-right btn btn-danger">글 삭제</a> 
							<a href="b_modify.jsp?b_no=<%=b_no%>" class="float-right btn btn-primary">글 수정</a> 
							<a href="board_list.jsp" class="float-right btn btn-secondary">목록으로</a> 
						</c:when>
						<c:otherwise>
							<a href="board_list.jsp" class="float-right btn btn-secondary">목록으로</a> 
						</c:otherwise>
					</c:choose>
	</div>
	
</div>
	
</body>
</html>