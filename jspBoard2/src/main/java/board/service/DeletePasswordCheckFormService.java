package board.service;

import javax.servlet.http.HttpServletRequest;

// -- 53 --
public class DeletePasswordCheckFormService implements Service {

	@Override
	public String service(HttpServletRequest req) {
		req.setAttribute("type", "delete");
		
		// -- 56 --
		req.setAttribute("board_id", req.getParameter("board_id"));
		return "board/password";
	}
}
