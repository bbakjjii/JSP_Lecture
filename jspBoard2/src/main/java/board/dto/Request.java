package board.dto;

//-- 2 --
public class Request {
	
	private String uri;
	private String method;
	
	public Request(String uri, String method) {
		this.uri = uri;
		this.method = method;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}
	
	// -- 7 --
	// init과 service의 Request가 같은 것이라고 취급되기위한 방법 : hashCode 오버라이드
	// hashCode : 재료로 고유 번호를 만들어 객체 구분
	@Override
	public int hashCode() {
		// uri를 재료로, method를 재료로 하여 다른 인스턴스여도 같은 hashCode를 만든다. 
		return uri.hashCode() + method.hashCode();
	}
	
	// equals : 두 객체가 같은지 비교하는 메서드
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Request) {			
			Request o1 = this;
			Request o2 = (Request)obj;
			
			System.out.println("hi"); // 여기까지 오는지 확인하는 용
			
			return o1.method.equals(o2.method) &&
					o1.uri.equals(o2.uri);			
			
		} else {
			return false;
		}
	
	}
	
}
