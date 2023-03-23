<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Map, java.util.HashMap" %> <!-- JSP태그 : import 방법 -->
<% 
	//java.util.Map<String, String> sizeMap = new java.util.HashMap<>();

	Map<String, String> sizeMap = new HashMap<>();
	
	sizeMap.put("r", "Regular");
	sizeMap.put("m", "Medium");
	sizeMap.put("l", "Large");
	sizeMap.put("f", "Family");
	

	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String crust = request.getParameter("crust");
	String size = request.getParameter("size");
	String[] toppings = request.getParameterValues("topping");
	String instruction = request.getParameter("instruction");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1> Order Summary</h1>
	
	<h3>Deliver to</h3>
	<div>
		<%= name %><br>
		<%= address %><br>
		<%= city %><br>
		<%= email %><br>
		<%= phone %><br>
	</div>
	
	<h3>Order</h3>
	<div>
		<b>Crust</b>: <%= crust %><br>
		<b>Size</b>: <%=sizeMap.get(size) %><br>
		<b>Topping(s)</b>: <br>
		<% if (toppings != null) { %>
			<% for (int i = 0; i < toppings.length; ++i) { %>
				<i class="topping id="<%=toppings[i]%>"><%=toppings[i]%></i>
			<% } %>
		<% } %><br>
		<b>Instructions</b>: <%=instruction %>
	</div>
</body>
</html>