package org.impel.persistence;

import java.util.List;

import org.impel.domain.BoardVO;
import org.impel.domain.Criteria;

public interface BoardDAO {

	public List<BoardVO> list(Criteria cri) throws Exception;
	
	public void insert(BoardVO vo) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	
	public void update(BoardVO vo) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	public int listCount(Criteria cri) throws Exception;
	
}
