package model;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public abstract class AbstractRepository {//스태틱으로 있으면서 mapper-xml 파일을 읽는 작업을 함.
	private static SqlSessionFactory sqlSessionFactory;
	static {
		setSqlSessionFactory();//스택틱이음로 처음 부르면 일단 한번은 자동실행
	}
	private static void setSqlSessionFactory() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		}catch(IOException e) { 
			throw new IllegalArgumentException(e);
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	protected SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

}
