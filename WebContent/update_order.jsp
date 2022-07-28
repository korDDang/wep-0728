<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 정보 수정</title>
<script>
function ch() {
	var doc=document.form;
	doc.submit();
}
function check() {
	var doc=document.form;
	if(doc.orderDate.value==""){
	 	alert("주문자일자를 입력하세요.");
		doc.orderDate.focus();
		return false;
	}if(doc.orderName.value==""){
		alert("주문자이름를 입력하세요.");
		doc.orderName.focus();
		return false;
	}if(doc.productId.value==""){
		alert("상품코드를 입력하세요");
		doc.productId.focus();
		return false;
	}if(doc.orderAddress.value==""){
		alert("주문자주소를 입력하세요");
		doc.orderAddress.focus();
		return false;
	}else{
		form.action="update_orderProcess.jsp";
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
int unit=0;
int qty=0;
int total=0;
String orderDate=request.getParameter("orderDate");
if(orderDate==null){
	orderDate="";
}
String orderName=request.getParameter("orderName");
if(orderName==null){
	orderName="";
}
String unitprice=request.getParameter("unitprice");
if(unitprice==null){
	unitprice="";
}else{
	unit=Integer.parseInt(unitprice);
}
int unitsInstock=0;
String orderQty=request.getParameter("orderQty");
if(orderQty==null){
	orderQty="";
}else{
	qty=Integer.parseInt(orderQty);
}
String orderAddress=request.getParameter("orderAddress");
if(orderAddress==null){
	orderAddress="";
}
String name="";
String productId=request.getParameter("productId");
if(productId==null){
	productId="";
}else{
	String sql="select name,unitprice,unitsInstock from product0728 where productId=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs=pstmt.executeQuery();
		if(rs.next()){
			name=rs.getString(1);
			unit=rs.getInt(2);
			unitsInstock=rs.getInt(3);
			total=unit*qty;
		 	if(qty>unitsInstock){
		 		%>
				<script>
				 alert("주문 수량이 재고 수량보다 많습니다");
				</script>
				<%
		 	}else{
		 		System.out.println("정상 처리");
		 	}
		}
		else{
			%><script>
			 alert("등록되지 않은 코드입니다");
			</script>
			<% 
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
}

	String sql="select * from order0728 where orderDate=? and orderName=?";
try{
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, orderDate);
	pstmt.setString(2, orderName);
	rs=pstmt.executeQuery();
	if(rs.next());
	 	 productId=rs.getString(3);
	 	 unit=rs.getInt(4);
	     qty=rs.getInt(5);
	     orderAddress=rs.getString(6);
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h2>주문정보 수정</h2>
<br>
<form name="form" method="post" action="addOrder.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">주문일자</th>
		<td>
			<input type="text" name="orderDate" value="<%=orderDate %>">
		</td>
	<th class="th1">주문자 이름</th>
		<td>
			<input type="text" name="orderName"  value="<%=orderName%>">
		</td>
</tr>
<tr>
	<th class="th1">상품코드</th>
		<td>
			<input type="text" name="productId" onchange="ch()"  value="<%=productId %>">
		</td>
	<th class="th1">상 품 명</th>
		<td>
			<input type="text" name="name"  value="<%=name %>">
		</td>
</tr>
<tr>
	<th class="th1">단 가</th>
		<td>
			<input type="text" name="unitprice"  value="<%=unit%>">
		</td>
	<th class="th1">주문수량</th>
		<td>
			<input type="text" name="orderQty"  value="<%=qty %>">
		</td>
</tr>
<tr>
	<th class="th1">주문금액</th>
		<td>
			<input type="text" name="total"  value="<%=qty*unit %>">
		</td>
	<th class="th1">주문주소</th>
		<td>
			<input type="text" name="orderAddress"  value="<%=orderAddress %>">
		</td>
</tr>
<tr>
	<td colspan="4" class="td1">
		<input type="button" value="목록" onclick="location.href='orderSelect.jsp'" class="bt1">
		<input type="submit" value="저장" onclick="check()" class="bt1">
	</td>
</tr>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>