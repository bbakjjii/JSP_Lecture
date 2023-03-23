package board.dto;

// -- 24 --
public class Pagination {
	
	private int page;
	private int size;
	
	public Pagination(int page, int size) {
		this.page = page;
		this.size = size;
	}
	
	public int getStartIndex() {
		return (page);
	}
	
	public int getEndIndex() {
		return page * size;
	}
	
	public int getPaginationStart() {
		return (page / size) * size + 1;
	}
	
	public int getPaginationEnd() {
		return (page / size + 1) * size;
	}

}
