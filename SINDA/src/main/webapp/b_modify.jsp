<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>게시글 수정</title>
<script>
/* function check(pw){
	if(modify.passwd.value != pw){
		alert("비밀번호가 일치하지 않습니다!");
		modify.passwd.value="";
		modify.passwd.focus();
        return false;
	}
	modify.submit();
} */

function sub(){
	modify.submit();
}
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시글 수정</h1>
		</div>
	</div>
	<%
		String b_no = request.getParameter("b_no");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String sql = "select * from board where b_no=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, b_no);
		rs = pstmt.executeQuery();
		
		String b_name = "";
		String b_subject = "";
		String b_content = "";
		String b_date = "";
		String b_views = "";
		
		if(rs.next()){
			b_name = rs.getString("b_name");
			b_subject = rs.getString("b_subject");
			b_content = rs.getString("b_content");
			b_date = rs.getString("b_date");
		}
	%>
	<div class="container">
	<form name="modify" action="b_modify_ok.jsp?b_no=<%=b_no%>" method="post" class="form-horizontal"> 
		<div class="form-group row" >
			<label class="col-sm-1">작성자</label>
			<div class="col-sm-3">
				<input type="text" name="b_name" autofocus class="form-control" value=<%=b_name%> readonly> 
			</div><label class="col-sm-1">작성일 : </label>
			<div class="col-sm-4">
				<%=b_date%>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-1">제 목</label>
			<div class="col-sm-9">
				<input type="text" name="b_subject" class="form-control" value=<%=b_subject%>>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-1">내용</label>
			<div class="col-sm-10">
				<textarea rows="13" cols="50" name="b_content" class="form-control" ><%=b_content%></textarea>
			</div>
		</div>
		<div class="form-group row" align="center">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" value="수정완료" onclick="sub()" class="btn btn-primary"> &nbsp;&nbsp;
				<input type="reset" value="다시작성" class="btn btn-danger"> &nbsp;&nbsp;
				<a class="btn btn-secondary" href="board_list.jsp">글목록</a> &nbsp;&nbsp;
			</div>
		</div>
	</form>
</div>
	
	<%
		if(rs != null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	%>
</body>
</html>