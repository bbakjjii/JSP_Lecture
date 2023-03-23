package chap06.process;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWebProcess implements WebProcess{
	
	private String getRandomName() {
		String[] names = {"Kim Minsu", "Park Soyoung"};
		return names[(int)Math.random() * names.length];
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse resp) {
		request.setAttribute("name", getRandomName());
		return "hello"; // "/WEB-INF/views/hello.jsp"
		
	}
}
