package model;

import java.io.Serializable;
import java.util.Date;

public class Tmember implements Serializable{
	private String memberid;
	private String name;
	private String email;
	private String password;
	private String phone;
	private String address;
	private Date birthday;
	private Date regdate;
	private int test_result;
	private Date test_day;
	public String getMemberId() {
		return memberid;
	}
	public void setMemberId(String memberid) {
		this.memberid = memberid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getTest_result() {
		return test_result;
	}
	public void setTest_result(int test_result) {
		this.test_result = test_result;
	}
	public Date getTest_day() {
		return test_day;
	}
	public void setTest_day(Date test_day) {
		this.test_day = test_day;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
