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
import chap07.dao.PizzaOrderDAO_Impl;
import chap07.dto.PizzaOrder;

public class PizzaOrderListBusinessLogic implements BusinessLogic{
	
	// -- 19-3, 19-7 --
	// 인터페이스를 안 쓰면 나중에 수정량이 많아진다.
	// ex: PizzaOrderDAO_Impl orderDad = new PizzaOrderDAO_Impl2();
	//   ⇒ 앞부분 PizzaOrderDAO_Impl의 부분을 전부 PizzaOrderDAO_Impl의2로 변경해야 함.
	PizzaOrderDAO orderDao = new PizzaOrderDAO_Impl();
	// -- 19-3, 19-7 끝 --

	// -- 17 --
	@Override
	public String process(HttpServletRequest request) {
		
		// -- 19-3 (17번이 3줄로 줄어든 모습) --
		
		// # DAO (Data Access Obejct)
		// 수 많은 비즈니스 로직들은 DB에 똑같은 작업들ㅇ르 많이 진행하게 된다.
		// 그렇기 때문에 비즈니스 로직 내부에서도 DB관련 작업들(DAO)을 따로 묶어 
		// 정리해두면 작업량을 많이 줄일 수 있다.
		List<PizzaOrder> pastOrders = 
				orderDao.selectAll("SELECT * FROM pizza_order");
		request.setAttribute("pastOrders", pastOrders);
		
		return "pizza/orderList";
		// -- 19-3 끝 --
		
//		try (
//				Connection conn = 
//				DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "hr", "1234");
//				PreparedStatement pstmt = 
//						conn.prepareStatement("SELECT * FROM pizza_order");
//				ResultSet rs =
//						pstmt.executeQuery();
//				){
//			List<String> pastOrders = new ArrayList<>();
//			while (rs.next()) {
//				pastOrders.add(
//						String.format(
//								"<tr><td>%s</td><td>%s</td><td>%s</td></tr>",
//								rs.getString("topping"),
//								rs.getString("crust"),
//								rs.getString("pizza_size")
//								));
//			}
//			
//			request.setAttribute("pastOrders", pastOrders);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return "pizza/orderList";
	}
}