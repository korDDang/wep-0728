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
String productId=request.getParameter("productId");
try{
	String sql="delete from product0728 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.executeUpdate();
	%> <script>
		alert("상품 삭제 성공");
		location.href="productSelect.jsp";
	</script>
	<%
			
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}
%>
</body>
</html>