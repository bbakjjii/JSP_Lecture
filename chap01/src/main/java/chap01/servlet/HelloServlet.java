package chap01.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello") // 그냥 치면 됨
public class HelloServlet extends HttpServlet{
	
	// JSP의 <%! %> 부분
	
	// Ctrl + Space  → Service 메서드 overide
	// <% %>의 시작이 된다
	@Override 
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
	//req가 들어오면 resp가 나가야 한다.. => 이게 서블릿이다..?
			throws ServletException, IOException {
		// HttpServletRequest : 사용자의 요청 정보가 담겨있는 객체
		// HttpServletRespones : 모든 처리가 끝난 후 응답해야하는 객체 
		
		// JSP의 <% %> 부분
		PrintWriter out = resp.getWriter(); // resp에 out을 뽑아서 쓰고 있다
		
		// 접속 주소 : http://localhost:9000/chap01/hello
		// JSP가 1차로 서블릿 형태로 변환된다
		out.print("<html>");
		out.print("<head>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1 style=\"color: red;\">Hello</h1>");
		out.print("<p>Hello, Servlet!</p>");
		out.print("</body>");
		out.print("</html>");	
	}
	// <% %>의 끝이 된다

}
