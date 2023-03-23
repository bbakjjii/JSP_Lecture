package chap07.business;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import chap07.dao.PizzaOrderDAO;
import chap07.dto.PizzaOrder;

public class PizzaOrderInsertBusinessLogic implements BusinessLogic {
	
	// -- 19-2 --
	PizzaOrderDAO orderDao;
	// -- 19-2 --

	// -- ⑩ --
	@Override
	public String process(HttpServletRequest request) {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String crust = request.getParameter("crust");
		String pizza_size = request.getParameter("pizza_size");
		String[] toppings = request.getParameterValues("topping");
		String topping = String.join("/", toppings);
		String instruction = request.getParameter("instruction");
		
		// -- 19-2 --
		// 인터페이스를 통해 나중에 만들겠다고 약속만 해놓은 상태
		int row = orderDao.insert(new PizzaOrder(
				name, address, city, email, phone, crust, pizza_size, topping, instruction));
		
		// row값에 따라 redirect를 어디로 할지 결정
		if (row == 1) {
			return "redirect::/chap07/pizza/order/result?name=" + name;
		} else {
			return "redirect::/chap07/pizza/order/failed";
		}
		// -- 19-2 끝 --
		

		
//		try (
//				Connection conn = 
//					DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "hr", "1234");
//				PreparedStatement pstmt = 
//						conn.prepareStatement("INSERT INTO pizza_order VALUES (?,?,?,?,?,?,?,?,?)");
//			){
//				pstmt.setString(1, name);
//				pstmt.setString(2, address);
//				pstmt.setString(3, city);
//				pstmt.setString(4, email);
//				pstmt.setString(5, phone);
//				pstmt.setString(6, crust);
//				pstmt.setString(7, pizza_size);
//				pstmt.setString(8, topping);
//				pstmt.setString(9, instruction);
//				
//				int row = pstmt.executeUpdate();
//				
//				if (row > 0) {
//					System.out.println("주문 추가 성공함");
//				} else {
//					System.out.println("주문 실패");
//				}
//				
//				// request.setAttribute("success", row);
//				// request.setAttribute("info", new PizzaOrder(name, address, city, email, phone, crust, pizza_size, topping, instruction));
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
		// 리다이렉트 경로에 ?를 추가해 원하는 정볼르 보낼 수도 있다
		// 리다이렉트 하는 이유 : 새로 고침을 막기 위해
//		return "redirect::/chap07/pizza/order/result?name=" + name;
	}
}
