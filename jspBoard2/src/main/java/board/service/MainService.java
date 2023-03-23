package board.service;

import javax.servlet.http.HttpServletRequest;

//-- 5 --
public class MainService implements Service{
	
	@Override
	public String service(HttpServletRequest req) {
		
		return "main";
	}
}
