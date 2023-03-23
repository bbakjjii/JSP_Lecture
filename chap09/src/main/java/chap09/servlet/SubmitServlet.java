package chap09.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// -- 2 --
@WebServlet("/login/submit")
public class SubmitServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		String remem = req.getParameter("remem"); 
		
		// DB에서 id와 password를 불러옴
		String id = "test";
		String pw = "abc123";
		
		System.out.println(user_id);
		System.out.println(user_pw);
		System.out.println(remem); // 체크하면 on, 체크 안하면 null 값이 온다.
		
		// user_pw이 null이 아닐 때!
		// user_id가 비어있거나(==null), user_pw이 비어있거나(==null), pw이 비어있을 경우(==nul) ⇒ !=로 되어있어서 오류가 났었음.
		if (user_id == null || user_pw == null || pw == null) {
			//  로그인 실패 페이지로 보내기
			resp.sendRedirect(req.getContextPath() + "/login/fail.jsp");
			return; // 함수 끝내기
		} 
		
		// user_pw과 pw이 같은지 비교
		if (user_pw.equals(pw)) {
			
			req.getSession().setAttribute("login", "yes");
			
			Cookie cookie = new Cookie("user_id", user_id);
			
			cookie.setPath(req.getContextPath() + "/login");
			
			if ("on".equals(remem)) {
				// remem이 on일 경우 쿠키 만들기
				cookie.setMaxAge(60 * 60 * 24 * 30); // 1분 1시간 1일 30일
			} else {
				// 로그인에 성공했는데 remem이 on이 아닐 경우
				// 체크가 해제된 상태로 로그인 한 경우 존재하던 쿠키 삭제
				cookie.setMaxAge(0); 
			}
			resp.addCookie(cookie);
			
			// 로그인 성공시 성공 페이지로 보내기
			// 로그인을 만들 때는 forward를 쓰면 안된다.
			resp.sendRedirect(req.getContextPath() + "/login/success.jsp");
		} else {
			// 로그인 실패시 실패 페이지로 보내기
			resp.sendRedirect(req.getContextPath() + "/login/fail.jsp");
		}

	}

}
