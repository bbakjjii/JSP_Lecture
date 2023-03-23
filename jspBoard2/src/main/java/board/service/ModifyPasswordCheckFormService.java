package board.service;

import javax.servlet.http.HttpServletRequest;

// -- 52 --
public class ModifyPasswordCheckFormService implements Service {

	@Override
	public String service(HttpServletRequest req) {
		req.setAttribute("type", "modify");
		
		// -- 55 --
		req.setAttribute("board_id", req.getParameter("board_id"));
		return "board/password";
	}
}
