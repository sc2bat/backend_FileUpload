package board.dto;

import java.sql.Timestamp;

public class RDto {
	private int replynum;
	private int boardnum;
	private String userid;
	private Timestamp writedate;
	private String reply;
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Timestamp getWritedate() {
		return writedate;
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String content) {
		this.reply = content;
	}
	
	
	
}
