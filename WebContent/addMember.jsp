<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 등록 화면</title>
<script>
function ch() {
	var doc=document.form;
	if(doc.email2.options[doc.email2.selectedIndex].value=="0"){
		doc.email1.disabled=true;
		doc.email1="";
	}else if(doc.email2.options[doc.email2.selectedIndex].value=="9"){
		doc.email1.disabled=false;
		doc.email1="";
		doc.email1.focus();
	}else{
		doc.email1.disabled=true;
		doc.email1.value=doc.email2.options[doc.email2.selectedIndex].value;
	}
}
function check() {
	var doc=document.form;
	if(doc.name.value==""){
		alert("이름을 입력하세요");
		doc.name.focus();
		return false;
	}if(doc.password.value==""){
		alert("비밀번호를 입력하세요");
		doc.password.focus();
		return false;
	}if(doc.passchk.value==""){
		alert("확인비밀번호를 입력하세요");
		doc.passchk.focus();
		return false;
	}if(doc.password.value!=doc.passchk.value){
		alert("비밀번호와 확인비밀번호가 일치하지 않습니다.");
		doc.password.focus();
		return false;
	}else{
		doc.email1.disabled=false;
		doc.submit();
	}
}

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section class="sec1">
<%
int ma=0;
try{
	String sql="select max(id) from member0728";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
	}
}catch(SQLException e){
	e.printStackTrace();
	
}
%>
<h2>회원 가입 등록 화면</h2>
<hr>
<form name="form" method="post" action="addMemberProcess.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">아이디</th>
		<td>
			<input type="text" name="id" value="<%=ma%>">
		</td>
</tr>
<tr>
	<th class="th1">성 명</th>
		<td>
			<input type="text" name="name">
		</td>
</tr>
<tr>
	<th class="th1">비밀번호</th>
		<td>
			<input type="password" name="password">
		</td>
</tr>
<tr>
	<th class="th1">비밀번호 확인</th>
		<td>
			<input type="password" name="passchk">
		</td>
</tr>
<tr>
	<th class="th1">성 별</th>
		<td>
			<input type="radio" name="gender" value="1" checked>남성
			<input type="radio" name="gender" value="2">여성
		</td>
</tr>
<tr>
	<th class="th1">생일</th>
		<td>
			<input type="number" name="birth">년
			<input type="number" name="birth1">월
			<input type="number" name="birth2">일
		</td>
</tr>
<tr>
	<th class="th1">이메일</th>
		<td>
			<input type="text" name="email" placeholder="이메일">@
			<input type="text" name="email1" value=""disabled>
			<select name="email2" onchange="ch()">
				<option value="0">선택하세요</option>
				<option value="9">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="gmail.com">gmail.com</option>
			</select>
		</td>
</tr>
<tr>
	<th class="th1">연락처</th>
		<td>
			<input type="text" name="phone">
		</td>
</tr>
<tr>
	<th class="th1">주소</th>
		<td>
			<input type="text" name="address">
		</td>
</tr>
<tr>
	<th class="th1">관심분야</th>
		<td>
			<input type="checkbox" name="interest" value="프로그램">프로그램
			<input type="checkbox" name="interest" value="독서">독서
			<input type="checkbox" name="interest" value="등산">등산
			<input type="checkbox" name="interest" value="여행">여행
			<input type="checkbox" name="interest" value="컴퓨터">컴퓨터
			<input type="checkbox" name="interest" value="영화">영화
			<input type="checkbox" name="interest" value="운동">운동
			<input type="checkbox" name="interest" value="진학">진학
		</td>
</tr>
<tr>
	<td colspan="2" class="td1">
		<input type="button" value="등록" onclick="check()" class="bt1">
		<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
	</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>