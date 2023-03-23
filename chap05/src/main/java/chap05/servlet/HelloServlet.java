package chap05.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	// init() : 이 서블릿이 서버에 의해 최초로 초기화 될 때 불려지는 곳
	@Override
	public void init(ServletConfig config) throws ServletException {
		// init-param은 config 내부에 들어있다
		System.out.println(config.getInitParameter("path"));
		System.out.println(config.getInitParameter("user"));
		System.out.println(config.getInitParameter("password"));
	}

	// doGet() : 이 서블렛으로 GET방식 요청이 도착할 때 불려지는 곳
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		ServletContext application = req.getServletContext(); // application 객체
		
		// application 객체로부터 context-param을 꺼낼 수 있다
		String home = application.getInitParameter("home");
		
		System.out.println(home);
		
		resp.getWriter()
			.append("<h1>HelloServlet!</h1>")
			.append("<h1><a href='" + home + "'>Link</a></h1>");
			
	}
}
