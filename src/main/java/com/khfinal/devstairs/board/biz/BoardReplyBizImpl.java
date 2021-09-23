package com.khfinal.devstairs.board.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.khfinal.devstairs.board.dao.BoardReplyDao;
import com.khfinal.devstairs.board.dto.BoardReplyDto;

public class BoardReplyBizImpl implements BoardReplyBiz {

	@Autowired
	private BoardReplyDao dao;
	@Override
	public List<BoardReplyDto> ReplyList(int br_no) {
	
		return dao.ReplyList(br_no);
	}

	@Override
	public int ReplyWrite(BoardReplyDto dto) {
		
		return dao.ReplyWrite(dto);
	}

	@Override
	public int ReplyUpdate(BoardReplyDto dto) {
		
		return dao.ReplyUpdate(dto);
	}

	@Override
	public int ReplyDelete(BoardReplyDto dto) {
		
		return dao.ReplyDelete(dto);
	}



	

}
