package chap07.business;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class PizzaOrderResultBusinessLogic implements BusinessLogic{

	@Override
	public String process(HttpServletRequest request) {
		// request에 방금 추가한 주문의 ID가 함께 왔으면 좋겠다
		String customerName = request.getParameter("name");
		
		System.out.println("건네받은 name: " + customerName);
		
		request.setAttribute("customerName", customerName);
		
		// 원래대로라면 건네받은 ID를 통해 어떤 주문이었는지 select 가능
		// SELECT * FROM pizza_order WHERE name=customerName
		// -- ⑫ --
		try (
			// 자동화 할 수 있음.
			Connection conn = 
				DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "hr", "1234");
			PreparedStatement pstmt = 
					conn.prepareStatement("SELECT * FROM pizza_order WHERE name=?");
		){
			pstmt.setString(1, customerName);
			
			// ResultSet도 발생하는 예외가 바깥의 try-catch와 같기 때문에 
			// catch를 추가할 필요가 없다 (rs에만 개별적인 예외처리를 하고싶은 경우 사용해도 됨)
			try (ResultSet rs = pstmt.executeQuery();){
				List<String> pastOrders = new ArrayList<>();
				// 다음껄 읽는 동안 내용을 계속 꺼낸다
				while (rs.next()) {
					pastOrders.add(
						String.format(
							"<tr><td>%s</td><td>%s</td><td>%s</td></tr>",
							// 1단계 : DB관련 (DAO) 
							rs.getString("topping"),
							rs.getString("crust"),
							rs.getString("pizza_size")
							// 1단계 끝
						));
					
				}
				// 2단계 : Service(Business Logic)
				request.setAttribute("pastOrders", pastOrders);
				// 2단계 끝
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 포워딩이 되어 있는 부분
		// 다음으로 포워드해야하는 jsp페이지가 어디인지 알려주는 부분
		return "pizza/orderResult";
	}

}
