package model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sun.javafx.collections.MappingChange.Map;

public class FeedBackDao extends AbstractRepository{
    private static FeedBackDao feedBackDao = new FeedBackDao();
    public static FeedBackDao getInstance(){
        return feedBackDao;
    }
    private FeedBackDao(){}
    
    private final String namespace = "toeicsite.mapper.FeedbackMapper";
    
    public List<FeedBackDto> getAllFeedbacks(){
    	System.out.println("getAllFeedbacks 진입");
   	    List<FeedBackDto> feedbacks = null;
       SqlSession sqlsession = getSqlSessionFactory().openSession();
       try {
       	String statement = namespace+".getAllFeedbacks";
       	feedbacks = sqlsession.selectList(statement);
       }catch(Exception e) {
       	e.printStackTrace();
       }finally {
       	sqlsession.close();
       }
       System.out.println(feedbacks);
       return feedbacks;
    }
    
    public List<FeedBackDto> insertFeedback(FeedBackDto dto){
        System.out.println("insertFeedback 진입");
        List<FeedBackDto> feedbacks = null;
        SqlSession sqlsession = getSqlSessionFactory().openSession();
        HashMap<String,String> map = new HashMap<String,String> ();
        try {
            String statement = namespace+".insertFeedback";
            System.out.println(dto.getMember_id());
            System.out.println(dto.getContent());
            map.put("memberid", dto.getMember_id());
            map.put("content",dto.getContent());
            sqlsession.insert(statement,map);
            sqlsession.commit();
            System.out.println("getAllFeedbacks 시작");
             statement = namespace+".getAllFeedbacks";
            feedbacks = sqlsession.selectList(statement);
            sqlsession.close();
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            sqlsession.close();
        }
        System.out.println(feedbacks);
        return feedbacks;
    }
    
    public List<FeedBackDto> getThreeFeedbacks(Long RowCnt){
    	System.out.println("getThreeFeedbacks 진입");
		    List<FeedBackDto> feedbacks = null;
	   SqlSession sqlsession = getSqlSessionFactory().openSession();
	   try {
	   	String statement = namespace+".getThreeFeedback";
	   	feedbacks = sqlsession.selectList(statement, RowCnt);
	   }catch(Exception e) {
	   	e.printStackTrace();
	   }finally {
	   	sqlsession.close();
	   }
	   System.out.println(feedbacks);
	   return feedbacks;
    }
    
    

}
