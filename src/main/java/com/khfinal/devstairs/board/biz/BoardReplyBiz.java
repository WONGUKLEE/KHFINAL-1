package com.khfinal.devstairs.board.biz;

import java.util.List;

import com.khfinal.devstairs.board.dto.BoardReplyDto;

public interface BoardReplyBiz {
	
	public List <BoardReplyDto> ReplyList(int br_no);
	
	public int ReplyWrite(BoardReplyDto dto);
	
	public int ReplyUpdate(BoardReplyDto dto);
	
	public int ReplyDelete(BoardReplyDto dto);
	
	
	
}
