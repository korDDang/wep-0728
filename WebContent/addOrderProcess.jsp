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
String productId=request.getParameter("productId");
String orderQty =request.getParameter("orderQty");
int qty=0;
String unitprice=request.getParameter("unitprice");
String orderAddress=request.getParameter("orderAddress");
try{
	String sql="insert into order0728 values(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, orderDate);
	pstmt.setString(2, orderName);
	pstmt.setString(3, productId);
	pstmt.setString(4, unitprice);
	pstmt.setString(5, orderQty);
	qty=Integer.parseInt(orderQty);
	pstmt.setString(6, orderAddress);
	pstmt.executeUpdate();
	sql="select unitsInstock from product0728 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs=pstmt.executeQuery();rs.next();
	int unitsInstock=rs.getInt(1);
	sql="update product0728 set unitsInstock=? where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, unitsInstock-qty);
	pstmt.setString(2, productId);
	pstmt.executeUpdate();
	%> <script>
		alert("등록이 완료되었습니다!");
		location.href="orderSelect.jsp";
	</script>
	<%
			
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}
%>
</body>
</html>