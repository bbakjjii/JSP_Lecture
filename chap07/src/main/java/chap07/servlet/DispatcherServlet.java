package chap07.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import chap07.business.BusinessLogic;
import chap07.business.HelloBusinessLogic;
import chap07.business.*;

// hello로 접속하는 사용자에게 hello.jsp 페이지를 보여주도록 만들어보세요.
public class DispatcherServlet extends HttpServlet {
	
	Map<String, BusinessLogic> businessMapping = new HashMap<>();
	
	// -- ⑨ --
	@Override
	public void init(ServletConfig config) throws ServletException {
		// 최초 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("OracleDriver loaded...");
		} catch (ClassNotFoundException e) {
			System.out.println("Fail to load OracleDriver...");		
		}
		
		// 인터페이스는 인스턴스를 만들 수 없다 : 아직 구현되지 않은 추상메서드가 있기 때문에.
		businessMapping.put("/hello", new HelloBusinessLogic());
		businessMapping.put("/pizza", new PizzaIndexBusinessLogic());
		// -- 16 --
		businessMapping.put("/pizza/order/list", new PizzaOrderListBusinessLogic());
		businessMapping.put("/pizza/order/result", new PizzaOrderResultBusinessLogic());
		// -- ③ --
		//이 URI로 들어왔을 때 이 처리를 해라.
		businessMapping.put("/pizza/order/form", new PizzaOrderFormBusinessLogic());
		// -- ⑦ -->
		businessMapping.put("/pizza/order/insert", new PizzaOrderInsertBusinessLogic());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String contextPath = req.getContextPath();
		// -- ② --
		// GET 방식으로 꺼낸다.
		String uri = req.getRequestURI().substring(contextPath.length());

		// System.out.println("contextPath: " + contextPath);
		// System.out.println("URI : " + req.getRequestURI());
		// System.out.println("uri - contextPath = " 
		//		+ (uri = uri.substring(contextPath.length())));
		
		// business mapping이 null이 된다면? → 처리는 나중에 하기로 함
		
		System.out.println(uri);
		
		String nextView = businessMapping.get(uri).process(req);
		
		if (nextView.startsWith("redirect::")) {
			resp.sendRedirect(nextView.substring("redirect::".length()));
		} else {
			// chap07/hello라고 쳤을 때 hello.jsp로 보내야 한다.
			// 단점 : uri와 실제파일명이 다를 수 도 있어야 하는데, 이경우 항상 같아야 한다.
			req.getRequestDispatcher("/WEB-INF/views/" + nextView + ".jsp")
				.forward(req, resp);
		}
	}
}