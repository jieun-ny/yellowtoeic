package model;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CommentSessionRepository {
private final String namespace = "project.loginMapper";
private final String namespace2 = "project.CommentMapper";
private SqlSessionFactory getSqlSessionFactory(){
	String resource = "mybatis-config.xml";
	InputStream inputStream;
	try{
		inputStream = Resources.getResourceAsStream(resource);
	}catch(IOException e){
		throw new IllegalArgumentException(e);
	}
	return new SqlSessionFactoryBuilder().build(inputStream);
}

public Tmember selectMemberBymemberid (String member){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	try{
		return sqlSession.selectOne(namespace+".selectMemberBymemberid",member);
	}finally{
		sqlSession.close();
	}}

public BoardList selectCommentByPrimarykey (int num){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	try{
		return sqlSession.selectOne(namespace+".selectCommentByPrimarykey",num);
	}finally{
		sqlSession.close();
	}}


	
public List<BoardList> selectCommentBymemberid(Map<String,Object> member){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		return sqlSession.selectList(namespace2+".selectCommentBymemberid",member);
	}finally{
		sqlSession.close();
	}
}
public List<BoardList> selectCommentByboardid(int startRow, int endRow,String boardid){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	startRow = startRow - 1;
	endRow = endRow - startRow;
	Map map = new HashMap();
	map.put("startRow", startRow);
	map.put("endRow", endRow);
	map.put("boardid", boardid);
	try{
		return sqlSession.selectList(namespace2+".selectCommentByboardid",map);
	}finally{
		sqlSession.close();
	}
	
	
	
}	

public int countAllbyboardid(String boardid){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		return (int) sqlSession.selectOne(namespace2+".countAllbyboardid",boardid);
	}finally{
		sqlSession.close();
	}
}	

public Integer joinMember(Tmember tmemeber){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		String statment = namespace+".joinMember";
		int result = sqlSession.insert(statment,tmemeber);
		if(result>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}finally{
		
		sqlSession.close();
	}
}
public Integer updateMember(Tmember tmemeber){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		String statment = namespace+".updateMember";
		int result = sqlSession.update(statment,tmemeber);
		if(result>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}finally{
		
		sqlSession.close();
	}
}

public Integer deleteMember(Tmember tmemeber){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		String statment = namespace+".updateMember";
		int result = sqlSession.delete(statment,tmemeber);
		if(result>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}finally{
		
		sqlSession.close();
	}
}

public List<Reply> selectAllReply(String boardid){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		return sqlSession.selectList(namespace2+".selectAllReply",boardid);
	}finally{
		sqlSession.close();
	}
}

public Integer insertReply(Reply reply){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		String statment = namespace2+".insertReply";
		int result = sqlSession.insert(statment,reply);
		if(result>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}finally{
		
		sqlSession.close();
	}
}


public Tmember selectIdpassword(Map<String, Object> member){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		System.out.println("============"+member);
		return sqlSession.selectOne(namespace+".selectIdpassword",member);
	} catch (Exception e) { 
		e.printStackTrace();
		return null;
	}
	
	finally{
		sqlSession.close();
	}
	
	
}

public Tmember selectduplicateId(String id){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		return sqlSession.selectOne(namespace+".selectduplicateId",id);
	} catch (Exception e) { 
		e.printStackTrace();
		return null;
	}
	
	finally{
		sqlSession.close();
	}
	
	
}



public Integer insertDday(Tmember member){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		String statment = namespace2+".insertDday";
		int result = sqlSession.insert(statment,member);
		if(result>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}finally{
		
		sqlSession.close();
	}
}
public List<Tcal> selectCalender(Map<String, String> calender){
	
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		return sqlSession.selectList(namespace+".selectCalender",calender);
	}finally{
		sqlSession.close();
	}
}

public List<Tcal> selectCalenderdaily(Tcal cal){
	
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		return sqlSession.selectList(namespace+".selectCalenderdaily",cal);
	}finally{
		sqlSession.close();
	}
}


public Integer deletecal(Tcal cal){
	
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	int result;
	try{
		result = sqlSession.delete(namespace+".deletecal",cal);
		sqlSession.commit();
	}finally{
		sqlSession.close();
	}
	return result;
}
public List<Tcal> selectCalender2(Map<String, String> calender){
	
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		return sqlSession.selectList(namespace+".selectCalender2",calender);
	}finally{
		sqlSession.close();
	}
}

public BoardList content(Map<String, Object> ct) {
	SqlSession sqlSession = getSqlSessionFactory().openSession();

	try{
		return sqlSession.selectOne(namespace2+".content",ct);
	}finally{
		sqlSession.close();
	}
}


public Integer readcount(Map<String, Object> conlist) {
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	int result;
	try{
		result =  sqlSession.update(namespace2+".readcount",conlist);
		
		if(result>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}finally{
		
		sqlSession.close();
	}
}
public Integer writePro(Map<String, Object> board){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	int result;
	try{
		result=sqlSession.insert(namespace2+".writePro",board);
		if(result>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}finally{
		
		sqlSession.close();
	}
}
public Integer updatePro(Map<String, Object> board){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		String statment = namespace2+".updatePro";
		int result = sqlSession.update(statment,board);
		if(result>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}finally{
		
		sqlSession.close();
	}
	
}
public String updatecheck(Map<String, Object> ct) {
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	String result;
	try{
		result = sqlSession.selectOne(namespace2+".updatecheck",ct);
	}finally{
		sqlSession.close();
	}
	return result;
}
public Integer deletePro(int num){
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	
	try{
		String statment = namespace2+".deletePro";
		int result = sqlSession.delete(statment,num);
		if(result>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}finally{
		
		sqlSession.close();
	}
	
}
public Integer selectAvarge(String boardid ) {
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	int result;
	try{
		result = sqlSession.selectOne(namespace2+".selectAvarge",boardid);
	}finally{
		sqlSession.close();
	}
	return result;
}

public Integer addcal(Map<String, Object> calist) {
	SqlSession sqlSession = getSqlSessionFactory().openSession();
	int result;
	try{
		result=sqlSession.insert(namespace2+".addcal",calist);
		if(result>0){
			sqlSession.commit();
		}else{
			sqlSession.rollback();
		}
		return result;
	}finally{
		
		sqlSession.close();
	}
	
}


}