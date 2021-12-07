<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>로그인</title>
<script>
function check(){
	//아이디를 입력하지 않았다면 경고창
	if(!login.m_id.value){
		alert("아이디를 입력하세요!");
		login.m_id.focus();
        return false;
	}
	
	//비밀번호를 입력하지 않았다면 경고창
	if(!login.m_pw.value){
		alert("비밀번호를 입력하세요!");
		login.m_pw.focus();
        return false;
	}
/* 	
 	login2.j_username.value = login.m_id.value;
	login2.j_password.value = login.m_pw.value; 
	
 	login2.submit();  */
	login.submit();
}

function enterkey() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
    	check();
    }
}

</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">SINDA</h1>
		</div>
	</div>
	<%
		String m_id = "";
		if(session.getAttribute("userid") != null){
			m_id = (String)session.getAttribute("userid");
		}
		if(m_id.equals("admin")){
	%>
		<div class="container">
		
			<div class="col-md-4 col-md-offset-4">
			<h2 class="form-heading">로그인 성공</h2>
			<h2 class="form-heading">관리자님 환영합니다.</h2>
			<a href="logout.jsp" class="btn btn-secondary">로그아웃</a>
			<a href="list.jsp" class="btn btn-primary">회원목록보기</a>
			</div>
		</div>
	<%		
		}
		else if(!m_id.equals("")){
	%>
		<div class="container">
			<div class="col-md-4 col-md-offset-4">
			<h2 class="form-heading">로그인 성공</h2>
			<h2 class="form-heading"><%=m_id %>님 환영합니다.</h2>
			<a href="logout.jsp" class="btn btn-secondary">로그아웃</a>
			<a href="m_modify.jsp" class="btn btn-primary">회원정보수정</a>
			<a href="delete.jsp?id=<%=m_id%>" class="btn btn-danger">회원탈퇴</a>
			</div>
		</div>
	<%
		}
		else{
	%>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">로그인</h3>
			<form class="form-signin" action="login_ok.jsp" method="post" name="login">
				<div class="form-group">
					<label class="sr-only">아이디 </label>
					<input type="text" class="form-control" placeholder="ID" name='m_id' required autofocus>
				</div>
				<div class="form-group">
					<label class="sr-only">비밀번호 </label>
					<input type="password" class="form-control" placeholder="Password" name='m_pw' onkeyup="enterkey()" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="button" onclick="check()">로그인</button>
				<button class="btn btn btn-lg btn-secondary btn-block" type="button" onclick="location.href='./register.jsp'">회원가입</button>
			</form>
<!-- 			<form action="j_security_check" name="login2" method="post">
				<input type="hidden" name="j_username">
				<input type="hidden" name="j_password">
			</form> -->
		</div>
	</div>
	<% } %>
</body>
</html>