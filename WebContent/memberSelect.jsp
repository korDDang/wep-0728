<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="nav.jsp"%>
<%@ include file="DBConn.jsp"%>
<section class="sec1">
<h3>회원 목록</h3>
<%
int cnt=0;
try{
	String sql="select count(*)from member0728";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>명의 회원이 있습니다.</div>
<hr>
<table border="1" class="tab2">
<tr>
	<th class="th1">id</th>
	<th class="th1">성명</th>
	<th class="th1">비밀번호</th>
	<th class="th1">성별</th>
	<th class="th1">생년월일</th>
	<th class="th1">이메일</th>
	<th class="th1">연락처</th>
	<th class="th1">주소</th>
	<th class="th1">관심분야</th>
	<th class="th1">구분</th>
</tr>
<%
try{
	String sql="select id,password,name,gender,birth,email,phone,address,interest from member0728";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String password=rs.getString(2);
		String name=rs.getString(3);
		String gender=rs.getString(4);
		switch(gender){
		case "1" : gender="남성";
		break;
		case "2" : gender="여성";
		break;
		}
		String birth=rs.getString(5);
		String email=rs.getString(6);
		String phone=rs.getString(7);
		String address=rs.getString(8);
		String interest=rs.getString(9);
		
	
%>
<tr>
	<td class="td2"><%=id %></td>
	<td class="td2"><%=name %></td>
	<td class="td2"><%=password %></td>
	<td class="td2"><%=gender %></td>
	<td class="td2"><%=birth %></td>
	<td class="td2"><%=email %></td>
	<td class="td2"><%=phone %></td>
	<td class="td2"><%=address %></td>
	<td class="td2"><%=interest %></td>
	<td class="td2">
	<a href="update_member.jsp?id=<%=id %>">수정</a> /
	<a href="delete_member.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
	</td>
</tr>
<%
	}
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("조회 실패");
	}
%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='addMember.jsp'" class="bt1"></div>
</section>
<%@ include file="footer.jsp"%>
</body>
</html>