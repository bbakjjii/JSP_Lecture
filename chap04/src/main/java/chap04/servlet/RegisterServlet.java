package chap04.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap04.model.Member;

@WebServlet("/memo/Register")
public class RegisterServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 회원가입 버튼 누르면? → 회원가입 할 수 있는 폼을 보여줘야 한다
		req.getRequestDispatcher("/quiz/view/regForm.jsp").forward(req,  resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext application = getServletContext();
		
		// id가 포함이 되어있나 안되어있나?
		// null : 아직 아무도 회원가입을 안했다.
		if (application.getAttribute("members") == null) {
			// HashMap 대신 List로 받으면 하나하나 다 까봐야하기 때문에 오래걸린다.
			application.setAttribute("members", new HashMap<>());
		}
		
		// 회원정보가 도착하면 등록하는 곳
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String password = req.getParameter("pw");
		String birthday = req.getParameter("birthday");
		
		// map은 Attribute로 members를 꺼냄(?)
		// Attribute : 서버의 유일한 공간
		// Memebers라는 곳에 hashmap을 올렸다.
		Map<String, Member> map = 
				(Map)(application.getAttribute("members"));
		
		// map을 꺼낸 뒤 map에 들어있는 id를 확인한다.
		if (map.containsKey(id)) {
			// 이미 존재하는 ID (이미 존재한다고 표시하고 등록을 하지 않아야 함)
			resp.getWriter()
			.append("<html><script>")
			.append("alert('중복된 아이디 입니다!');")
			.append("location.href='/location.href='/cahp04/quiz/index.jsp'</script></html>");
		} else {
			// 사용할 수 있는 ID
			map.put(id, new Member(name, id, password, birthday));
			resp.sendRedirect("/chap04/quiz/index.jsp");
		}
		
		// 문제1. 이름이 올바른지를 알 수 있는 정규표현식을 만들어보세요. (유효성검사)
		// 문제2. 비밀번호가 올바른지를 알 수 있는 정규표현식을 만들어보세요. (유효성검사)
	}

}
