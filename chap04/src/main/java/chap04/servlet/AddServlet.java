package chap04.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 하나의 여러개의 기능을 넣는 것 좋지 않다 (ex add, invalidate)
@WebServlet(urlPatterns = {"/session/add", "/session/invalidate"})
public class AddServlet extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("세션을 만료시켰습니다.");
		
		req.getSession().invalidate();
		
		resp.sendRedirect("/chap04/session/index.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		// 세션에 대한 설정
		// 활동을 안하면 세션이 만료되는 시간 설정 (10분(600초) 동안 아무 요청을 하지 않으면 세션이 사라짐)
		// ex) 은행사이트 로그인 후 10분 정도 사용 안하면 자동 로그아웃 되는 것
		session.setMaxInactiveInterval(600);
		
		String name = req.getParameter("name");
		String value = req.getParameter("value");
		
		session.setAttribute(name, value);
		
		// 위에서 추가 다 했으면 Redirect 하기
		resp.sendRedirect("/chap04/session/index.jsp");
	}
}
