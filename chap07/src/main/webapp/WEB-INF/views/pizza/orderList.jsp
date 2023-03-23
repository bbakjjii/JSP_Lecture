<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 
page import="java.util.List"
18 -->

<!-- 20-1 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 20-1끝 -->

<!-- 다운 캐스팅 해야 함 
	Object o1 = request.getAttribute("pastOrders");
	List<String> pastOrders = null;
	if (o1 instanceof List){
		pastOrders = (List)o1;
	}
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모든 주문 내역 보기</title>
</head>
<body>

	<!-- 18 -->
	<h3># 모든 주문 내역 보기</h3>
	<table border="2">
		<!-- 20-2 -->
		<c:forEach items="${pastOrders }" var="pastOrder">
			<tr>
				<td>${pastOrder.name }</td>
				<td>${pastOrder.address }</td>
				<td>${pastOrder.city }</td>
				<td>${pastOrder.email }</td>
				<td>${pastOrder.phone }</td>
				<td>${pastOrder.crust }</td>
				<td>${pastOrder.pizza_size }</td>
				<td>${pastOrder.topping }</td>
				<td>${pastOrder.instruction }</td>
			</tr>
		</c:forEach>
		<!-- 20-2끝 -->
	</table>
	
	<!-- 
	 	if (pastOrders != null && pastOrders.size() != 0) {
	 		for (String pastOrder : pastOrders) {
	 			out.print(pastOrder);
	 		} 
	 	} else {
	 		out.print("<tr><th>주문 내역이 없습니다!</th></tr>");
	 	}
	  -->
	 </table>

</body>
</html>