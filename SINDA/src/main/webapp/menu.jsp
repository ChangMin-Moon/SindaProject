<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String userid = (String) session.getAttribute("userid");%>
<script>
 function search_enterkey() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
    	search.submit();
    }
}
</script>
<nav class="navbar navbar-expand navbar-light bg-primary">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./main.jsp">SINDA</a>
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when test="${empty userid }">
							<li class="nav-item"><a class="nav-link" href='<c:url value="/login.jsp"/>'>로그인</a></li>
							<li class="nav-item"><a class="nav-link" href='<c:url value="/register.jsp"/>'>회원 가입</a></li>
							<li class="nav-item"><a class="nav-link" href='<c:url value="/board_list.jsp"/>'>게시글</a></li>
							<li class="nav-item"><a class="nav-link" href="./product_list.jsp">SHOP</a></li>
							<li class="nav-item">
							<form class="d-flex" action="product_search.jsp" method="get" name="search">
								<input class="form-control me-2" type="search" placeholder="상품명 입력" aria-label="Search" name="search1" onkeyup="search_enterkey()">
								<button class="btn btn-outline-success" type="submit">검색</button>
							</form>
							</li>
						</c:when>
						<c:when test="${userid == 'admin'}">
							<li style="padding-top : 7px; color : white">[<%=userid%>님]</li>
							<li class="nav-item"><a class="nav-link" href='<c:url value="/logout.jsp"/>'>로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" href='<c:url value="/m_modify.jsp"/>'>내정보</a></li>
							<li class="nav-item"><a class="nav-link" href='<c:url value="/board_list.jsp"/>'>게시글</a></li>
							<li class="nav-item"><a class="nav-link" href="./product_list.jsp">SHOP</a></li>
							<li class="nav-item"><a class="nav-link" href="./cart.jsp">장바구니</a></li>
							<li class="nav-item"><a class="nav-link" href="./p_add.jsp">상품 등록</a></li>
							<li class="nav-item"><a class="nav-link" href="./p_edit.jsp?edit=update">상품 수정</a></li>
							<li class="nav-item"><a class="nav-link" href="./p_edit.jsp?edit=delete">상품 삭제</a></li>
							<li class="nav-item">
							<form class="d-flex" action="product_search.jsp" method="get" name="search">
								<input class="form-control me-2" type="search" placeholder="상품명 입력" aria-label="Search" name="search1" onkeyup="search_enterkey()">
								<button class="btn btn-outline-success" type="submit">검색</button>
							</form>
							</li>
						</c:when>
						<c:otherwise>
							<li style="padding-top : 7px; color : white">[<%=userid%>님]</li>
							<li class="nav-item"><a class="nav-link" href='<c:url value="/logout.jsp"/>'>로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" href='<c:url value="/m_modify.jsp"/>'>내정보</a></li>
							<li class="nav-item"><a class="nav-link" href='<c:url value="/board_list.jsp"/>'>게시글</a></li>
							<li class="nav-item"><a class="nav-link" href="./product_list.jsp">SHOP</a></li>
							<li class="nav-item"><a class="nav-link" href="./cart.jsp">장바구니</a></li>
							<li class="nav-item">
							<form class="d-flex" action="product_search.jsp" method="get" name="search">
								<input class="form-control me-2" type="search" placeholder="상품명 입력" aria-label="Search" name="search1" onkeyup="search_enterkey()">
								<button class="btn btn-outline-success" type="submit">검색</button>
							</form>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	