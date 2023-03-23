package chap03.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/redirect")
public class RedirectServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 리다이렉트 하기 (클라이언트에게 다른곳으로 다시 요청하라고 응답하기)
		
		// 사용자의 웹 브라우저에서 입력해야하는 경로를 넣어야 한다
		response.sendRedirect("/chap03/view.jsp");
	}
}
