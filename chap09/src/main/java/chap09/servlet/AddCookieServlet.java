package chap09.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// -- 2 --
@WebServlet("/cookie/add") // cookie에 add로 들어오면 여기로 들어온다.
public class AddCookieServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// 새 쿠키 생성하기
		// Cookie 타입의 cookie, "name", value
		Cookie cookie = new Cookie("animal", "lion");
		Cookie cookie2 = new Cookie("food", "hamburger");
		Cookie cookie3 = new Cookie("save_query", "save");
		Cookie cookie4 = new Cookie("favorite", "135");
		
		cookie4.setPath(req.getContextPath() + "/cartoon");
		cookie4.setMaxAge(60 * 60 * 24 * 365); // keep 365days
		
		cookie3.setPath("/search");
		cookie3.setMaxAge(-1); // session, not stored
		
		resp.addCookie(cookie3);
		resp.addCookie(cookie4);
		
		// -- 6 --
		
		// 쿠키의 옵션값 설정하기
		// (1) 쿠키의 경로 (해당 쿠키가 적용되는 uri를 설정) 
		// - chpa09 내 모든 영역에서 적용되는 설정 (해당 쿠키가 적용되는 범위)
		cookie.setPath(req.getContextPath()); 
		
		// (2) 쿠키의 수명 설정 (설정하지 않으면 세션 만료시(웹브라우저에서 사라졌을 때)까지 유지됨, 초단위)
		cookie.setMaxAge(30); // 30초
		
		// (3) 쿠키의 값 설정 (key 값(animal)은 변경하지 못하고 value(lion)만 변경 가능)
		cookie.setValue("tiger");
	
		
		// 사용자의 웹 브라우저에 쿠키를 응답하기 위해 적재
		resp.addCookie(cookie);
		resp.addCookie(cookie2);
		
		// JSP 위에 있는 <%@ contentType="" %>을 여기서 수동으로 진행하는 것
		// (1) 한글 깨짐 해결법
		resp.setCharacterEncoding("EUC-KR");
		
		// (2) 태그가 그냥 나오는 거 해결 방법
		resp.setContentType("text/html");
		
		// JSP 밑부분의 HTML 부분
		resp.getWriter().append("<h3>쿠키가 생성되었습니다. F12를 눌러 확인</h3>");
	}

}
