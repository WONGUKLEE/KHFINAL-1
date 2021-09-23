package com.khfinal.devstairs.board.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.devstairs.board.dao.BoardDao;
import com.khfinal.devstairs.board.dto.BoardDto;

@Service
public class BoardBizImpl implements BoardBiz{
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardDto> selectList(int b_teamcode) {
		
		return dao.selectList(b_teamcode);
	}


	@Override
	public List<BoardDto> myList(BoardDto dto) {
		
		return dao.myList(dto);
	}



	@Override
	public BoardDto selectOne(int b_no) {
			   dao.plusCnt(b_no);
		return dao.selectOne(b_no);
	}

	@Override
	public int insert(BoardDto dto) {
		
		return dao.insert(dto);
	}

	@Override
	public int update(BoardDto dto) {
		
		return dao.update(dto);
	}

	@Override
	public int delete(BoardDto dto) {
		
		return dao.delete(dto);
	}

	
}
