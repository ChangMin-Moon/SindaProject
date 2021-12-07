<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 목록</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1> 
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()){
			%>
					<div class="col-md-4">
						<a href='./product.jsp?id=<%=rs.getString("p_id")%>' role="button"><img src='${pageContext.request.contextPath }/images/<%=rs.getString("p_img")%>' style="width: 250px; height : 200px"></a>
						<a href='./product.jsp?id=<%=rs.getString("p_id")%>' role="button"><h3><%=rs.getString("p_name")%></h3></a>
						<a href='./product.jsp?id=<%=rs.getString("p_id")%>' role="button"><p><%=rs.getString("p_description")%></p></a>
						<a href='./product.jsp?id=<%=rs.getString("p_id")%>' role="button"><p><%=rs.getString("p_price")%>원</p></a>
						<p> <a href='./product.jsp?id=<%=rs.getString("p_id")%>' class="btn btn-primary text-white" role="button">상세 정보 &raquo;</a>
					</div>
			<%
				}
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>