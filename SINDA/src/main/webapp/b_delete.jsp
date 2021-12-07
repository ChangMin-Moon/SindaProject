<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%
	
	String b_no = request.getParameter("b_no");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String sql = "select b_name from board where b_no=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, b_no);
	rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body onload="login()">
	<script>
		function login(){
			var user = confirm("정말 해당 게시글을 삭제 하시겠습니까?");
			if(user){
				location.href="b_delete_ok.jsp?b_no=<%=b_no%>";
			}else history.back();
		}
<%-- 		function check(){
			var pass = prompt("비밀번호를 입력하세요");
			if(pass == <%=passwd%>){
				location.href="delete_ok.jsp?num=<%=b_no%>";
			} else {
				alert("비밀번호가 일치하지 않습니다!");
				history.back();
			}
		} --%>
	</script>
</body>
</html>