package controller;


import model.LecturePrinterDao;
import model.LecturePrinterDto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionMethod;

import java.io.IOException;
import java.util.List;

public class PrintLecture extends ActionMethod {
    @Override
    public void initProcess(HttpServletRequest req, HttpServletResponse resp) {
    }
    
    public String lecture_printLectures(HttpServletRequest request, HttpServletResponse response){
        String memberid = (String) request.getSession().getAttribute("memberid");
//        String memberid = request.getParameter("member_id");
        System.out.println(memberid);
        if(memberid==null) {
        List<LecturePrinterDto> lectures = null;
            lectures = LecturePrinterDao.getInstance().getAllLectures();
            request.setAttribute("lectures",lectures);
            request.getSession().setAttribute("memberid",null); 
        return "/view/lecture/index.jsp";
        }else {
        	List<LecturePrinterDto> lectures = null;
            List<LecturePrinterDto> otherlectures = null;
            lectures = LecturePrinterDao.getInstance().getFilteredLectures(memberid);
            request.setAttribute("lectures",lectures);
            otherlectures = LecturePrinterDao.getInstance().getOtherLectures(memberid);
            request.setAttribute("otherlectures",otherlectures);
            return "/view/lecture/index.jsp";
        }
    }


    public String lecture_tradeLectures_ (HttpServletRequest request, HttpServletResponse response){
        String memberid = (String) request.getSession().getAttribute("memberid");
//        String memberid = request.getParameter("member_id");
        System.out.println(memberid);
        String[] purchased_lectures = request.getParameterValues("in_basket");
        for(int i = 0; i<purchased_lectures.length; i++) {
            System.out.println("lecture_tradeLectures_"+purchased_lectures[i].toString());
        }
        List<LecturePrinterDto> lectures = null;
        List<LecturePrinterDto> otherlectures = null;
        LecturePrinterDao.getInstance().insertLectures(memberid,purchased_lectures);
        lectures = LecturePrinterDao.getInstance().getFilteredLectures(memberid);
        request.setAttribute("lectures",lectures);
        otherlectures = LecturePrinterDao.getInstance().getOtherLectures(memberid);
        request.setAttribute("otherlectures",otherlectures);
        return "/view/lecture/index.jsp";
    }
    
    public String lecture_printMyLectures(HttpServletRequest request, HttpServletResponse response){
        String memberid = (String) request.getSession().getAttribute("memberid");
//        String memberid = request.getParameter("member_id");
        System.out.println(memberid);
        List<LecturePrinterDto> lectures = null;
        List<LecturePrinterDto> otherlectures = null;
        if(memberid==null||memberid.isEmpty()){
            lectures = LecturePrinterDao.getInstance().getAllLectures();
            request.setAttribute("lectures",lectures);
            request.getSession().setAttribute("memberid",null);
        }else{
            lectures = LecturePrinterDao.getInstance().getFilteredLectures(memberid);
            request.setAttribute("lectures",lectures);
        }
        return "/view/lecture/index2.jsp";
    }
}
