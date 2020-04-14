package model;

import java.io.Serializable;

public class dbBoardDataBean implements Serializable{
	private int num;
	private String teacher;
	private String subject_name;
	private String class_name;
	private String filename;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@Override
	public String toString() {
		return "dbBoardDataBean [num=" + num + ", teacher=" + teacher + ", subject_name=" + subject_name + ", class_name="
				+ class_name + ", filename=" + filename + "]";
	}

}
