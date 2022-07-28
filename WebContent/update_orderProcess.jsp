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
int orderQty=Integer.parseInt(request.getParameter("orderQty"));
int unitsInstock = 0;
int b_orderQty=0;
int b_unitsInstock=0;
String unitprice=request.getParameter("unitprice");
String orderAddress=request.getParameter("orderAddress");
 	String sql="select unitsInstock from product0728 where productId=?";
try{
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs=pstmt.executeQuery();
	if(rs.next()){ //현재 재고수불러오기
	b_unitsInstock=rs.getInt(1);
	}
	sql="select orderQty from order0728 where orderDate=?";
	pstmt.setString(1, orderDate);
	rs=pstmt.executeQuery();
	if(rs.next()){ //현재 주문수불러오기
	 b_orderQty=rs.getInt(1);
	}
	sql="update product0728 set unitsInstock=? where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, b_unitsInstock+b_orderQty);
	pstmt.setString(2, productId); //값다시 더해주기
	
	sql="select unitsInstock from product0728 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs=pstmt.executeQuery();
	if(rs.next()){ //주문수가 다시 +된  재고수 불러오기
	unitsInstock=rs.getInt(1);}
	sql="update order0728 set orderName=?,productId=?,unitprice=?,orderQty=?,orderAddress=? where orderDate=? ";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, orderName);
	pstmt.setString(2, productId);
	pstmt.setString(3, unitprice);
	pstmt.setInt(4, orderQty);
	pstmt.setString(5, orderAddress);
	pstmt.setString(6, orderDate);
	pstmt.executeUpdate();
	sql="update product0728 set unitsInstock=? where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, unitsInstock-orderQty);
	pstmt.setString(2, productId); //이제 수정된 값 뺴주기
	pstmt.executeUpdate();
	%>
	 <script>
	 alert("수정 성공");
	 location.href="orderSelect.jsp";
	 </script>
	 <%
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}
%>
</body>
</html>