package chap07.business;

import javax.servlet.http.HttpServletRequest;

public class PizzaIndexBusinessLogic implements BusinessLogic {

	@Override
	public String process(HttpServletRequest request) {
		return "pizza/pizza";
	}
}