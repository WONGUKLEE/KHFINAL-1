package com.khfinal.devstairs.board.biz;

import java.util.List;

import com.khfinal.devstairs.board.dto.BoardDto;

public interface BoardBiz {

	public List<BoardDto> selectList(int b_teamcode);
	
	public List<BoardDto> myList(BoardDto dto);
	
	public BoardDto selectOne(int b_no);
	
	public int insert(BoardDto dto);
	
	public int update(BoardDto dto);
	
	public int delete(int b_no);

	
}
