<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<%
	
	String p_id = request.getParameter("p_id");
	String m_id = (String) session.getAttribute("userid");
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	String sql = "select * from cart where m_id=? and p_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, m_id);
	pstmt.setString(2, p_id);
	rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 상품 삭제</title>
</head>
<body onload="login()">
	<script>
		function login(){
			var user = confirm("정말 해당 상품을 장바구니에서 삭제 하시겠습니까?");
			if(user){
				location.href="cart_delete_ok.jsp?p_id=<%=p_id%>";
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