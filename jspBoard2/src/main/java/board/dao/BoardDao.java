package board.dao;

import java.util.List;

import board.dto.Board;

//-- 10 --
public interface BoardDao {
	
	List<Board> selectAllBoards();
	
	// -- 28 --
	Board selectBoardById(int board_id);
	
	void increaseView(int board_id);
	
	// -- 43 --
	boolean write(Board board);
	
}
