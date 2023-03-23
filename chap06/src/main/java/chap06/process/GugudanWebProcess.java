package chap06.process;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GugudanWebProcess implements WebProcess{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse resp) {
		return "gugudan"; //"/WEB-INF/views/gugudan.jsp"
	}

}
