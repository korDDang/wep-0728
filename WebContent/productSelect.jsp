<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="nav.jsp"%>
<%@ include file="DBConn.jsp"%>
<section class="sec1">
<h3>상품 목록</h3>
<%
int cnt=0;
try{
	String sql="select count(*)from product0728";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>개의 상품이 있습니다.</div>
<hr>
<table border="1" class="tab2">
<tr>
	<th class="th1">상품코드</th>
	<th class="th1">상품명</th>
	<th class="th1">단가</th>
	<th class="th1">상세정보</th>
	<th class="th1">제조사</th>
	<th class="th1">분류</th>
	<th class="th1">재고수</th>
	<th class="th1">상태</th>
	<th class="th1">구분</th>
</tr>
<%
try{
	String sql="select * from product0728";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String productId=rs.getString(1);
		String name=rs.getString(2);
		String unitprice=rs.getString(3);
		String description=rs.getString(4);
		String category=rs.getString(5);
		switch(category){
		case "10" : category="it 제품";
		break;
		case "20" : category="주방제품";
		break;
		case "30" : category="전자제품";
		break;
		case "40" : category="일반 잡화";
		break;
		}
		String manufacturer=rs.getString(6);
		String unitsInstock=rs.getString(7);
		String condition=rs.getString(8);
		
	
%>
<tr>
	<td class="td2"><a href="update_product.jsp?productId=<%=productId%>"><%=productId %></a></td>
	<td class="td2"><%=name %></td>
	<td class="td2"><%=unitprice %></td>
	<td class="td2"><%=description %></td>
	<td class="td2"><%=manufacturer%></td>
	<td class="td2"><%=category  %></td>
	<td class="td2"><%=unitsInstock  %></td>
	<td class="td2"><%=condition  %></td>
	<td class="td2">
	<a href="delete_product.jsp?productId=<%=productId%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
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
<div class="td1"><input type="button" value="작성" onclick="location.href='addProduct.jsp'" class="bt1"></div>
</section>
<%@ include file="footer.jsp"%>
</body>
</html>