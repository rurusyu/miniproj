package org.impel.service;

import java.util.List;

import javax.inject.Inject;

import org.impel.domain.BoardVO;
import org.impel.domain.Criteria;
import org.impel.persistence.BoardDAO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;
	
	@Override
	public List<BoardVO> listAll(Criteria cri) throws Exception {
		
		
		return dao.list(cri);
		
	}

	@Override
	public void regist(BoardVO vo) throws Exception {
		
		dao.insert(vo);

	}

	@Override
	public BoardVO read(int bno) throws Exception {
		
		return dao.read(bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		
		dao.update(vo);
	}

	@Override
	public void remove(int bno) throws Exception {
			dao.delete(bno);

	}

	@Override
	public int getCountList(Criteria cri) throws Exception {
	
		return dao.listCount(cri);
	}



}
