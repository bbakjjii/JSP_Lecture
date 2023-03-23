package board.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import board.dto.Board;

//-- 12 --
public class BoardDao_Impl implements BoardDao {

	@Override
	public List<Board> selectAllBoards() {		
		// ResultSet에서 다음껄로 하나씩 꺼내지면서 boards라고 포장된 뒤에 List에 저장되어진다. 
		List<Board> boards = new ArrayList<>();
		String sql = "SELECT * FROM board ORDER BY board_id DESC";

		// -- 13 -- DB 테이블 만들기
		// DB에 board라는 테이블을 만들었다.

		//-- 15 --
		// DBConnnection 가져오기
		try (
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();						
				){
			while (rs.next()) {
				boards.add(new Board(rs));
			}				
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		// List 안에 들어있는 모든 게시글의 정보를 리턴한다.
		return boards;
	}

	// -- 29 --
	// board_id로 게시글 하나만 조회하기
	@Override
	public Board selectBoardById(int board_id) {
		String sql = "SELECT * FROM board WHERE board_id=?";

		try(
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
			pstmt.setInt(1,  board_id);
			try(
					ResultSet rs = pstmt.executeQuery();			
					){
				rs.next();
				return new Board(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	// -- 30 --
	// 조회수 증가
	@Override
	public void increaseView(int board_id) {
		String sql = "UPDATE board SET write_view=write_view+1 WHERE board_id=?";
		try(
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
			pstmt.setInt(1,  board_id);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	// -- 44 --
	@Override
	public boolean write(Board board) {
		String sql = "INSERT INTO board VALUES "
				+ "(board_id_seq.nextval,?,?,?,?,sysdate,0,0,0)";
		
		try (
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		){
			pstmt.setString(1,  board.getWrite_id());
			pstmt.setString(2,  board.getWrite_pw());
			pstmt.setString(3,  board.getWrite_title());
			pstmt.setString(4,  board.getWrite_content());
			
			return pstmt.executeUpdate() > 0;			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}