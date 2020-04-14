package model;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.ActionAnnotation;
import util.RequestMapping;

import util.RequestMapping.RequestMethod;


public class loginService extends ActionAnnotation{
	private static final String FORM_VIEW = "/nohead/loginindex.jsp";
	private final CommentSessionRepository commentSessionRepository = new CommentSessionRepository();
	private String trim(String str) {
		return str==null? null:str.trim();
		}
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String loginpage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = trim(request.getParameter("memberid"));
		String password = trim(request.getParameter("password"));
		Map<String,Boolean> errors = new HashMap<>();
		session.setAttribute("errors", errors);
		if(id==null||id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if(password==null||password.isEmpty())
			errors.put("password", Boolean.TRUE);

		if(!errors.isEmpty()){
			return FORM_VIEW;
		}

	session.invalidate();
		
		return "/nohead/loginindex.jsp";
	}
	
	
	@RequestMapping(value="loginPro",method=RequestMethod.POST)
	public String selectIdPw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id =request.getParameter("memberid");
		String password = request.getParameter("password");
		Map<String,Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		if(id==null||id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if(password==null||password.isEmpty())
			errors.put("password", Boolean.TRUE);
		Map<String, Object> member = new HashMap<String, Object>();
		member.put("memberid", id);
		member.put("password", password);
		System.out.println(member);
		Tmember li = commentSessionRepository.selectIdpassword(member);
		session.setAttribute("member", li);
		session.setAttribute("memberid", id);
		
		return "/view/loginpage/loginPro.jsp";
	}
	
	
	@RequestMapping(value="joinPro",method=RequestMethod.POST)
	public String joincheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id =request.getParameter("memberid");
		String password = request.getParameter("password");
		String name =request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-mm-dd");
		Date birthday = sf.parse(request.getParameter("birthday"));
		Map<String,Boolean> errors = new HashMap<>();
		session.setAttribute("errors", errors);
		if(id==null||id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if(password==null||password.isEmpty())
			errors.put("password", Boolean.TRUE);
		try{
		commentSessionRepository.selectduplicateId(id);
		}catch(util.DuplicateIdException e ){ 
			errors.put("duplicateId", Boolean.TRUE);
			}
		if(!errors.isEmpty()){
			return "/view/loginpage/joinForm.jsp";
		}
		Tmember tmember = new Tmember();
		tmember.setMemberId(id);
		tmember.setPassword(password);
		tmember.setName(name);
		tmember.setEmail(email);
		tmember.setPhone(phone);
		tmember.setAddress(address);
		tmember.setBirthday(birthday);
		System.out.println(tmember);
		
		try{
		commentSessionRepository.joinMember(tmember);
		return "/view/loginpage/joinSuccese.jsp";
		}catch(Exception e){
			session.setAttribute("error", 1);
		}
		
		return "/view/loginpage/joinForm.jsp";
	}
	
	
	@RequestMapping(value="join",method=RequestMethod.GET)
	public String join(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("join", 1);
		return "/view/loginpage/joinForm.jsp";
	}

	@RequestMapping(value="main",method=RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("join", 0);
		return "/view/main/main.jsp";
	}
	
	@Override
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
	}
	@RequestMapping(value="logOut",method=RequestMethod.GET)
	public String logOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "/view/loginpage/logoutPro.jsp";
	}
	

}


