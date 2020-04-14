package model;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import dao.Toeicinfo;
import jdk.nashorn.internal.codegen.CompilerConstants.Call;
import util.ActionAnnotation;
import util.RequestMapping;
import util.RequestMapping.RequestMethod;

public class BoardlistService extends ActionAnnotation{
private final CommentSessionRepository commentSessionRepository = new CommentSessionRepository();



@RequestMapping(value="mypage",method=RequestMethod.GET)
public String testselectMemberBymemberid(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();
    Map<String, String> map = new HashMap<>();
    
   String memberid= (String) session.getAttribute("memberid");
   Tmember member = commentSessionRepository.selectMemberBymemberid(memberid);
   SimpleDateFormat fd = new SimpleDateFormat("yyyy-MM-dd");
   session.setAttribute("member",member);
   session.setAttribute("fd", fd);
   System.out.println(member);
   
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");


 String yy;
 String mm;
 Calendar dd = Calendar.getInstance();


 if(request.getParameter("year")!=null){
 yy = request.getParameter("year");
mm =request.getParameter("month");}
 

 else{
   
    yy= Integer.toString(dd.get(Calendar.YEAR));
    mm= Integer.toString(dd.get(Calendar.MONTH)+1);
    System.out.println(yy+":"+mm);
 }

 System.out.println(mm);
 Map<String, String> calender = new HashMap<>();
 calender.put("memberid", memberid);
 calender.put("yy", yy);
 calender.put("mm", mm);
 List<Tcal> callist = commentSessionRepository.selectCalender(calender);
 List<Tcal> callist2=commentSessionRepository.selectCalender2(calender);
  System.out.println(callist);


 for(int i =0; i<callist.size();i++){
    String d = "";
   if(callist.get(i).getDd().startsWith("0")){
      d=callist.get(i).getDd().substring(1, 2);
   } else {      d=callist.get(i).getDd();   }
   
   if (map.get(d)==null) {
      map.put(d,callist.get(i).getList());
   } else {
      
   map.put(d,map.get(d)+"<br>"+callist.get(i).getList());}
   
   
 }

 for(int i =0; i<callist2.size();i++){
    String d = "";
   if(callist2.get(i).getDd().startsWith("0")){
      d=callist2.get(i).getDd().substring(1, 2);
      
   }else{
       d=callist2.get(i).getDd();

   }
   
   if (map.get(d)==null) {
      map.put(d,"����");
   } else {
      
   map.put(d,map.get(d)+"<br>"+"����");}
   
   
 }

 
 System.out.println(map.get(1));
 System.out.println(map);
    session.setAttribute("map", map);
 
   return "/view/loginpage/mypagelist.jsp";
}


@RequestMapping(value="mypagelist",method=RequestMethod.GET)
public String testSelectCommentByCondition(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();
 String memberid = request.getParameter("memberid");
   Map<String, Object> member = new HashMap<String, Object>();
   member.put("memberid", memberid);
   member.put("contentNoForeach", new ArrayList<Long>());
   List li = commentSessionRepository.selectCommentBymemberid(member);
   session.setAttribute("mylist", li);
   return "/view/board/mypagelist.jsp";
}

@RequestMapping(value="writereplypro",method=RequestMethod.POST)
public String writeReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
   
   HttpSession session = request.getSession();
 String memberid = request.getParameter("memberid");
 String boardid = request.getParameter("boardid");
 String content = request.getParameter("content");
 int grade = Integer.parseInt(request.getParameter("star-input"));
 Reply reply = new Reply();
   reply.setBoardid(boardid);
   reply.setMemberid(memberid);
   reply.setContent(content);
   reply.setGrade(grade);
   int result = commentSessionRepository.insertReply(reply);
   session.setAttribute("result", result);
   
   return "/view/board/replylist.jsp";
}
@RequestMapping(value="writereply",method=RequestMethod.GET)
public String reply_writeForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
   
   HttpSession session = request.getSession();
   session.setAttribute("garde", "");
   String boardid = request.getParameter(("boardid"));
   
      List li = commentSessionRepository.selectAllReply(boardid);
      session.setAttribute("replylist", li);
      SimpleDateFormat fd = new SimpleDateFormat("yyyy-MM-dd");
      int garde = commentSessionRepository.selectAvarge(boardid);
      session.setAttribute("garde", garde);
      
      session.setAttribute("fd", fd);
return "/view/board/star.jsp";
}//view�� ���� 



String boardid = null;
public void initProcess(HttpServletRequest request, HttpServletResponse response)  {
   HttpSession session = request.getSession();
   
   try {
      request.setCharacterEncoding("utf-8");
   } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
   }
   
   
   if(request.getParameter("boardid")!=null&&!request.getParameter("boardid").equals("")){
      session.setAttribute("boardid", request.getParameter("boardid"));
      session.setAttribute("pageNum", 1);
   }
    boardid = (String)session.getAttribute("boardid");
   if(boardid==null){
      boardid="1";
      session.setAttribute("boardid", boardid);
   }
}

private static ArrayList<Toeicinfo> info = new ArrayList<>();

@RequestMapping(value="notice",method=RequestMethod.GET)
public String getToeic(HttpServletRequest req, HttpServletResponse resp) throws IOException{
String URL = "http://appexam.ybmnet.co.kr/toeic/info/receipt_schedule.asp"; 
Document doc = Jsoup.connect(URL).get(); 
Elements elem = doc.select(".table_info_print tbody td"); 
HttpSession session = req.getSession();
String boardid = req.getParameter("boardid");
int i =0 ;
Toeicinfo temp = new Toeicinfo();
for(Element x : elem)
{
   
   if(i == 4){
      i=0;
      info.add(temp);
      temp = new Toeicinfo();
   }
   
   if(i == 0)
    temp.setT(x.text());
   else if(i == 1)
   temp.setDate(x.text());
   else if(i == 2)
      temp.setPdate(x.text());
   else if(i == 3)
      temp.setAdate(x.text());   
   i ++;

}
int day = Integer.parseInt(info.get(0).getT().substring(1, 4));

System.out.println(day);
session.setAttribute("day", day);
session.setAttribute("info", info);
session.setAttribute("boardid", boardid);




int currentPage = 1;

try
{
    currentPage = Integer.parseInt(req.getParameter("pageNum"));
    session.setAttribute("pageNum", currentPage);
}
catch (Exception e)
{
    
    if (session.getAttribute("pageNum") == null) 
        session.setAttribute("pageNum", 1);
}
currentPage = (int) session.getAttribute("pageNum");

int pageSize = 9;
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;


// board id 에 해당하는 모든 게시물 가져와야함 
int count = commentSessionRepository.countAllbyboardid(boardid);



// 보드 아이디에 해당하는 거  리스트 불러우기 수정 해야함 

//이걸로 가쟈와야함 
List  boardList = commentSessionRepository.selectCommentByboardid(startRow, endRow,boardid);


int number = count - (currentPage - 1) * pageSize;
int bottomLine = 3;
int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
int endPage = startPage + bottomLine - 1;

if (endPage > pageCount) endPage = pageCount;

req.setAttribute("currentPage", currentPage);
req.setAttribute("startRow", startRow);
req.setAttribute("endRow", endRow);
req.setAttribute("count", count);
req.setAttribute("pageSize", pageSize);
req.setAttribute("number", number);
req.setAttribute("bottomLine", bottomLine);
req.setAttribute("startPage", startPage);
req.setAttribute("endPage", endPage);
req.setAttribute("pageCount", pageCount);














session.setAttribute("list", boardList);
SimpleDateFormat fd = new SimpleDateFormat("yyyy-MM-dd");
session.setAttribute("fd", fd);
return "/view/board/toeicnotice.jsp";
}

@RequestMapping(value="testdate",method=RequestMethod.GET)
public String getToeicinfo(HttpServletRequest req, HttpServletResponse resp) throws IOException{
String URL = "http://appexam.ybmnet.co.kr/toeic/info/receipt_schedule.asp"; 
Document doc = Jsoup.connect(URL).get(); 
Elements elem = doc.select(".table_info_print tbody td"); 
HttpSession session = req.getSession();
int i =0 ;
Toeicinfo temp = new Toeicinfo();
for(Element x : elem)
{
   
   if(i == 4){
      i=0;
      info.add(temp);
      temp = new Toeicinfo();
   }
   
   if(i == 0)
    temp.setT(x.text());
   else if(i == 1)
   temp.setDate(x.text());
   else if(i == 2)
      temp.setPdate(x.text());
   else if(i == 3)
      temp.setAdate(x.text());   
   i ++;

}
session.setAttribute("info", info);
SimpleDateFormat fd = new SimpleDateFormat("yyyy-MM-dd");
session.setAttribute("fd", fd);
return "/view/board/ddayTest.jsp";
}
@RequestMapping(value="ddayPro",method=RequestMethod.GET)
public String insertDday(HttpServletRequest request, HttpServletResponse resp) throws IOException, ParseException{
   HttpSession session = request.getSession();
   String temp = request.getParameter("dday");
   String yy = temp.substring(0, 2);
   String mm= temp.substring(3, 5);
   String dd= temp.substring(6, 8);
   String date = yy+"-"+mm+"-"+dd;
   System.out.println(date);
   SimpleDateFormat sf = new SimpleDateFormat("yy-MM-dd");
   Date dday = sf.parse(date);
   System.out.println(dday);
   String memeberid= (String) session.getAttribute("memberid");
   Tmember tmember = new Tmember();
   tmember.setMemberId(memeberid);
   tmember.setTest_day(dday);
   
   try{
    commentSessionRepository.insertDday(tmember);
   }catch(Exception e){e.printStackTrace();}
   
   return "/view/board/ddayPro.jsp";

}

@RequestMapping(value="calendar",method=RequestMethod.GET)
public String selectCalender(HttpServletRequest request, HttpServletResponse response) throws Exception {
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
   HttpSession session = request.getSession();
 String memberid = (String) session.getAttribute("memberid");
 String yy;
 String mm;
 Calendar dd = Calendar.getInstance();


 if(request.getParameter("year")!=null){
 yy = request.getParameter("year");
mm =request.getParameter("month");}
 

 else{
   
    yy= Integer.toString(dd.get(Calendar.YEAR));
    mm= Integer.toString(dd.get(Calendar.MONTH)+1);
    System.out.println(yy+":"+mm);
 }

 System.out.println(mm);
 Map<String, String> calender = new HashMap<>();
 calender.put("memberid", memberid);
 calender.put("yy", yy);
 calender.put("mm", mm);
 List<Tcal> callist = commentSessionRepository.selectCalender(calender);

  System.out.println(callist);

 Map<String, String> map = new HashMap<>();
 for(int i =0; i<callist.size();i++){
   if(callist.get(i).getDd().startsWith("0")){
      map.put(callist.get(i).getDd().substring(1, 2),callist.get(i).getList());
       System.out.println(callist.get(i).getDd().substring(1, 2));
   }
    map.put(callist.get(i).getDd(),callist.get(i).getList());
 }

 System.out.println(map.get(1));
 System.out.println(map);
    request.setAttribute("map", map);
   //session.setAttribute("tcal", cal);
   
   
   //session.setAttribute("sf", sf);
   
   return "/view/board/calender.jsp";
}

public static String getCalview(int i , List<Tcal> tcal){
   String d = Tcal.isTwo(String.valueOf(i));
   String res = "";
   SimpleDateFormat sf = new SimpleDateFormat();
   for(Tcal tc : tcal){
      String day = sf.format(tc.getDcal());
      if(day.substring(0, 4).equals(d)){
         res+="<p>"+((tc.getList().length()>6)?(tc.getList().substring(0,6))+"...":(tc.getList()))+"</p>";
      }
   }
   return res;}

@RequestMapping(value="content",method=RequestMethod.GET)
public String content(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();
   session.setAttribute("writer",null);
   String memberid = request.getParameter("boardid");
   int num = Integer.parseInt(request.getParameter("num"));
   Map<String, Object> ct = new HashMap<String, Object>();
   ct.put("boardid", boardid);
   ct.put("num", num);
   commentSessionRepository.readcount(ct);
   BoardList list = commentSessionRepository.content(ct);
   session.setAttribute("boardid", boardid);
   session.setAttribute("num", request.getParameter("num"));
   if(list.getMemberid().equals((String)session.getAttribute("memberid"))){
      session.setAttribute("writer",1);
   }
   session.setAttribute("list", list);
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
   session.setAttribute("sf", sf);
   return "/view/board/content.jsp";
}

@RequestMapping(value="writeBoard",method=RequestMethod.GET)
public String writeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();

   return "/view/board/writeForm.jsp";
}
@RequestMapping(value="writePro",method=RequestMethod.POST)
public String writePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();
   String boardid = (String) session.getAttribute("boardid");
   String memberid = request.getParameter("memberid");
   String subject = request.getParameter("subject");
   String content = request.getParameter("content");
   Map<String , Object> map = new HashMap<>();
   map.put("boardid", boardid);
   map.put("memberid", memberid);
   map.put("subject", subject);
   map.put("content", content);
   map.put("boardid", boardid);
   commentSessionRepository.writePro(map);
   return "/view/board/writePro.jsp";
}

@RequestMapping(value="updateForm",method=RequestMethod.GET)
public String updateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();
   String boardid = (String) session.getAttribute("boardid");
   String num = (String) session.getAttribute("num");
   Map<String, Object> ct = new HashMap<String, Object>();
   ct.put("boardid", boardid);
   ct.put("num", num);
   BoardList list = commentSessionRepository.content(ct);
   session.setAttribute("list", list);
   
   return "/view/board/updateForm.jsp";
}
@RequestMapping(value="updatePro",method=RequestMethod.POST)
public String updatePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();
   String boardid = (String) session.getAttribute("boardid");
   String memberid = request.getParameter("memberid");
   String subject = request.getParameter("subject");
   String content = request.getParameter("content");
   String password = request.getParameter("password");
   int num = Integer.parseInt(request.getParameter("num"));
   System.out.println(password);
   if(password==null||password.isEmpty()){
   session.setAttribute("check", 1);
   return "/view/board/updatePro.jsp";
   }
   Map<String , Object> member = new HashMap<>();
   member.put("num", num);
   member.put("boardid", boardid);
   String pw = commentSessionRepository.updatecheck(member);
   System.out.println(pw);
   if(!pw.equals(password)){
      session.setAttribute("check", 2);
      return "/view/board/updatePro.jsp";
   }else {  
      Map<String , Object> map = new HashMap<>();
      map.put("boardid", boardid);
      map.put("memberid", memberid);
      map.put("subject", subject);
      map.put("content", content);
      map.put("boardid", boardid);
      map.put("num", num);
      commentSessionRepository.updatePro(map);
      session.setAttribute("check", 3);
      System.out.println(map);} 
      return "/view/board/updatePro.jsp";
   }
@RequestMapping(value="deleteForm",method=RequestMethod.GET)
public String deletForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();
   String boardid = (String) session.getAttribute("boardid");
   String num = (String) session.getAttribute("num");
   Map<String, Object> ct = new HashMap<String, Object>();
   ct.put("boardid", boardid);
   ct.put("num", num);
   BoardList list = commentSessionRepository.content(ct);
   session.setAttribute("list", list);
   
   return "/view/board/deleteForm.jsp";
}
@RequestMapping(value="deletePro",method=RequestMethod.POST)
public String deletePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();
   String boardid = (String) session.getAttribute("boardid");
   String password = request.getParameter("password");
   int num = Integer.parseInt(request.getParameter("num"));
   System.out.println(password);
   if(password==null||password.isEmpty()){
   session.setAttribute("check", 1);
   return "/view/board/deletePro.jsp";
   }
   Map<String , Object> member = new HashMap<>();
   member.put("num", num);
   member.put("boardid", boardid);
   String pw = commentSessionRepository.updatecheck(member);
   System.out.println(pw);
   if(!pw.equals(password)){
      session.setAttribute("check", 2);
      return "/view/board/deletePro.jsp";
   }else {  
       commentSessionRepository.deletePro(num);
      session.setAttribute("check", 3);
      
   } 
      return "/view/board/deletePro.jsp";
   }

@RequestMapping(value="addcal",method=RequestMethod.GET)
public String addcal(HttpServletRequest request, HttpServletResponse response) throws Exception {
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

   HttpSession session = request.getSession();
   String memberid = (String) session.getAttribute("memberid");
   String year = request.getParameter("year");
   String month = request.getParameter("month");
   String day = request.getParameter("day");
   Date dcal = sf.parse(year+"-"+month+"-"+day);
   session.setAttribute("dcal", sf.format(dcal));
   
   Tcal cal = new Tcal();
   cal.setMemberid(memberid);
   cal.setDcal(dcal);
    List list = commentSessionRepository.selectCalenderdaily(cal);
   
   session.setAttribute("list", list);
   return "/view/board/addcal.jsp";




}
@RequestMapping(value="addcalPro",method=RequestMethod.GET)
public String addcalPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
   String memberid = request.getParameter("memberid");
   
   String list = request.getParameter("list");
   Date dcal = sf.parse(request.getParameter("dcal"));
   System.out.println(dcal);
   Map<String , Object> calist = new HashMap<>();
   calist.put("memberid", memberid);
   calist.put("dcal", sf.format(dcal));
   calist.put("list", list);
   commentSessionRepository.addcal(calist);

   return "/view/board/addcalPro.jsp";




}

@RequestMapping(value="deletecal",method=RequestMethod.GET)
public String deletecal(HttpServletRequest request, HttpServletResponse response) throws Exception {
   HttpSession session = request.getSession();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
   String memberid = request.getParameter("memberid");
   String list = request.getParameter("list");
   Date dcal = sf.parse(request.getParameter("dcal"));
   System.out.println(dcal);
   
   Tcal cal = new Tcal();
   cal.setMemberid(memberid);
   cal.setDcal(dcal);
   cal.setList(list);
   commentSessionRepository.deletecal(cal);
   
   return "/view/board/deletecal.jsp";




}


}


