package com.khfinal.devstairs.board.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.devstairs.board.dao.BoardDao;
import com.khfinal.devstairs.board.dto.BoardDto;
import com.khfinal.devstairs.board.dto.BoardLikeDto;

@Service
public class BoardBizImpl implements BoardBiz{
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardDto> selectList(int b_teamcode) {
		
		return dao.selectList(b_teamcode);
	}

	@Override
	public List<BoardDto> myList(String b_userid, int b_teamcode) {
	
		return dao.myList(b_userid, b_teamcode);
		
	}
	
	@Override
	public List<BoardDto> CategoryList(int c_no, String b_userid, int b_teamcode) {
		
		return dao.CategoryList(c_no, b_userid, b_teamcode);
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
	public int delete(int b_no) {
		
		return dao.delete(b_no);
	}

	@Override
	public int wishadd(BoardLikeDto dto) {
		return dao.wishadd(dto);
	}

	@Override
	public List<BoardLikeDto> getWishList(String userid) {
		return dao.getWishList(userid);
	}

	@Override
	public int wishdel(BoardLikeDto dto) {
		return dao.wishdel(dto);
	}

	
}




	

