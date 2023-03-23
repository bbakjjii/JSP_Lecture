package chap07.business;

import javax.servlet.http.HttpServletRequest;

public class PizzaOrderFormBusinessLogic implements BusinessLogic{

	// -- ④ --
	@Override
	public String process(HttpServletRequest request) {
		
		// 피자를 주문하는 폼으로 이동할 때 필요한 정보들을 조회할 수 있음
		/*
			ex: DB로부터 로그인 된 사용자의 이름, 주소, 전화번호 등을 미리 꺼낼 수 있음
		*/
		
		// 만약 조회 했다면 request의 어트리뷰트에 실어서 view 페이지로 이동할 수 있음
		
		// 포워드 할 때는 webapp 밑의 경로를 사용하기 때문에 contextPath가 필요 없다
		return "pizza/orderForm";
	}

}
