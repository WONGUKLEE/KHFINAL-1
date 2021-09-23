package com.khfinal.devstairs.board.dao;

import java.util.List;

import com.khfinal.devstairs.board.dto.BoardReplyDto;

public interface BoardReplyDao {
	
	String NAMESPACE="boardReply.";
	
	public List<BoardReplyDto> ReplyList (int br_no);
	
	public int ReplyWrite(BoardReplyDto dto);
	
	public int ReplyUpdate(BoardReplyDto dto);
	
	public int ReplyDelete(BoardReplyDto dto);

}
