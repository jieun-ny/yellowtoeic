<%@page import="model.FeedBackDto"%>
<%@page import="java.util.List"%>
<%@page import="model.FeedBackDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<% request.setCharacterEncoding("utf-8");%>

<% 	
	List<FeedBackDto> feedbacks = FeedBackDao.getInstance().getThreeFeedbacks(10l);	
	FeedBackDto dto = new FeedBackDto();
%>

<%
for(int i=0; i<feedbacks.size(); i++){
  String feedback = feedbacks.get(i).getContent();
  String memberid = feedbacks.get(i).getMember_id();
  String date = feedbacks.get(i).getReg_date();
  String resultStr = "<tr><td style=\"height: 50px;\"><h6 style=\"font-size: 1.2em;\">";
  resultStr += feedback + "</h6></td><td><h6 style=\"font-size: 1.2em;\">";
  resultStr += memberid +"</h6></td><td><h6 style=\"font-size: 1.2em;\">";
  resultStr += date + "</h6></td><td>";
  resultStr += "</tr>";
  
  out.println(resultStr);
 
}
%>
