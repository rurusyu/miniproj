package org.impel.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TimeDAO {

	public static final String namespace = "org.impel.persistence.TimeDAO";
	
	@Inject
	SqlSession sess;
	
	public String getTime(){
		return sess.selectOne(namespace+".getTime");
	}
	
}
