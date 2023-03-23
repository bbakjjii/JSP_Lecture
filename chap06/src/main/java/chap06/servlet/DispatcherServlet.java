package chap06.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap06.process.GugudanWebProcess;
import chap06.process.HelloWebProcess;
import chap06.process.WebProcess;

public class DispatcherServlet extends HttpServlet{
	
	private Map<String, WebProcess> processMapping = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String contextPath = config.getServletContext().getContextPath();
		// URL-Mapping이 되는 부분 : 이부분을 계속 추가하면 된다.
		processMapping.put(contextPath + "/hello", new HelloWebProcess());
		processMapping.put(contextPath + "/gugudan", new GugudanWebProcess());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		// # 사용자가 요청을 하면 거치는 과정
		// 이 과정을 ElseServlet 내에서 다 하기
		// 1. 사용자가 요청을 한다
		System.out.println("요청 URI: " + req.getRequestURI());
		System.out.println("요청 방식: " + req.getMethod());
		
		// 2. 해당 URI와 Method에 알맞은 처리를 진행한다.
		try {
		String nextPage = processMapping.get(req.getRequestURI())
				.process(req,  resp);

		// 3. 처리 후 알맞은 view 페이지를 응답한다.
		// WEB-INF의 내부에는 클라이언트가 직접 접근하는 것은 금지되어 있지만
		// 개발자에 의한 포워드는 허용되어 있다
		// # WEB-INF 밑으로 view 폴더를 넣을 수 없다 : 직접 접근이 막혀있기 때문에
		// · 해결 방법 : 
		// ① ElseServlet 파일에서 req.getRequestDispatcher(nextPage).forward(req, resp);를 
		//   req.getRequestDispatcher("/WEB-INF/views" + nextPage + ".jsp").forward(req, resp);로 변경
		// ② HelloWebProcess.java 파일에서 return"/view/hello.jsp";를 return "hello";로 변경
		// ③ GugudanWebProcess.java 파일에서 return"/view/gugudan.jsp";를 return "gugudan";으로 변경

			req.getRequestDispatcher("/WEB-INF/views/" + nextPage + ".jsp").forward(req, resp); // 포워딩!
		} catch (NullPointerException e) {
			// 해당 URI로 꺼낼 수 있는 process가 없는 경우에 대한 처리
			resp.sendRedirect(req.getContextPath() + "/hello");
		}		
	}
}
