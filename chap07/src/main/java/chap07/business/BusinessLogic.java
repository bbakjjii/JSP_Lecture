package chap07.business;

import javax.servlet.http.HttpServletRequest;

public interface BusinessLogic {
	
	String process(HttpServletRequest request);

}
