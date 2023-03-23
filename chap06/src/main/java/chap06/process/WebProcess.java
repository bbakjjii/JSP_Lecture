package chap06.process;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface WebProcess {
	String process(HttpServletRequest request, HttpServletResponse resp);
}
