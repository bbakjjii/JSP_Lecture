package board.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import board.dao.BoardDao;
import board.dao.BoardDao_Impl;
import board.dto.Board;

// -- 42 --
public class WriteService implements Service{
	
	BoardDao boardDao = new BoardDao_Impl();

	@Override
	public String service(HttpServletRequest req) {
		
		// 1. request에 실려온 파라미터 정보를 모두 읽는다
		String write_id = req.getParameter("write_id");
		String write_pw = req.getParameter("write_pw");
		String write_title = req.getParameter("write_title");
		String wirte_content = req.getParameter("write_content");
		
		// -- 45 --
		// 1-2. 데이터를 전달하기 편한 형태로 만들어준다 (dto에 담는다)
		Board b = new Board();
		b.setWrite_id(write_id);
		b.setWrite_pw(write_pw);
		b.setWrite_title(write_title);
		b.setWrite_content(wirte_content);
		
		// 2. 전달받은 내용을 DB에 쓴다 (DAO가 할 일)
		boolean result = boardDao.write(b);
		
		// 3. 결과에 따라 하고싶은 일을 한다
		return "redirect::" + req.getContextPath() + "/list";
	}
}
