package controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionMethod;
import model.FeedBackDao;
import model.FeedBackDto;
import util.ActionAnnotation;
import util.RequestMapping;
import util.RequestMapping.RequestMethod;

public class PrintFeedbacks extends ActionAnnotation{

	@Override
	public void initProcess(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub	
	}
	@RequestMapping(value="initPro",method=RequestMethod.GET)
	public String initPro(HttpServletRequest request, HttpServletResponse response) {
		List feedbacks = new ArrayList();
		String memberid = (String) request.getSession().getAttribute("memberid");
		System.out.println(memberid);
		feedbacks = FeedBackDao.getInstance().getAllFeedbacks();
		request.setAttribute("feedbacks", feedbacks);
		return "/view/feedback/feedbackBoard.jsp";

	}//1.반환테스트완료

	
	@RequestMapping(value="gotoFeedbackForm",method=RequestMethod.GET)
	public String writing(HttpServletRequest request, HttpServletResponse response) {
		return "/view/feedback/feedbackInsertForm.jsp";
	}//insertForm으로 가는 메소드
	//동작확인완료
	
	@RequestMapping(value="insertFeedback",method=RequestMethod.POST)
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("insertFeedback: 실행");
		List feedbacks = new ArrayList();
		String memberid = (String) request.getSession().getAttribute("memberid");
		System.out.println(memberid);
		FeedBackDto dto = new FeedBackDto();
		dto.setMember_id(memberid);
		dto.setContent(request.getParameter("feedback"));
		feedbacks = FeedBackDao.getInstance().insertFeedback(dto);
		request.setAttribute("feedbacks", feedbacks);
		return "/view/feedback/feedbackBoard.jsp";
	}
	@RequestMapping(value="process")
	public String process(HttpServletRequest request, HttpServletResponse response) {
		 try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 System.out.println("process 본격시작"+request.getParameter("feedbackCnt"));
		 Long feedbackCnt;
		 	if(request.getParameter("feedbackCnt")==null) {
		 		System.out.println("null로 들어옴.");
		 		 feedbackCnt = 3l;
		 	}else {
		 		feedbackCnt=Long.parseLong((String)request.getSession().getAttribute("feedbackCnt"));
		 		System.out.println("값이 들어감.");
		 	}
			List<FeedBackDto> feedbacks = FeedBackDao.getInstance().getThreeFeedbacks(feedbackCnt);
			System.out.println(feedbackCnt);
			 String resultStr ="";
			 System.out.println(feedbacks.size());
		for(int i=0; i<feedbacks.size(); i++){
		  String feedback = feedbacks.get(i).getContent();
		  String memberid = feedbacks.get(i).getMember_id();
		  String date = feedbacks.get(i).getReg_date();
		   resultStr += "<tr><td style=\"height: 50px;\"><h6 style=\"font-size: 1.2em;\">";
		  resultStr += feedback + "</h6></td><td><h6 style=\"font-size: 1.2em;\">";
		  resultStr += memberid +"</h6></td><td><h6 style=\"font-size: 1.2em;\">";
		  resultStr += date + "</h6></td><td>";
		  resultStr += "</tr>";
		}
		System.out.println(resultStr);
		System.out.println("********************ajax");
		request.setAttribute("resultStr", resultStr);
		request.setAttribute("feedbackCnt", feedbackCnt+3);
		System.out.println(request.getAttribute("feedbackCnt"));
		
		return "/ajax/process.jsp";
	}
}