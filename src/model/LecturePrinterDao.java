package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;


public class LecturePrinterDao extends AbstractRepository{
    private static LecturePrinterDao lecturePrinterDao = new LecturePrinterDao();
    public static LecturePrinterDao getInstance(){
        return lecturePrinterDao;
    }
    private LecturePrinterDao(){}
    
	private final String namespace = "toeicsite.mapper.LecturePrintMapper";

	
    public List<LecturePrinterDto> getAllLectures(){
    	System.out.println("getAllLectures 진입");
    	 List<LecturePrinterDto> lectures = null;
        SqlSession sqlsession = getSqlSessionFactory().openSession();
        try {
        	String statement = namespace+".getAllLectures";
        		lectures = sqlsession.selectList(statement);
        }catch(Exception e) {
        	e.printStackTrace();
        }finally {
        	sqlsession.close();
        }
        System.out.println(lectures);
        return lectures;
    }//DB전제의 강의를 가져오는 쿼리
	
	public List<LecturePrinterDto> getFilteredLectures(String memberid){
    	System.out.println("getFilteredLectures 진입-진입id:"+memberid);
    	List<LecturePrinterDto> lectures = null;
        SqlSession sqlsession = getSqlSessionFactory().openSession();
        try {
        	String statement = namespace+".getFilteredLectures";
        	lectures = sqlsession.selectList(statement, memberid);
        }catch(Exception e) {
        	e.printStackTrace();
        }finally {
        	sqlsession.close();
        }
        return lectures;
    }//수강중인 강의를 출혁하는 쿼리
    
    
    public List<LecturePrinterDto> getOtherLectures(String memberid){
       	System.out.println("getOtherLectures 진입-진입id:"+memberid);
    	List<LecturePrinterDto> lectures = null;
        SqlSession sqlsession = getSqlSessionFactory().openSession();
        try {
        	String statement = namespace+".getOtherLectures";
        	lectures = sqlsession.selectList(statement, memberid);
        }catch(Exception e) {
        	e.printStackTrace();
        }finally {
        	sqlsession.close();
        }
        return lectures;
    }
    
 
	public void insertLectures(String memberid, String[] purchased_lectures){
    	System.out.println("insertLectures에 진입하였음");
        List<LecturePrinterDto> lectures = new ArrayList<LecturePrinterDto>();
        OwnLecturePrinterDto dto = new OwnLecturePrinterDto();
        SqlSession sqlSession = getSqlSessionFactory().openSession();
        try {
            for(int i=0; i<purchased_lectures.length; i++) {
                System.out.println(memberid);
                System.out.println(purchased_lectures[i].toString());
                HashMap<String, String> map = new HashMap<String, String>();
                map.put("purchasedlectures", purchased_lectures[i].toString());
                map.put("memberid",memberid);
                System.out.println("purchasedlectures="+map.get("purchasedlectures"));
                System.out.println("memberid = "+map.get("memberid"));
                String statement = namespace+".checkRemain";
                dto = sqlSession.selectOne(statement, map);
                System.out.println("dto="+dto);
                if(dto==null) {
                	dto = new OwnLecturePrinterDto();
                	dto.setMemberid(map.get("memberid"));
                	dto.setPurchasedlectures(map.get("purchasedlectures"));
                	System.out.println("insertpart 진입");
                	System.out.println(dto.getMemberid()+"::"+dto.getPurchasedlectures());
                	System.out.println(map.get("purchasedlectures"));
                	System.out.println(map.get("memberid"));
                	statement = namespace+".insertlectures";
                	sqlSession.update(statement,map);
                	sqlSession.commit();
                	System.out.println(".insertlectures 가 실행되었음.");
                }
            }
        }finally {
        	sqlSession.close();
		}
    }
}
