package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// DAO : 데이터베이스접근객체, 실질적으로 데이터베이스에서 회원정보를 불러오거나 데이터베이스에 회원정보를 넣고자 할 때 사용 
public class UserDAO {
	
	// [Ctrl]+[Shift]+[O]로 한번에 import 가능
	private Connection conn;
	private PreparedStatement pstmt; 
	private ResultSet rs;
	
	// 생성자 만들기
	public UserDAO() {
		
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
	
	/* 
	SQL 인젝션 같은 해킹기법을 방어하기 위한 수단으로 PreparedStatement를 사용하는데 
    하나의 문장을 미리 준비해놓았다가 중간에 '?'를 넣어 '?'에 해당하는 내용으로 userID를 넣어둔다. 
    매개변수로 넘어온 userID를 '?'에 들어갈 수 있게 해줘서 
	실제로 데이터베이스에는 현재 접속을 시도하고자 하는 사용자의 아이디를 입력받아 그 아이디가 실제로 존재하는지, 
	실제로 존재한다면 그 비밀번호는 뭔지 데이터베이스에서 가져오도록 한다.
	그다음 ResultSet 즉 결과를 담을 수 있는 하나의 객체에다가 실행한 결과를 넣어준다.
	실행한 결과가 존재한다면 if문의 rs.next()에서 실행이 되고, 존재하지 않다면 return 부분이 실행된다. 
	*/
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM usertable WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL); // pstmt에 정해진 SQL문장을 데이터베이스에 삽입하는 형식으로 인스턴스를 가져온다
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 아이디가 있는 경우 : 비밀번호가 일치하면 로그인 성공
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공 : 비밀번호 일치
				} else {
					return 0; //로그인 실패 : 비밀번호 불일치
				}
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	
	public int join(User user) { // 회원가입시 작성한 내용을 데이터베이스에 넣는다
		String SQL = "INSERT INTO USERTABLE VALUES (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());	
			pstmt.setString(5, user.getUserEmail());	
			// INSERT문을 실행한 경우는 반드시 0이상의 숫자가 반환되기 때문에 -1이 아닌 경우는 
			// 성공적으로 회원가입이 이루어진 것이라고 볼 수 있다
			return pstmt.executeUpdate(); // 해당 statement를 실행한 그 결과를 넣는다
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

}
