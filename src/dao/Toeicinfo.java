package dao;

import java.io.Serializable;

public class Toeicinfo implements Serializable{

	public String t;
	public String date;
	public String pdate;
	public String adate;
	public String getT() {
		return t;
	}
	public void setT(String t) {
		this.t = t;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	
}
