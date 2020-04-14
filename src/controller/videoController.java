package controller;

import java.io.File;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MybatisdbBoardDao;
import dao.dbBoardDao;
import model.dbBoardDataBean;
import util.ActionAnnotation;
import util.RequestMapping;
import util.RequestMapping.RequestMethod;;

public class videoController extends ActionAnnotation {

	@Override
	public void initProcess(HttpServletRequest request, HttpServletResponse response) {
		
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String video_list(HttpServletRequest request, HttpServletResponse res) {
		HttpSession session = request.getSession();
		int pageSize = 8;

		String pageNum = request.getParameter("pageNum");
		String teacher = request.getParameter("teacher");
		String subject_name = request.getParameter("subject_name");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = 0;
		try {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
			session.setAttribute("pageNum", currentPage);
		} catch (Exception e) {
			if (session.getAttribute("pageNum") == null) {
				session.setAttribute("pageNum", 1);
			}
		}

		currentPage = (int) session.getAttribute("pageNum");
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		//int endRow = currentPage * pageSize;
		
		MybatisdbBoardDao service = MybatisdbBoardDao.getInstance();
		int count = service.getArticleCount(teacher,subject_name);

		List li = service.getArtcles(startRow, endRow,teacher,subject_name);
		
		int number = count - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("li", li);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("subject_name", subject_name);
		request.setAttribute("teacher", teacher);
		
		return "/view/video/videolist.jsp";
	}
	
	@RequestMapping(value = "content", method = RequestMethod.GET)
	public String videocon_content(HttpServletRequest request, HttpServletResponse res) {
		int num = Integer.parseInt(request.getParameter("num"));
        String student_id = request.getParameter("student_id");
        int count = Integer.parseInt(request.getParameter("count"));
        MybatisdbBoardDao dbPro = MybatisdbBoardDao.getInstance();
        double time = Double.parseDouble(dbPro.getTime(num, student_id));
        String filename = dbPro.getVideo(num);
        
        request.setAttribute("time", time);
        request.setAttribute("filename", filename);
        request.setAttribute("num", num);
        request.setAttribute("count", count);
        request.setAttribute("student_id", student_id);
        
        return "/view2/videocon/test2.jsp";
	}
	@RequestMapping(value = "writeForm", method = RequestMethod.GET)
	public String videocon_writeForm(HttpServletRequest request, HttpServletResponse res) {
		int num=0;
		
		request.setAttribute("num", num);
		
		return "/view2/videocon/videowriteForm.jsp";
	}
	@RequestMapping(value = "writePro", method = RequestMethod.POST)
	public String video_writePro(HttpServletRequest request, HttpServletResponse res) {
		
		String realFolder = "";
		String saveFolder = "uploadFile";
		String encType = "utf-8";
		int maxSize =  1000 * 1024 * 1024;
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);
		try {
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			
			dbBoardDataBean article = new dbBoardDataBean();
			
			Enumeration files = multi.getFileNames();

			if (files.hasMoreElements()) {
				String name = (String) files.nextElement();
				File file = multi.getFile(name);
				if (file != null) {
					article.setFilename(file.getName());
				} else {
					article.setFilename("");
				}
			}
			article.setNum(Integer.parseInt(multi.getParameter("num")));
			article.setTeacher(multi.getParameter("teacher"));
			article.setSubject_name(multi.getParameter("subject_name"));
			article.setClass_name(multi.getParameter("class_name"));

			MybatisdbBoardDao service = MybatisdbBoardDao.getInstance();
			service.insertArticle(article);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/view/loginpage/mypagelist.jsp";
	}
	@RequestMapping(value = "timePro", method = RequestMethod.GET)
	public String videocon_timePro(HttpServletRequest request, HttpServletResponse res) {
		
		String video_time=request.getParameter("time");
		int num = Integer.parseInt(request.getParameter("num"));
		int count = Integer.parseInt(request.getParameter("count"));
		if(count == 0) {
			count = count +1;
		}else {
			count = 1;
		}
		String student_id = request.getParameter("student_id");
		MybatisdbBoardDao dbPro = MybatisdbBoardDao.getInstance();
		dbPro.insertTime(video_time, num, student_id);
		
		request.setAttribute("num", num);
		request.setAttribute("count", count);
		request.setAttribute("student_id", student_id);
		
		return "/view2/videocon/timePro.jsp";
	}
}
