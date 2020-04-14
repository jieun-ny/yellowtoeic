package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.Exam_LC;
import model.Exam_RC;
import model.Exam_user;


public class ExamRepository extends AbstractRepository{
	private final String namespace = "mybatis.dao.ExamMapper";
	private static ExamRepository instance = new ExamRepository();
	
	public static ExamRepository getInstance(){
		return instance;
	}
	
	public Exam_RC getExam(int exam_num){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".getExam";
			return (Exam_RC)sqlSession.selectOne(statement, exam_num);
		}finally{
			sqlSession.close();
		}
	}
	
	public int getExamCount(){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".getExamCount";
			return (int)sqlSession.selectOne(statement);
		}finally{
			sqlSession.close();
		}
	}
	
	public Integer insertExamUser(Exam_user examuser){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".insertExamUser";
			System.out.println(examuser.toString());
			int result = sqlSession.insert(statement, examuser);
			System.out.println("result : " + result);
			if(result > 0){
				sqlSession.commit();
				System.out.println("commit");
			}else{
				sqlSession.rollback();
				System.out.println("rollback");
			}
			return result;
		}finally{
			sqlSession.close();
		}
	}
	
	public List<Exam_RC> getAnswers_RC(int totalnum){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".getAnswers_RC";
			return sqlSession.selectList(statement, totalnum);
		}finally{
			sqlSession.close();
		}
	}
	
	public List<Exam_LC> getAnswers_LC(int totalnum){
		System.out.println("ttnum"+totalnum);
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".getAnswers_LC";
			System.out.println(1);
			return sqlSession.selectList(statement, totalnum);
		}finally{
			sqlSession.close();
		}
	}
	
	public int deleteUser() throws Exception{
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try{
			String statement = namespace + ".deleteuser";
			sqlSession.selectOne(statement);
			sqlSession.commit();
			return 1;
		}finally{
			sqlSession.close();
		}
		
	}
}
