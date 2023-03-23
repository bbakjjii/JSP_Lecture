package board.dto;

public class Reply {
	
	private Integer board_id;
	private Integer replyID;
	private String replyContent;
	private String write_id;
	private Integer replyAvailable;
	private String commentDate;
	
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public void setReplyAvailable(Integer replyAvailable) {
		this.replyAvailable = replyAvailable;
	}
	public Integer getBoard_id() {
		return board_id;
	}
	public void setBoard_id(Integer board_id) {
		this.board_id = board_id;
	}
	public Integer getReplyID() {
		return replyID;
	}
	public void setReplyID(Integer replyID) {
		this.replyID = replyID;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getWrite_id() {
		return write_id;
	}
	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}
	public Integer getReplyAvailable() {
		return replyAvailable;
	}
	public void setReplyAvailable(int replyAvailable) {
		this.replyAvailable = replyAvailable;
	}
}