package model;

public class OwnLecturePrinterDto {
    String memberid;
    String StartDay;
    String endDay;
    String purchasedlectures;
    

    public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	public String getPurchasedlectures() {
		return purchasedlectures;
	}

	public void setPurchasedlectures(String purchasedlectures) {
		this.purchasedlectures = purchasedlectures;
	}

	public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getStartDay() {
        return StartDay;
    }

    public void setStartDay(String startDay) {
        StartDay = startDay;
    }

//	@Override
//	public String toString() {
//		return "OwnLecturePrinterDto [memberid=" + memberid + ", StartDay=" + StartDay + ", endDay=" + endDay
//				+ ", purchasedlectures=" + purchasedlectures + "]";
//	}
    
}
