package chap04.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class Member {
	
	private String name;
	private String id;
	private String password;
	private String birthday;
	//private LocalDate birthday;
	private List<String> memos;
	
	public Member(String name, String id, String password, String birthday) {
		this.name = name;
		this.id = id;
		this.password = password;
		this.birthday = birthday;
		//this.birthday = LocalDate.parse(birthday, DateTimeFormatter.ofPattern("YYYY-MM-DD"));
		this.memos = new ArrayList<>();
	}
	
	public List<String> getMemos() {
		return memos;
	}
	
	public void putMemo(String memo) {
		memos.add(memo);
	}
	
	// 아이디와 비밀번호가 모두 일치하면 true 아니면 false
	// 연산자랑 메서드 배울 때 배웠음
	public boolean login(String id, String password) {
		return this.id.equals(id) && this.password.equals(password);
	}
	
	@Override
	public String toString() {
		// <b> bold체
		return String.format("<b>%s(%s)</b>", name, id); 
	}
}
