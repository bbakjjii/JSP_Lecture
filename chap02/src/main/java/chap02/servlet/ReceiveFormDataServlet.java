package chap02.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test1")
public class ReceiveFormDataServlet extends HttpServlet{
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("요청이 잘 도착했습니다.");
		
		// 요청 객체에 데이터가 함께 실려온다
		
		// 해당 input에 값이 하나인 경우 request.getParameter()
		// 해당 input에 값이 여러개인 경우 (checkbox 등) request.getParameterValues()
		String hobby = req.getParameter("hobby");
		String boba = req.getParameter("boba");
		String coffee = req.getParameter("coffee");
		
		
		resp.setCharacterEncoding("EUC-KR");
		
		PrintWriter out = resp.getWriter();
		
		out.print("<h1>Success!</h1>");
		out.print("<div>선택한 취미: " + hobby + "</div>");
		out.print("<div>선택한 버블티: " + boba + "</div>");
		out.print("<div>선택한 커피: " + coffee + "</div>");
	}
}
