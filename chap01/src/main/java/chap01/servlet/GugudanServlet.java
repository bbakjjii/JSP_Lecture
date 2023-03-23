package chap01.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class GugudanServlet extends HttpServlet{

	/*
		/chap01/gugudan으로 접속하는 사용자들에게
		멋있는 구구단 페이지를 응답하는 서블릿을 만들어보세요
	 */

	@Override 
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		// request 객체는 주로 클라이언트의 정보를 담고 있다
		System.out.println(req.getRemoteAddr() + "로부터 요청이 왔습니다.");
		
		// 한글 안 나올 때 수정 방법
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		out.print("<!DOCTYPE html>\r\n"
				+ "<html lang=\"ko\">\r\n"
				+ "<head>\r\n"
				+ "    <meta charset=\"UTF-8\">\r\n"
				+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
				+ "    <title>06_반복문.html</title>\r\n"
				+ "    <link rel=\"stylesheet\" href=\"./css06.css\">\r\n"
				+ "    <style>\r\n"
				+ "        /* display:grid를 이용해 구구단을 멋있게 나오게 만들어보세요 */ \r\n"
				+ "        #grid-container {\r\n"
				+ "            display: grid;\r\n"
				+ "            grid-template-columns: 0.5fr repeat(9, 1fr);\r\n"
				+ "            grid-template-rows: repeat(9, 50px);\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #grid-container > div {\r\n"
				+ "            border: dashed orange 3px;\r\n"
				+ "            border-radius: 10px;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #grid-container > .gop {\r\n"
				+ "            border-color: red;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #grid-container > .dan {\r\n"
				+ "            border-color: green;\r\n"
				+ "        }\r\n"
				+ "    </style>\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "\r\n"
				+ "    <h3>자바스크립트에도 반복문이 있다</h3>\r\n"
				+ "\r\n"
				+ "    <ul>\r\n"
				+ "        <li>for문도 있다</li>\r\n"
				+ "        <li>while문도 있다</li>\r\n"
				+ "    </ul>\r\n"
				+ "\r\n"
				+ "    <div id=\"grid-container\"></div>\r\n"
				+ "\r\n"
				+ "    <script>\r\n"
				+ "        // QUIZ. 자바스크립트를 이용해 구구단을 생성해보세요 \r\n"
				+ "\r\n"
				+ "        const gugudan = document.getElementById('grid-container');\r\n"
				+ "\r\n"
				+ "        let dan = 2;\r\n"
				+ "        let gop = 0;\r\n"
				+ "\r\n"
				+ "        while (gop <= 9){\r\n"
				+ "            if (gop === 0){\r\n"
				+ "                gugudan.innerHTML += '<div></div>';\r\n"
				+ "            } else {\r\n"
				+ "                gugudan.innerHTML += `<div class=\"gop\">x ${gop}</div>`;\r\n"
				+ "            }\r\n"
				+ "            ++gop;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        while (dan <= 9){\r\n"
				+ "            gop = 1;\r\n"
				+ "            gugudan.innerHTML += `<div class=\"dan\">${dan}단</div>`;\r\n"
				+ "            while (gop <= 9) {\r\n"
				+ "                gugudan.innerHTML += `<div>${dan} x ${gop} = ${dan*gop}</div>`;\r\n"
				+ "                ++gop;\r\n"
				+ "            }\r\n"
				+ "            ++dan;\r\n"
				+ "        }\r\n"
				+ "    </script>    \r\n"
				+ "</body>\r\n"
				+ "</html>");
	}
}
