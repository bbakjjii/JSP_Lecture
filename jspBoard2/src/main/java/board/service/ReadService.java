package board.service;

import javax.servlet.http.HttpServletRequest;

import board.dao.BoardDao;
import board.dao.BoardDao_Impl;
import board.dto.Board;

// -- 27 --
public class ReadService implements Service{
	
	BoardDao dao = new BoardDao_Impl();

	@Override
	public String service(HttpServletRequest req) {
		
		String board_id = req.getParameter("board_id");
		
		if (board_id == null) {
			return "board/not_exist.jsp";
		} 
		
		int id = Integer.parseInt(board_id);
		
		Board board = dao.selectBoardById(id);
		
		if (board == null) {
			return "board/not_exist.jsp";
		}
		
		dao.increaseView(id);
		
		req.setAttribute("board", board);
		
		return "board/contents";
	}

}
