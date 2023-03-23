package board.service;

import javax.servlet.http.HttpServletRequest;

import board.dao.BoardDao;
import board.dao.BoardDao_Impl;
import board.dto.Board;


// -- 58 --
public class ModifyPasswordCheckService implements Service {
	
	BoardDao boardDao = new BoardDao_Impl();

	@Override
	public String service(HttpServletRequest req) {
		String user_pw = req.getParameter("user_pw");
		String board_id = req.getParameter("board_id");
		
		if (board_id == null) {
			return "redirect::" + req.getContextPath() + "/list";
		}
		
		Board b = boardDao.selectBoardById(Integer.parseInt(board_id));
		req.setAttribute("board", b);

		if (b != null && b.getWrite_pw().equals(user_pw)) {				
			return "board/modi_form";
		} else {
			// 비밀번호가 틀렸다
			return "redirect::" + req.getContextPath() + "/list"; 
		}
	}
}
