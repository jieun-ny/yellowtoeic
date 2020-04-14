package model;

import java.io.Serializable;

public class Exam_LC implements Serializable{
	private int exam_num;
	private String part;
	private String question;
	private String no1;
	private String no2;
	private String no3;
	private int answer;
	//Exam_User
	private int selected_ans;
	private String id;
	
	
	public int getExam_num() {
		return exam_num;
	}
	public void setExam_num(int exam_num) {
		this.exam_num = exam_num;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getNo1() {
		return no1;
	}
	public void setNo1(String no1) {
		this.no1 = no1;
	}
	public String getNo2() {
		return no2;
	}
	public void setNo2(String no2) {
		this.no2 = no2;
	}
	public String getNo3() {
		return no3;
	}
	public void setNo3(String no3) {
		this.no3 = no3;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public int getSelected_ans() {
		return selected_ans;
	}
	public void setSelected_ans(int selected_ans) {
		this.selected_ans = selected_ans;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	@Override
	public String toString() {
		return "Exam_LC [exam_num=" + exam_num + ", part=" + part + ", question=" + question + ", no1=" + no1 + ", no2="
				+ no2 + ", no3=" + no3 + ", answer=" + answer + ", selected_ans=" + selected_ans + ", id=" + id + "]";
	}

	
}
