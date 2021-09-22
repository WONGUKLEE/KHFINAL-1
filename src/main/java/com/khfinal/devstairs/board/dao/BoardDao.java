package com.khfinal.devstairs.board.dao;

import java.util.List;

import com.khfinal.devstairs.board.dto.BoardDto;

public interface BoardDao {
	
	String NAMESPACE = "board.";
	
	public List<BoardDto> selectList(int b_teamcode);
	
	public List<BoardDto> myList(BoardDto dto);
	
	public List<BoardDto> meetingList(BoardDto dto);

	public List<BoardDto> codeList(BoardDto dto);
	
	public List<BoardDto> etcList(BoardDto dto);
	
	public BoardDto selectOne(int b_no);
	
	public int insert(BoardDto dto);
	
	public int update(BoardDto dto);
	
	public int delete(int b_no);
	
	public void plusCnt(int b_no);
	
}
