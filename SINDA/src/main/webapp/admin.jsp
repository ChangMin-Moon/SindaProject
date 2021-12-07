<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 접근불가</title>
</head>
<body>
	<%
	String userid = "";
	
	if(session.getAttribute("userid")!= null){
			userid=(String)session.getAttribute("userid");
	}
	
	if(!userid.equals("admin")){
		%>
		<script>
		alert("관리자 권한이 필요합니다!!")
		location.href = "logout.jsp";
		</script>
		<%
	}
%>
</body>
</html>