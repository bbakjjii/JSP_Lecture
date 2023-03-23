package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO {
	private Connection conn; //데이터베이스에 접근하는 객체
	private ResultSet rs;
	
	public CommentDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:XE"; // 본인 컴퓨터의 데이터베이스에 접속 할 수 있는 것
			String dbID = "onore";
			String dbPassword = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 데이터베이스에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); // conn 객체 안에 접속된 정보가 담기게 된다
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이트베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT commentID FROM commenttable ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; // 첫번째 댓글인 경우
	}
	
	public int write(String commentContent, String userID, int bbsID) {
		String SQL="INSERT INTO commenttable VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, commentContent);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setInt(5, bbsID);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	public String getUpdateComment(int commentID) {
		String SQL = "SELECT commentContent FROM commenttable WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //오류
	}
	public ArrayList<Comment> getList(int bbsID){
		String SQL = "SELECT * FROM commenttable WHERE bbsID= ? AND commentAvailable = 1 ORDER BY bbsID DESC"; 
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment();
				cmt.setCommentContent(rs.getString(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setCommentDate(rs.getNString(4));
				cmt.setBbsID(rs.getInt(5));
				list.add(cmt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // 데이트베이스 오류
	}
	
	public int update(int bbsID, int commentID,String commentContent ) {
		String SQL="UPDATE commenttable SET commentContent = ? where bbsID = ? and commentID = ?"; 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, commentContent);//물음표의 순서
			pstmt.setInt(2, bbsID);
			pstmt.setInt(3, commentID);
			return pstmt.executeUpdate();//insert,delete,update			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}

	public Comment getComment(int commentID) {
		String SQL = "SELECT * FROM commenttable WHERE commentID = ? ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  commentID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment();
				cmt.setCommentContent(rs.getString(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setCommentDate(rs.getNString(4));
				cmt.setBbsID(rs.getInt(5));
				return cmt;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int delete(int commentID) {
		String SQL = "UPDATE commenttable SET commentAvailable = 0 where commentID = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
}