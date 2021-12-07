<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
			<%
				String productId = request.getParameter("id");
			
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product where p_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, productId);
				rs = pstmt.executeQuery();
				if(rs.next()){
			%>
			<div class="container">
				<div class="row">
					<div class="col-md-5">
				<img src='${pageContext.request.contextPath }/images/<%=rs.getString("p_img")%>' style="width: 100%">
					</div>
					<div class="col-md-7">
						<form name="newProduct" action="./p_modify.jsp" class="form-horizontial" method="post" enctype="multipart/form-data">
							<div class="form-group row">
								<label class="col-sm-2">상품 코드</label>
								<div class="col-sm-3">
									<input type="text" id="p_id" name="p_id" class="form-control" value='<%=rs.getString("p_id") %>' readonly>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">상품명</label>
								<div class="col-sm-3">
									<input type="text" id="p_name" name="p_name" class="form-control" value='<%=rs.getString("p_name") %>'>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">가격</label>
								<div class="col-sm-3">
									<input type="text" id="p_price" name="p_price" class="form-control" value='<%=rs.getInt("p_price") %>'>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">상세 설명</label>
								<div class="col-sm-5">
									<textarea name="p_description" rows="2" cols="50"class="form-control"><%=rs.getString("p_description")%></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">분류</label>
								<div class="col-sm-3">
									<input type="text" name="p_category" class="form-control" value='<%=rs.getString("p_category") %>'>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">재고 수</label>
								<div class="col-sm-3">
									<input type="text" id="p_stock" name="p_stock" class="form-control" value='<%=rs.getLong("p_stock") %>'>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2">이미지</label>
								<div class="col-sm-5">
									<input type="file" name="p_image" class="form-control">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-primary" value="등록">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<%
				}
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			%>		
</body>
</html>