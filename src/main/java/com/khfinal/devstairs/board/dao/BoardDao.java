package com.khfinal.devstairs.board.dao;

import java.util.List;

import com.khfinal.devstairs.board.dto.BoardDto;
import com.khfinal.devstairs.board.dto.CategoryDto;

public interface BoardDao {
	
	String NAMESPACE = "board.";
	
	public List<BoardDto> selectList(int b_teamcode);
	
	public List<BoardDto> myList(String b_userid, int b_teamcode);

	public List<BoardDto> CategoryList(int c_no, String b_userid, int b_teamcode);

	public BoardDto selectOne(int b_no);
	
	public int insert(BoardDto dto);
	
	public int update(BoardDto dto);
	
	public int delete(int b_no);
	
	public void plusCnt(int b_no);
	
}
