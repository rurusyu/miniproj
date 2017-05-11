package org.impel.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.impel.domain.BoardVO;
import org.impel.domain.Criteria;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	public static final String namespace = "org.impel.persistence.BoardDAO";
	
	@Inject
	SqlSession sess;
	
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		
		return sess.selectList(namespace+".listAll", cri);
	}

	@Override
	public void insert(BoardVO vo) throws Exception {
		
		sess.insert(namespace+".insert", vo);

	}

	@Override
	public BoardVO read(int bno) throws Exception {
		
		return sess.selectOne(namespace +".read", bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
	
		sess.update(namespace+".update", vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		sess.delete(namespace+".delete", bno);
	}

	@Override
	public int listCount(Criteria cri) throws Exception {
		
		return sess.selectOne(namespace + ".listCount", cri);
	}

}
