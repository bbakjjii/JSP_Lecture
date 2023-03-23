package board.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Request;
import board.service.*;

public class DispatcherServlet extends HttpServlet {

	// DTO 안에 있는 Request, service 안에 있는 Service
	// 키값을 두개 받아오기!!
	Map<Request, Service> uriMapping = new HashMap<>();
	
	// -- 4 --
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// -- 18 --
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Oracle Driver loaded...");
		} catch (ClassNotFoundException e) {
			System.out.println("Oracle Driver not found Exception...");
		}
		// -- 18 끝 --
				
		uriMapping.put(new Request("/", "GET"), new MainService());
		uriMapping.put(new Request("/main", "GET"), new MainService());
		
		// -- 8 --
		uriMapping.put(new Request("/list", "GET"), new ListService());
		
		// -- 26 --
		uriMapping.put(new Request("/contents", "GET"), new ReadService());
		
		// -- 38 --
		uriMapping.put(new Request("/write", "GET"), new WriteFormService());
		
		// -- 41 --
		uriMapping.put(new Request("/write", "POST"), new WriteService());
		
		// -- 51 --
		uriMapping.put(new Request("/modify", "GET"), new ModifyPasswordCheckFormService());
		
		// -- 57 --
		uriMapping.put(new Request("/modify", "POST"), new ModifyPasswordCheckService());
		
		// -- 51 --
		uriMapping.put(new Request("/delete", "GET"), new DeletePasswordCheckFormService());
	}

		
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// -- 47 --
		// 모든 요청에 대하여 인코딩 타입을 설정한다
		req.setCharacterEncoding("EUC-KR");
		// -- 47 끝 --
			
		String contextPath = req.getContextPath();
		
		String uri = req.getRequestURI().substring(contextPath.length());
		String method = req.getMethod();
				
		System.out.println("### Request Info ###");
		System.out.println("Uri: " + uri);
		System.out.println("Method: " + method);
		
		// 키값으로 Request를 넣어줘야 함
		// Service를 바로 꺼내 쓸 수 있다..?
		String view = uriMapping.get(new Request(uri, method)).service(req);
		
		// -- 46 --
		if (view.startsWith("redirect::")) {
			// view에 redirect::가 딸려 들어오면 redirect만큼 자른다?
			resp.sendRedirect(view.substring("redirect::".length()));
		} else {
			req.getRequestDispatcher("/WEB-INF/views/" + view + ".jsp")
			.forward(req, resp);
		}		
	}
}
