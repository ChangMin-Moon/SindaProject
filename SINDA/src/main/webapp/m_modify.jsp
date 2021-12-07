<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script>
function id_check(m_id){
	if(m_id==""){
			alert("중복 체크할 아이디를 입력하세요!");
			register.m_id.focus();
			return false;
	}
	url = 'id_check.jsp?m_id='+m_id;
	window.open(url,'_blank','width=500,height=200');
}

function input_id_check(){
	register.m_id_check.value="idUncheck";
}

function search_addr(){
	window.open('jusoPopup.jsp','_blank','width=570, height=420, left=0, top=0');
}

function jusoCallBack(m_zipcode, m_addr1, m_addr2){
	register.m_zipcode.value = m_zipcode;
	register.m_addr1.value = m_addr1;
	register.m_addr2.value = m_addr2;
}

function mailcheck(){
	i=register.m_email3.selectedIndex;
	var mail=register.m_email3.options[i].value;
	register.m_email2.value = mail;
}


function check(){
	//아이디를 입력하지 않았다면 경고창
	if(!register.m_id.value){
		alert("아이디를 입력하세요!");
		register.m_id.focus();
        return false;
	}	
	
	if(register.m_id_check.value != "idCheck"){
		alert("아이디 중복체크를 해주세요!");
		return false;
	}
	
	//비밀번호를 입력하지 않았다면 경고창
	if(!register.m_pw.value){
		alert("비밀번호를 입력하세요!");
		register.m_pw.focus();
        return false;
	}
	
	//비밀번호 6자리 이상 입력하지 않았다면 경고창
	if(register.m_pw.value.length<6){
		alert("비밀번호를 6자 이상 입력하세요!");
		register.m_pw.value="";
		register.m_pw2.value="";
		register.m_pw.focus();
		return false;
	}
	
	//비밀번호 영문과 숫자를 반드시 포함한게 아니라면 경고창
	var exp3 = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	if(!exp3.test(register.m_pw.value)){
		alert("비밀번호는 영문과 숫자를 반드시 포함해야 합니다!");
		register.m_pw.value="";
		register.m_pw2.value="";
		register.pw.focus();
		return false;
	}
	
	//비밀번호 확인을 입력하지 않았다면 경고창
	if(!register.m_pw2.value){
		alert("비밀번호 확인을 입력하세요!");
		register.m_pw2.focus();
        return false;
	}
	
	//비밀번호와 비밀번호 확인이 같지 않다면 경고창
	if(!(register.m_pw.value)==(register.m_pw2.value)){
		alert("비밀번호와 비밀번호 확인이 같지 않습니다!");
		register.m_pw.value="";
		register.m_pw2.value="";
		register.m_pw.focus();
        return false;
	}
	
	//생년월일을 입력하지 않았다면 경고창
	if(!register.m_ssn.value){
		alert("생년월일을 입력하세요!");
		register.m_ssn.focus();
        return false;
	}
	
	//이메일을 입력하지 않았다면 경고창
	if(!register.m_email.value){
		alert("전자우편을 입력하세요!");
		register.m_email.focus();
        return false;
	}
	
	//이메일을 입력하지 않았다면 경고창
	if(!register.m_email2.value){
		alert("전자우편을 입력하세요!");
		register.m_email2.focus();
        return false;
	}
	
	//이메일 형식에 맞지 않는다면 경고창
 	var exp1 = /^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
    if(!((register.m_email.value + "@" + register.m_email2.value).match(exp1))){
        alert("이메일 형식에 맞게 입력하세요!");
        register.m_email.value="";
        register.m_email.focus();
        return false;
    } 
	register.submit();
}
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String sql = "select * from member where m_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
		
		
		String rid = "";
		String m_ssn = "";
		String m_email = "";
		String m_gender = "";
		String m_size = "";
		String m_zipcode = "";
		String m_addr1 = "";
		String m_addr2 = "";
		
		if(rs.next()){
			rid = rs.getString("m_id");
			m_ssn = rs.getString("m_ssn");
			m_email = rs.getString("m_email");
			if(rs.getString("m_gender") != null)
			m_gender = rs.getString("m_gender");
			if(rs.getString("m_size") != null)
			m_size = rs.getString("m_size");
			m_zipcode = rs.getString("m_zipcode");
			m_addr1 = rs.getString("m_addr1");
			m_addr2 = rs.getString("m_addr2");
		}
		String[] array = m_email.split("@");
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보 수정</h1>
		</div>
	</div>
<div class="container">
	<label class="col-sm-3"><span class="text text-danger"> *</span>는 필수입력항목입니다.</label>
	<form name="register" action="m_modify_ok.jsp" method="post" class="form-horizontal">
		<div class="form-group row">
			<label class="col-sm-2"><span class="text text-danger">*</span> 아이디 </label>
			<div class="col-sm-3">
				<input type="text" name="m_id" autofocus class="form-control" onkeydown="input_id_check()" value="<%=rid%>" readonly> 
			</div>
			<div class="col-sm-3">
				<input type="button" value="중복검사" onclick="id_check(register.m_id.value)" class="btn btn-secondary">
				<input type="hidden" name="m_id_check" value="idUncheck">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><span class="text text-danger">*</span> 비밀번호 </label>
			<div class="col-sm-3">
				<input type="password" name="m_pw" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><span class="text text-danger">*</span> 비밀번호 확인 </label>
			<div class="col-sm-3">
				<input type="password" name="m_pw2" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><span class="text text-danger">*</span> 생년월일 </label>
			<div class="col-sm-3">
				<input type="text" name="m_ssn" maxlength="8" size="8" class="form-control" value="<%=m_ssn%>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><span class="text text-danger">*</span> 전자우편 </label>
			<div class="col-sm-3">
				<input type="text" name="m_email" class="form-control" value="<%=array[0]%>">
			</div>
			@
			<div class="col-sm-3">
				<input type="text" name="m_email2" class="form-control" value="<%=array[1]%>">
			</div>
			<div class="col-sm-3">
				<select name="m_email3" class="form-control" onChange="mailcheck()">
				<option class="form-control" value="">직접 선택</option>
				<option class="form-control" value="naver.com">naver.com</option>
				<option class="form-control" value="daum.net">daum.net</option>
				<option class="form-control" value="hanmail.net">hanmail.net</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">성별 </label>
			<div class="col-sm-5">
				<input type="radio" name="m_gender" value="남" <%if(m_gender.equals("남")){%>checked<%}%>>남
				<input type="radio" name="m_gender" value="여" <%if(m_gender.equals("남")){%>checked<%}%>>여
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">신발 사이즈 </label>
			<div class="col-sm-3">
				<select name="m_size" class="form-control">
				<option class="form-control" value="">직접 선택</option>
				<%for(int i = 230; i>=230 && i<=280; i+=5){
					String sc = Integer.toString(i);%>
					<option class="form-control" value="<%=i%>" <%if(m_size.equals(sc)){%>selected<%}%>><%=i%></option>
				<%}%>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">우편번호 </label>
			<div class="col-sm-3">
				<input type="text" name="m_zipcode" size="5"  maxlength="5" class="form-control"  onclick="search_addr()" value="<%=m_zipcode%>" readonly> 
			</div>
			<div class="col-sm-3">
				<input type="button" value="우편검색" onclick="search_addr()" class="btn btn-secondary">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">주소 </label>
			<div class="col-sm-3">
				<input type="text" name="m_addr1" size="50" class="form-control" onclick="search_addr()" value="<%=m_addr1%>" readonly>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">상세주소 </label>
			<div class="col-sm-3">
				<input type="text" name="m_addr2" size="50" class="form-control" value="<%=m_addr2%>">
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" value="회원가입" onclick="check()" class="btn btn-primary"> &nbsp;&nbsp;
				<input type="reset" value="취소" class="btn btn-danger" >
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