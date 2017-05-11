package org.impel.controller;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.impel.persistence.TimeDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ConnectionTest {

	private static Logger logger = Logger.getLogger(ConnectionTest.class);
	
	@Autowired
	private DataSource ds;
	
	
	@Inject
	ApplicationContext ctx;//원시적으로 mybatis 끌어옴 sqlSessionFactory 이거 가져옴
	
	@Inject
	SqlSessionFactory sqlFactory;
	
	
	@Inject
	TimeDAO dao;
	

	@Test
	public void getTimeTest(){
		logger.info(dao.getTime());
		
	}
	
	@Test
	public void testLoading(){
		
		try {
			Connection con = ds.getConnection();
			logger.info(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
}
