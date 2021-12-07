<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<script type="text/javascript" src="/SINDA/src/main/resources/js/validation.js"></script>
<title>상품 등록</title>
<script>
function CheckAddProduct() {
	
	var p_id= document.getElementById("p_id");
	var p_name = document.getElementById("p_name");
	var p_price = document.getElementById("p_price");
	var p_stock = document.getElementById("p_stock");
	
	//상품 아이디 체크
	if (!check(/^P[0-9]{4,11}$/, p_id, "[상품코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요"))
		return false;
	//상품 가격 체크
	if (p_price.value.length == 0 || isNaN(p_price.value)){
		alert("[가격]\n숫자만 입력하세요");
		p_price.select();
		p_price.focus();
		return false;
	}	
	
	if (p_price.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다");
		p_price.select();
		p_price.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, p_price, "[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;
		
	//재고 수 체크
	if (isNaN(p_stock.value)){
		alert("[재고 수]\n숫자만 입력하세요");
		p_stock.select();
		p_stock.focus();
		return false;
	}
	
	function check(regExp, e, msg) {
		
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newProduct.submit();
}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="admin.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
		<form name="newProduct" action="./p_add_ok.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" id="p_id" name="p_id" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="col-sm-3">
					<input type="text" id="p_name" name="p_name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="p_price" name="p_price" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-5">
					<textarea name="p_description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">카테고리</label>
				<div class="col-sm-3">
					<input type="text" name="p_category" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-3">
					<input type="text" id="p_stock" name="p_stock" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 이미지</label>
				<div class="col-sm-5">
					<input type="file" name="p_img" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="상품 등록" onclick="CheckAddProduct()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>