<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정 화면</title>
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
		doc.id.focus();
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
String id=request.getParameter("id");
try{
	String sql="select password,name,gender,to_char(birth,'YYYY-MM-DD'),email,phone,address,interest from member0728 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String password=rs.getString(1);
		String name=rs.getString(2);
		String gender=rs.getString(3);
		String birth=rs.getString(4);
		String br[]=birth.split("-");
		String email=rs.getString(5);
		String em[]=email.split("@");
		String phone=rs.getString(6);
		String address=rs.getString(7);
		String interest=rs.getString(8);
		String in[]=interest.split(",");
		
	
%>
<h2>회원 정보 수정 화면</h2>
<hr>
<form name="form" method="post" action="update_memberProcess.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">아이디</th>
		<td>
			<input type="text" name="id" value="<%=id%>">
		</td>
</tr>
<tr>
	<th class="th1">성 명</th>
		<td>
			<input type="text" name="name" value="<%=name%>">
		</td>
</tr>
<tr>
	<th class="th1">비밀번호</th>
		<td>
			<input type="password" name="password" value="<%=password%>">
		</td>
</tr>
<tr>
	<th class="th1">비밀번호 확인</th>
		<td>
			<input type="password" name="passchk" value="<%=password%>">
		</td>
</tr>
<tr>
	<th class="th1">성 별</th>
		<td>
			<input type="radio" name="gender" value="1" <%=gender.equals("1")?"checked":"" %>>남성
			<input type="radio" name="gender" value="2" <%=gender.equals("2")?"checked":"" %>>여성
		</td>
</tr>
<tr>
	<th class="th1">생일</th>
		<td>
			<input type="number" name="birth" value="<%=br[0]%>">년
			<input type="number" name="birth1" value="<%=br[1]%>">월
			<input type="number" name="birth2" value="<%=br[2]%>">일
		</td>
</tr>
<tr>
	<th class="th1">이메일</th>
		<td>
			<input type="text" name="email" placeholder="이메일" value="<%=em[0]%>">@
			<input type="text" name="email1"  value="<%=em[1]%>">
			<select name="email2" onchange="ch()">
				<option value="0" <%=em[1].equals("0")?"selected":""%>>선택하세요</option>
				<option value="9" <%=em[1].equals("9")?"selected":""%>>직접입력</option>
				<option value="naver.com" <%=em[1].equals("naver.com")?"selected":""%>>naver.com</option>
				<option value="daum.net" <%=em[1].equals("daum.net")?"selected":""%>>daum.net</option>
				<option value="nate.com" <%=em[1].equals("nate.com")?"selected":""%>>nate.com</option>
				<option value="hotmail.com" <%=em[1].equals("hotmail.com")?"selected":""%>>hotmail.com</option>
				<option value="gmail.com" <%=em[1].equals("gmail.com")?"selected":""%>>gmail.com</option>
			</select>
		</td>
</tr>
<tr>
	<th class="th1">연락처</th>
		<td>
			<input type="text" name="phone" value="<%=phone%>">
		</td>
</tr>
<tr>
	<th class="th1">주소</th>
		<td>
			<input type="text" name="address" value="<%=address%>">
		</td>
</tr>
<tr>
	<th class="th1">관심분야</th>
		<td>
			<input type="checkbox" name="interest" value="프로그램" <%for(int i=0;i<in.length;i++){if(in[i].equals("프로그램")){%>checked<%}}%>>프로그램
			<input type="checkbox" name="interest" value="독서" <%for(int i=0;i<in.length;i++){if(in[i].equals("독서")){%>checked<%}}%>>독서
			<input type="checkbox" name="interest" value="등산" <%for(int i=0;i<in.length;i++){if(in[i].equals("등산")){%>checked<%}}%>>등산
			<input type="checkbox" name="interest" value="여행" <%for(int i=0;i<in.length;i++){if(in[i].equals("여행")){%>checked<%}}%>>여행
			<input type="checkbox" name="interest" value="컴퓨터" <%for(int i=0;i<in.length;i++){if(in[i].equals("컴퓨터")){%>checked<%}}%>>컴퓨터
			<input type="checkbox" name="interest" value="영화" <%for(int i=0;i<in.length;i++){if(in[i].equals("영화")){%>checked<%}}%>>영화
			<input type="checkbox" name="interest" value="운동" <%for(int i=0;i<in.length;i++){if(in[i].equals("운동")){%>checked<%}}%>>운동
			<input type="checkbox" name="interest" value="진학" <%for(int i=0;i<in.length;i++){if(in[i].equals("진학")){%>checked<%}}%>>진학
		</td>
</tr>
<tr>
	<td colspan="2" class="td1">
		<input type="button" value="수정" onclick="check()" class="bt1">
		<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
	</td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		
	}
%>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>