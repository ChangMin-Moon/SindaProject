<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="dbconn.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>장바구니</title>
<script>
	function refresh(){
		setTimeout("location.reload()",100);
	}
	function check(){
		cf.submit();
	}
</script>
</head>
<body onload="total()">
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<%-- <td align="left"><a href="./deleteCart.jsp?cartId=<%=%>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%=%>" class="btn btn-success">주문하기</a></td> --%>
				</tr>
			</table>
		</div>
		<div style="padding-top : 50px">
		<form action="cart_select.jsp" method="post" name="cf">
			<table class="table table-hover">	
				<tr class="thead-light">
					<th>선택</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				String id;
				String p_id = request.getParameter("id");
				String m_id = (String) session.getAttribute("userid");
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				int sum = 0;
				
				String sql = "select p.p_id, p.p_name, p.p_price, p.p_img, c.c_count, c.c_check from member m join cart c on c.m_id = m.m_id join product p on c.p_id = p.p_id where c.m_id = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_id);
				rs = pstmt.executeQuery();
				while(rs.next()){
					%>
					
 				<tr class="info">
 					<td class="align-middle"><input type="checkbox" style="zoom:2.0;" name = "c_check" value = "true" onclick='check()' <%if(rs.getBoolean("c_check")){%>checked<%}%>/></td>
 					<td class="align-middle"><img src="${pageContext.request.contextPath }/images/<%=rs.getString("p_img")%>" width = "70" height = "70"/></td>
					<td class="align-middle"><%=rs.getString("p_name")%></td>
					<td class="align-middle"><fmt:formatNumber value='<%=rs.getString("p_price")%>' pattern="#,###"/>원</td>
					<td class="align-middle"><a onClick="refresh()" href='./cart_down.jsp?id=<%=rs.getString("p_id")%>&c_count=<%=rs.getInt("c_count")%>' role="button"><img src='.\img\down.png' style="width: 25px; height : 25px"></a> &nbsp; <%=rs.getInt("c_count")%> &nbsp; <a onClick="refresh()" href='./cart_up.jsp?id=<%=rs.getString("p_id")%>' role="button"><img src='.\img\up.png' style="width: 25px; height : 25px"></a></td>
					<td class="align-middle"><fmt:formatNumber value='<%=rs.getInt("p_price") * rs.getInt("c_count")%>' pattern="#,###"/>원</td>
					<%
						 sum+=rs.getInt("p_price") * rs.getInt("c_count");
					%>
					<%-- <td><%=%></td> --%>
					<td class="align-middle"><a href='./cart_delete.jsp?p_id=<%=rs.getString("p_id")%>' class="badge badge-danger">삭제</a></td>
				</tr> 
				
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><fmt:formatNumber value="<%=sum%>" pattern="#,###"/>원</th>
					<th></th>
				</tr>
			</table>
			</form>
			<a href="./product_list.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
			<a href="./order.jsp" class="btn btn-primary float-right" > 주문하기</a>
		</div>
		<hr>
	</div>
	<%
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
	<jsp:include page="footer.jsp" />
</body>
</html>