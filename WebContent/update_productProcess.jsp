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
String unitprice=request.getParameter("unitprice");
String name=request.getParameter("name");
String description=request.getParameter("description");
String category=request.getParameter("category");
String manufacturer=request.getParameter("manufacturer");
String unitsInstock=request.getParameter("unitsInstock");
String condition=request.getParameter("condition");


try{
	String sql="update product0728 set name=?,unitprice=?,description=?,category=?,manufacturer=?,unitsInstock=?,condition=? where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(8, productId);
	pstmt.setString(1, name);
	pstmt.setString(2, unitprice);
	pstmt.setString(3, description);
	pstmt.setString(4, category);
	pstmt.setString(5, manufacturer);
	pstmt.setString(6, unitsInstock);
	pstmt.setString(7, condition);
	pstmt.executeUpdate();
	%> <script>
		alert("수정이 완료되었습니다!");
		location.href="productSelect.jsp";
	</script>
	<%
			
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}
%>
</body>
</html>