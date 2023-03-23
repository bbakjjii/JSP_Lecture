package chap03.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/a", "/aa", "/aaa" })
public class SevletA extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter()
		.append("<html><h1>")
		.append("Served at: ")
		.append(request.getContextPath())
		.append("</h1></html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/*
		# Sevlet파일 생성 방법
		① chap03.servlet 패키지 선택 후 마우스 우클릭 → [New] → [Sevlet]
		② Class name : ServletA
		③ URL mappings: /SevletA 선택 후 Edit 클릭 → /a로 수정
		④ Initialization parameters:의 Add 클릭 → Name: Hobby / Value : Movie / Desciption: About hobbies 입력 후 OK → Finish
		⑤ Which method stubs would you like to create?에서 doPost, doGet 체크 → Finish
		⑤ SevletA.java 생성됨 → SevletA.java 파일 내용에 doGet(), doPost() 메서드가 생성됨
	 */

}
