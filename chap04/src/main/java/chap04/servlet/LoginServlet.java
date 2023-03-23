package chap04.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chap04.model.Member;

@WebServlet("/memo/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext application = getServletContext();
		HttpSession session = req.getSession();
		
		// 아이디와 비밀번호 전달받을 예정
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		// map 타입으로 꺼내진다.
		Map<String, Member> map = 
				application.getAttribute("members") == null ? 
						null : (Map)application.getAttribute("members");
		
		boolean login = false;
		
		// map에 사용자가 입력한 id가 포함되어 있다면
		if (map.containsKey(id)) {
			// 해당 id로 Member 인스턴스를 하나 꺼내고
			Member mem = map.get(id);
			// 해당 인스턴스의 login 기능을 이용해 로그인 가능 여부를 체크하고
			login = mem.login(id, pw);
			// 로그인 여부를 등록하고
			session.setAttribute("login", login); // true 또는 false가 이 안에 들어있다
			// 로그인을 성공했다면
			if (login) {
				// currMem을 등록한다
				session.setAttribute("currMem", mem);
			}
		}
		
		
		
		resp.sendRedirect("/chap04/quiz/index.jsp");
	}
	
}
