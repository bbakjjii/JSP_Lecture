package comment;

public class Comment {
	private String commentContent;
	private int commentID;
	private String userID;
	private String commentDate;
	private int bbsID;
	private int coomentAvailable;
	
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public int getCoomentAvailable() {
		return coomentAvailable;
	}
	public void setCoomentAvailable(int coomentAvailable) {
		this.coomentAvailable = coomentAvailable;
	}
}