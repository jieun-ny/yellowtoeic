package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.AbstractRepository;
import model.dbBoardDataBean;

public class MybatisdbBoardDao extends AbstractRepository{
	
	private static MybatisdbBoardDao instance = new MybatisdbBoardDao();

	public static MybatisdbBoardDao getInstance() {
		return instance;
	}
	
	private final String namespace = "project.videoMapper";
	
	public int getArticleCount(String teacher,String subject_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Map map = new HashMap();
		map.put("teacher", teacher);
		map.put("subject_name", subject_name);
		try {
			String statement = namespace + ".getArticleCount";
			return sqlSession.selectOne(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<dbBoardDataBean> getArtcles(int startRow, int endRow,String teacher,String subject_name) {
		startRow = startRow - 1;
		endRow = endRow - startRow;
		Map map = new HashMap();
		map.put("teacher", teacher);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("subject_name", subject_name);
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArtcles";
			return sqlSession.selectList(statement, map);
			
		} finally {
			sqlSession.close();
		}
		}

	public void insertArticle(dbBoardDataBean article) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int num = 0;
		try {
				num = sqlSession.selectOne(namespace + ".insert_max");

				article.setNum(num);
				String statement = namespace + ".insert";
				sqlSession.insert(statement, article);
				sqlSession.commit();

		}  finally {
			sqlSession.close();
		}
	}
	
	public String getTime(int num, String student_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String dbid = "";
		String time = "0";
		Map map = new HashMap();
		map.put("num", num);
		map.put("student_id", student_id);
		try {
			String statement = namespace+".getId";
				dbid = sqlSession.selectOne(statement , map);
				if(dbid != null) {
				if (dbid.equals(student_id)) {
					String statement2 = namespace+".getTime";
						time= sqlSession.selectOne(statement2 , map);
			} }
				else {
				time="0";
			}
		} finally {
			sqlSession.close();
		}
		return time;
	}
	
	public String getVideo(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String filename = "";

		try {
			
				filename = sqlSession.selectOne(namespace + ".getFilename" , num);
		} finally {
			sqlSession.close();
		}
		return filename;
	}
	
	public void insertTime(String video_time,int num, String student_id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Map map = new HashMap();
		map.put("video_time", video_time);
		map.put("num", num);
		map.put("student_id", student_id);
		
		try {
			Map rmap  = sqlSession.selectOne(namespace + ".getnumid" , map);
			System.out.println(rmap);
			if (rmap != null ) {
				sqlSession.update(namespace+".timeupdate",map);
				sqlSession.commit();
			}else {
				sqlSession.insert(namespace+".timeinsert",map);
				sqlSession.commit();

		}} finally {
			sqlSession.close();
		}
	}
}
