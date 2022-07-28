<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String birth=request.getParameter("birth")+"-"+request.getParameter("birth1")+"-"+request.getParameter("birth2");
String email=request.getParameter("email")+"@"+request.getParameter("email1");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String interest[]=request.getParameterValues("interest");
String insum="";
try{
	String sql="update member0728 set password=?,name=?,gender=?,birth=?,email=?,phone=?,address=?,interest=?,timestamp=sysdate where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(9, id);
	pstmt.setString(1, password);
	pstmt.setString(2, name);
	pstmt.setString(3, gender);
	pstmt.setString(4, birth);
	pstmt.setString(5, email);
	pstmt.setString(6, phone);
	pstmt.setString(7, address);
	for(int i=0;i<interest.length;i++){
		if(i==0){
			insum=interest[i];
		}else{
			insum+=","+interest[i];
		}
	}
	pstmt.setString(8, insum);
	pstmt.executeUpdate();
	%> <script>
		alert("수정이 완료되었습니다!");
		location.href="memberSelect.jsp";
	</script>
	<%
			
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}
%>
</body>
</html>