package chap02.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PizzaOrderForm")
public class PizzaOrderForm extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("요청이 잘 도착했습니다.");

		String name = req.getParameter("name");
		String streetAddress = req.getParameter("streetAddress");
		String city = req.getParameter("city");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");

		String crust[] = req.getParameterValues("crust");
		String size[] = req.getParameterValues("size");	
		String toppings[] = req.getParameterValues("toppings");
		String instructions = req.getParameter("instructioins");
		
		resp.setCharacterEncoding("EUC-KR");

		PrintWriter out = resp.getWriter();


		out.print("<div style=\"border:solid 5px blue; margin:0px; width: 400px;\">");
		out.print("<div style=\"background-color: rgb(227 213 186); width=300px; padding: 0px, margin: 0px; text-align:center;\">");
		out.print("<h1 style=\"margin:0px; padding: 0px;\">Order Summary</h1>");
		out.print("</div>");
		
		out.print("<div>");
		out.print("<h2>Deliver to</h2>");
		out.print("<h5 style=padding: 20px>" + name + "</h5>");
		out.print("<h5>" + streetAddress + "</h5>");
		out.print("<h5>" + city + "</h5>");
		out.print("<h5>" + email + "</h5>");
		out.print("<h5>" + phone + "</h5>");
		out.print("</div>");

		out.print("<div>");
		out.print("<h1>Order</h1>");
		out.print("<div>Crust: " + crust + "</div>");
		out.print("<div>Size: " + size + "</div>");
		out.print("<div>Topping(s): " + toppings + "</div>");
		out.print("<div>Instructions: " + instructions + "</div>");
		out.print("</div>");
	}
}
