package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import board.dto.Reply;

public class ReplyDAO {

	private Connection conn;
	private ResultSet rs;
	
	public ReplyDAO() {
		try {
			String dbURL="jdbc:oracle:thin:@localhost:1521:XE";	
			String dbID="hr";
			String dbPassword="1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Reply> getList(int board_id, int pageNumber){
		String sql = "SELECT * FROM REPLY WHERE replyID = ? AND replyAvailable=1 AND board_id=? ORDER BY replyID";
		ArrayList<Reply> list=new ArrayList<Reply>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,getNext()-(pageNumber-1)*10);
			pstmt.setInt(2, board_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setWrite_id(rs.getString(1));
				reply.setReplyID(rs.getInt(2));
				reply.setReplyContent(rs.getString(3));
				reply.setBoard_id(board_id);
				reply.setReplyAvailable(1); // rs.getInt(5) => out of index 오류
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getNext() {
		String SQL="SELECT replyID FROM reply ORDER BY replyID DESC";
		try {
		
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getInt(1)); // select문에서 첫번째 값
				return rs.getInt(1)+1;  // 현재 인덱스(현재 게시글 개수) +1 반환
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int write(int board_id,String replyContent,String write_id, String commentDate) {
		String SQL="INSERT INTO REPLY VALUES(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,write_id);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, replyContent);
			pstmt.setInt(4,board_id);
			pstmt.setInt(5,1);
			pstmt.setString(6, commentDate);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}