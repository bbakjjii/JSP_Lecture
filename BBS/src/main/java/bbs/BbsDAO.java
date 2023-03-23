package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BbsDAO {

	/*
		여러개의 함수가 사용되기 때문에 각각 함수끼리 데이터베이스 접근에 있어서
		마찰이 일어나지 않도록 UserDAO와 달리 PreparedStatement는 안쪽에 넣어준다.
	 */

	private Connection conn;
	private ResultSet rs;

	public BbsDAO() {

		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:XE"; // 본인 컴퓨터의 데이터베이스에 접속 할 수 있는 것
			String dbID = "onore";
			String dbPassword = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 데이터베이스에 접속할 수 있도록 매개체 역할을 해주는 하나의 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); // conn 객체 안에 접속된 정보가 담기게 된다
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() { // 현재 서버의 시간을 가져오는 함수
		String SQL = "SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL";
		try {
			// 현재 열결되는 객체(conn)을 이용해 SQL 문장을 실행 준비단계로 만들어 줄 수 있도록 한다
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			// 실제로 실행했을 때 나오는 결과를 가져올 수 있도록 한다
			rs= pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // 결과가 있는 경우 : 현재의 날짜를 그대로 반환해준다
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	public int getNext() { // 글번호 생성
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC"; // 게시글 번호는 1번부터 하나씩 늘어난다. 마지막 글번호 + 1
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			rs= pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1; // 나온 결과 + 1 (마지막 글번호 + 1) 
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1,  getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, 0);
			// rs= pstmt.executeQuery(); -- INSERT문에서는 필요없다.
			return pstmt.executeUpdate(); // 성공 : 0 이상인 결과를 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	// 특정한 리스트를 담아서 반환할 수 있다
	public ArrayList<Bbs> getList(int pageNumber) { // 특정한 페이지에 따른 총 10개의 게시글을 가지고 올 수 있다
		String SQL = "SELECT * FROM (SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC)"
				+ "WHERE ROWNUM <= 10";  // bbsID가 특정한 숫자보다 작고 삭제가 되지 않은 글(1)만 10개까지 가져온다 
		ArrayList<Bbs> list = new ArrayList<Bbs>(); // BBS라는 클래스에서 나오는 인스턴스를 보관할 수 있는 리스트
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			/*
				현재 게시글이 5개일 경우 getNext()를 하면 6이 나오기 때문에, 
				pageNumber는 게시글이 5개밖에 없으므로 1페이지가 된다.
				6-(1-1) = 6이라는 값이 담기게 된다. 
				6보다 작은것만 가져오기 때문에 1부터 5까지의 게시글만 모든 가져오게 된다.
				특정한 페이지에서 10개만큼 게시글을 뽑아서 출력할 수 있도록 함수를 만든다. 
			*/
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); 
			rs= pstmt.executeQuery();
			 while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setBbsViewCnt(rs.getInt(7));
				list.add(bbs); // list에 해당 리스트를 담는다			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; // list를 반환한다
	}
	
	/* 
		만약 게시글이 10개, 20개로 10단위씩 끊긴다면 게시글이 10개인 경우 다음페이지로 넘어가는 버튼이 없어야 한다.
		다음 페이지인 2페이지로 넘어갔을 때 다음글이 나와야 하는데 10개밖에 없다면 다음 화면이 존재하지 않는다.
		10단위로 끊긴다면 다음페이지가 없다는 페이징 처리를 해줘야 하기 때문에 nextPage함수를 생성한다.
	 */
	public boolean nextPage(int pageNumber) { // 페이징처리를 위해 존재하는 함수
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";  // bbsID가 특정한 숫자보다 작고 삭제가 되지 않은 글(1)
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs= pstmt.executeQuery();
			if (rs.next()) {
				return true; // 결과가 하나라도 존재한다면(11개, 12개 등) true를 하므로 다음페이지로 넘어간다
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 결과가 하나도 존재하지 않다면 false
	}
	
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?"; //bbsID의 숫자에 해당하는 게시글을 그대로 가져온다
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, bbsID);
			rs= pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				int bbsViewCnt = rs.getInt(7);
				bbs.setBbsViewCnt(bbsViewCnt);
				bbsViewCnt++;
				countUpdate(bbsViewCnt,bbsID);
				return bbs;//6개의 항목을 bbs인스턴스에 넣어 반환한다.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 해당 글이 존재하지 않는 경우 null을 반환
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?"; // 특정한 글번호에 해당하는 제목과 내용을 바꿔주겠다
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate(); // 성공 : 0 이상인 결과를 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int bbsID) {
		String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?"; //데이터베이스에서 삭제되지 않고 Available값만 삭제된 값(0)으로 바뀌도록 한다
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate(); // 성공 : 0 이상인 결과를 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	// 조회수 증가
	public int countUpdate(int bbsViewCnt, int bbsID) {
		String SQL = "UPDATE bbs SET bbsViewCnt = ? where bbsID = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsViewCnt);//물음표의 순서
			pstmt.setInt(2, bbsID);
			return pstmt.executeUpdate();//insert,delete,update			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
}
