package model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Tcal implements Serializable{

	private String memberid;
	private Date dcal;
	private String list;
	private String dd;
	
	
	
	
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public Date getDcal() {
		return dcal;
	}
	public void setDcal(Date dcal) {
		this.dcal = dcal;
	}
	public String getList() {
		return list;
	}
	public void setList(String list) {
		this.list = list;
	}
	
	
	public static String fontColor(int date,int dayOfWeek){
		int dayCal = (dayOfWeek-1+date)%7;
		if(dayCal == 0){
			return "blue";
		}else if(dayCal==1){
			return "red";
		}
		else{
			return "";
		}}
	
	
	public static String isTwo(String month){

		return(month.length()<2)?month = "0"+month:month;
	}
	
	public static String getCalview(int i , List<Tcal> tcal){
		String d = isTwo(String.valueOf(i));
		String res = "";
		SimpleDateFormat sf = new SimpleDateFormat();
		for(Tcal tc : tcal){
			String day = sf.format(tc.getDcal());
			if(day.substring(0, 4).equals(d)){
				res+="<p>"+((tc.getList().length()>6)?(tc.getList().substring(0,6))+"...":(tc.getList()))+"</p>";
			}
		}
		return res;
	}
	@Override
	public String toString() {
		return "Tcal [memberid=" + memberid + ", dcal=" + dcal + ", list=" + list + ", dd=" + dd + "]";
	}
	
	
	
	
	
	
	
	
}
