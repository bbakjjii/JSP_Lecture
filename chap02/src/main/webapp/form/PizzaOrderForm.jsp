<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String name = request.getParameter("name");
	String streetAddress = request.getParameter("streetAddress");
	String city = request.getParameter("city");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
%>

<!-- 응답하는 곳 -->
<html>
	<head>
		<title>Pizza Order Form</title>
	</head>
	<style>
		#info {
			float:left;
		}
		
		#infolabel {
			display:inline-block;
		}
	</style>
	<body bgcolor="ivory">

	<form action="http://localhost:9000/chap02/PizzaOrderForm" method="GET">
		<div id="DeliveryInformation" style="border: solid 1px black; width: 600px; background-color: rgb(227 213 186); padding: 10px;">
			<h2 style="margin:0px; padding-bottom: 5px;">Delivery Information</h2>

			<div id="info" style="width: 130px">
				<label for="inputName">Name</label><br>
				<label for="inputStreetAddress">StreetAddress</label><br>
				<label for="inputCity">City</label><br>
				<label for="inputEmail">Email</label><br>
				<label for="inputPhone">Phone</label>
			</div>
			
			<div id="infolabel" style="width: 300px;">
			<input type="text" id="name" name="name" value="Chris Mullins" style="width: 300px"><br>
			<input type="text" id="streetAddress" name="streetAddress" value="123 Main St" style="width: 300px"><br>
			<input type="text" id="city" name="city" value="Townsville" style="width: 200px"><br>
			<input type="text" id="email" name="email" value="mullins@hotmail.com" style="width: 300px"><br>
			<input type="text" id="phone" name="phone" value="123-252-5555" style="width: 200px"><br>
			</div>	
		</div>
	
		<div id="Order" style="border: solid 1px black; width: 600px; background-color: rgb(227 213 186); margin-top: 10px; padding: 10px;">
			<h2 style="margin: 0px; padding-bottom: 0px;">Order</h2>
			<div id="crust">
				<h3 style="margin: 0px; padding-left: 20px;">Crust</h3>
				<div style="padding-left: 20px">
				<input type="radio" name="crust" id="radio_button_thin_crust"> 
                <label for="radio_button_thin_crust">Thin Crust</label>
                <input type="radio" name="crust" id="radio_button_deep_dish"> 
                <label for="radio_button_deep_dish">Deep Dish</label>
                </div>
			</div>
			
			<div id="size" style="padding-top: 10px">
				<h3 style="margin: 0px; padding-left: 20px;">Size</h3>
				<div style="padding-left: 20px">
				<select name="size" style="width: 100px">
					<option value="">Small</option>
					<option value="">Medium</option>
					<option value="">Large</option>
				</select>
				</div>
			</div>
			
			<div id="toppings" style="padding-top: 10px">
				<h3 style="margin: 0px; padding-left: 20px;">Topping(s)</h3>
				<div style="padding-left: 20px">
				<input type="checkbox" name="toppings" id="checkbox_button_Pepperoni"> 
                <label for="checkbox_button_Pepperoni">Pepperoni</label> 
                <input type="checkbox" name="toppings" id="checkbox_button_Sausage"> 
                <label for="checkbox_button_Sausage">Sausage</label>
        		<input type="checkbox" name="toppings" id="checkbox_button_GreenPeppers"> 
                <label for="checkbox_button_GreenPeppers">Green Peppers</label>
                <input type="checkbox" name="toppings" id="checkbox_button_Onions"> 
                <label for="checkbox_button_Onions">Onions</label><br>
                <input type="checkbox" name="toppings" id="checkbox_button_ExtraCheese"> 
                <label for="checkbox_button_ExtraCheese">Extra Cheese</label>
				</div>
			</div>
			
			<div id="specialInstructions" style="padding-top: 10px">
				<h3 style="margin: 0px; padding-left: 20px;">Special Instructions</h3>
				<div style="padding-left: 20px">
				<textarea name="instructioins" cols="50" rows="3" style="font-weight: bold;">Don't drop it!!</textarea>
				</div>
			</div>
			</div>
		
			
			<div style="width: 600px; padding: 15px; text-align:center;">
			<input type="submit" value="Preview Order">
			</div>
		</form>
	</body>
</html>