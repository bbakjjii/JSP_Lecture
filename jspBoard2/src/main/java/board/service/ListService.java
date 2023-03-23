package board.service;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import board.dao.BoardDao;
import board.dao.BoardDao_Impl;
import board.dto.Board;

//-- 9 --
public class ListService implements Service {
	
	BoardDao dao = new BoardDao_Impl();
	
	@Override
	public String service(HttpServletRequest req) {
		
		// 현재 페이지가 나온다
		String pageStr = req.getParameter("page");
	
		// page 1 : 게시글이 0 ~ 9까지
		// page 2 : 게시글이 10 ~ 19까지
		// page 3 : 게시글이 20 ~ 29까지
		// ★공식 : page i : (i - 1) * 10 ~ i * 10 - 1 또는 (i * 10 - 1) 대신 글의 최대 개수
				
		List<Board> boards = dao.selectAllBoards();
		
		// -- 22 -- 
		// 현재 페이지 값을 통해 가져온 전체 글들 중 10개만 어트리뷰트에 실을 수 있도록
		// 부분 리스트를 생성해야 한다
		// (1) 페이지를 숫자로 변환
		int page;
		
		if (pageStr == null) {
			page = 1;
		} else {
			page = Integer.parseInt(pageStr);
		}
		
		// (2) page i : (i - 1) * 10 ~ i * 10 - 1 또는 (i * 10 - 1) 대신 글의 최대 개수
		// start_index : (page - 1) * 10 
		// ex: (5-1)*10 = 40
		// end_index : i * 10 - 1 or 글의 최대 개수
		// ex: 5*10 - 1 = 49
		int page_size = 10; // board_size = 페이지 사이즈		
		int board_size = boards.size();
		int start_index = (page - 1) * page_size;
//		int end_index = page * page_size - 1;
		int end_index = page * page_size;
		end_index = end_index > boards.size() ? boards.size() : end_index;
		
		System.out.printf("현재 페이지는 %d페이지고, 시작 인덱스는 %d, 마지막 인덱스는 %d입니다.",
				page, start_index, end_index);
		
		// -- 23 --
		// 전체 글이 1947개면 195페이지 필요하다
		int max_page = board_size % page_size == 0 ?
				board_size / page_size : board_size / page_size + 1;
		
		// 현재 페이지가 5일 때 1~10로 나왔으면 함
		// 현재 페이지가 37일 때 31~40d로 나왔으면 함
		int pagination_start = (page / page_size) * page_size + 1 ;
		int pagination_end = (page / page_size + 1) * page_size;
		pagination_end = pagination_end > max_page ? 
				max_page : pagination_end;

      
		System.out.printf("현재 페이지는 %d페이지이고, 페이지 네비게이션 시작 숫자는 %d, 마지막 숫자는 %d입니다.\n",
				page, pagination_start, pagination_end);
						
		req.setAttribute("boards", boards.subList(start_index, end_index));	
		req.setAttribute("pagination_start", pagination_start);
		req.setAttribute("pagination_end", pagination_end);
		
		return "board/list";
	}
	
}
