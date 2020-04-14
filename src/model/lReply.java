package model;

import java.io.Serializable;
import java.util.Date;

public class lReply implements Serializable{
	private int num;
	private String memberid ;
	private String subject_name;
	private int grade;
	private String content;
	private Date reg_date;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "lReply [num=" + num + ", memberid=" + memberid + ", subject_name=" + subject_name + ", grade=" + grade
				+ ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	
}
