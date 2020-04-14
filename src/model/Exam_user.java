package model;

import java.io.Serializable;

public class Exam_user implements Serializable {
	
	private int exam_num;
	private int selected_ans;
	private String id;
	
	public int getExam_num() {
		return exam_num;
	}
	public void setExam_num(int exam_num) {
		this.exam_num = exam_num;
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
		return "Exam_user [exam_num=" + exam_num + ", selected_ans=" + selected_ans + ", id=" + id + "]";
	}
	
	
}
