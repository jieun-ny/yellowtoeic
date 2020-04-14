package model;

import java.io.Serializable;
import java.util.Date;

public class FeedBackDto implements Serializable{
	String member_id;
	String content;
	String reg_date;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "FeedBackDto [member_id=" + member_id + ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	
}
