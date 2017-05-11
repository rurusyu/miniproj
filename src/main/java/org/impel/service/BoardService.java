package org.impel.service;

import java.util.List;

import org.impel.domain.BoardVO;
import org.impel.domain.Criteria;

public interface BoardService {

	public List<BoardVO> listAll(Criteria cri) throws Exception;
	
	public void regist(BoardVO vo) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	
	public void modify(BoardVO vo) throws Exception;
	
	public void remove(int bno) throws Exception;
	
	public int getCountList(Criteria cri) throws Exception;
	
}
