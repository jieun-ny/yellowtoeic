package controller;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ExamRepository;
import model.Exam_LC;
import model.Exam_RC;
import model.Exam_user;
import action.ActionMethod;




public class ExamController extends ActionMethod {
	
	public void initProcess(HttpServletRequest request, HttpServletResponse response){
		System.out.println("=============??");
		HttpSession session = request.getSession();

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// �ѱ��� ���ڵ� �Ǳ� ���ؼ� ��� �׷��� ���� ����
		int currentPage = 1; // ���� �������� ������ ��ġ
		try {
			currentPage = Integer.parseInt(request.getParameter("num"));
			session.setAttribute("num", currentPage);
			System.out.println(session.getAttribute("num"));
		} catch (Exception e) {
			if (session.getAttribute("num") == null) {
				session.setAttribute("num", 1);
			}
		}
		
	}
	private ExamRepository service = new ExamRepository();
	
	
	public String test_start(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.getAttribute("memId");
		int a = service.deleteUser();
		request.setAttribute("a", a);
		session.removeAttribute("num");
		
		return "/view/startexam.jsp";
		
	}	
	
	public String test_exam(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		int check = Integer.parseInt(request.getParameter("check"));
		System.out.println("check "+check);
	
		if(check==1){
			return "/exam/examLCForm.jsp";
		}else if(check==2){
			//RC ���� ����
			int curnum = (int) session.getAttribute("num");
			Exam_RC exam = service.getExam(curnum);
			
			int count = service.getExamCount();
			System.out.println("curnum : " + curnum);
			System.out.println("exam_num : " + request.getParameter("exam_num"));
	
			Exam_user question = new Exam_user();
			question.toString();

			if(curnum != 1){
				int num = Integer.parseInt(request.getParameter("exam_num"));
				question.setExam_num(num);
				question.setId((String)session.getAttribute("memid"));
				question.setSelected_ans(Integer.parseInt(request.getParameter("seleted")));
				System.out.println(question.toString());
				int a = service.insertExamUser(question);
				System.out.println("a : "+a);
				if(curnum==0 || count < curnum){
					return "redirect:/test/checkRC?exam_num="+num;
				}
			}
			request.setAttribute("curnum", curnum);
			request.setAttribute("count", count);
			request.setAttribute("exam", exam);
			
			return "/exam/examRCForm.jsp";
		}
		return null;
	}
	
	public String test_checkRC(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		int total = Integer.parseInt(request.getParameter("exam_num"));
		System.out.println("total : "+total);
		List<Exam_RC> result_exam = service.getAnswers_RC(total);
		
		System.out.println(result_exam.toString());
		request.setAttribute("length", total);
		request.setAttribute("result_exam", result_exam);
		session.removeAttribute("num");
		System.out.println(session.getAttribute("num"));
		
		return "/exam/answerForm.jsp";
	}
	
	public String test_checkLC(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int total = Integer.parseInt(request.getParameter("total"));
		Exam_user question = new Exam_user();
		
		
		for(int i = 1; i <= total; i++){
			question.setExam_num(i);
			question.setId((String)session.getAttribute("memid"));
			question.setSelected_ans(Integer.parseInt(request.getParameter("question"+i)));
			int a = service.insertExamUser(question);
			System.out.println("a : "+a);
		}
				
		List<Exam_LC> result_exam = service.getAnswers_LC(total);
		
		System.out.println(result_exam.toString());
		request.setAttribute("length", total);
		request.setAttribute("result_exam", result_exam);
		session.removeAttribute("num");
		System.out.println(session.getAttribute("num"));
		
		return "/exam/answerForm.jsp";
	}
	
	public String test_delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int a = service.deleteUser();
		request.setAttribute("a", a);
		session.removeAttribute("num");
		
		return "redirect:/test/start";
	}
}
