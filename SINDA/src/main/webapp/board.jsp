<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>글쓰기</title>
<style>
.container {
  width: 1120px;
  max-width: none !important;
}
</style>
</head>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<%@ include file="menu.jsp" %>
		<%
		String m_id = "";
		if(session.getAttribute("userid") != null){
			m_id = (String)session.getAttribute("userid");
		}else%><script>location.href = "login.jsp";</script>
		<%
		if(m_id.equals("admin")){
			m_id = "관리자";
		}
		%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">SINDA</h1>
		</div>
	</div>
<div class="container">
	<form name="board" action="board_ok.jsp" method="post" class="form-horizontal"> 
		<div class="form-group row" >
			<label class="col-sm-1">작성자</label>
			<div class="col-sm-3">
				<input type="text" name="b_name" class="form-control" value="<%=m_id%>" autofocus readonly> 
			</div><label class="col-sm-1">작성일 : </label>
			<div class="col-sm-4">
				<%= sf.format(nowTime) %>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-1">제 목</label>
			<div class="col-sm-10">
				<input type="text" name="b_subject" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-1">내용</label>
			<div class="col-sm-10">
				<textarea rows="13" cols="50" name="b_content" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group row" align="center">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" value="글쓰기" class="btn btn-primary"> &nbsp;&nbsp;
				<input type="reset" value="다시작성" class="btn btn-danger"> &nbsp;&nbsp;
				<a class="btn btn-secondary" href="board_list.jsp">글목록</a> &nbsp;&nbsp;
			</div>
		</div>
		<input type="hidden" name ="b_date" value="<%= sf.format(nowTime) %>">
	</form>
</div>
</body>
</html>