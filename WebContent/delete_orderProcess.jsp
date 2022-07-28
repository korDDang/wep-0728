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
String orderDate=request.getParameter("orderDate");
String orderName=request.getParameter("orderName");
try{
	String sql="delete from order0728 where orderDate=? and orderName=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, orderDate);
	pstmt.setString(2, orderName);
	
	pstmt.executeUpdate();
	%> <script>
		alert("주문 삭제 성공");
		location.href="memberSelect.jsp";
	</script>
	<%
			
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}
%>
</body>
</html>