package org.impel.controller;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.impel.domain.BoardVO;
import org.impel.persistence.BoardDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDAOTest {

	private static Logger logger = Logger.getLogger(ConnectionTest.class);
	
	@Inject
	BoardDAO dao;
	
	@Test
	public void listAllTest() throws Exception{
		dao.list();
		
		
	
		
	}
	
}
