package com.khfinal.devstairs.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.khfinal.devstairs.board.dto.BoardReplyDto;

public class BoardReplyDaoImpl implements BoardReplyDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardReplyDto> ReplyList(int br_no) {
		 List<BoardReplyDto> list = new ArrayList<BoardReplyDto>();
		 
		 
		try {
			
			list = sqlSession.ReplyList(NAMESPACE+"ReplyList",br_no);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("");
		}
		
		
		return list;
	}

	@Override
	public String ReplyWrite(BoardReplyDto dto) {
		int res =0;
		
		
		try {
			
			res = sqlSession.ReplyWrite(NAMESPACE+"ReplyWrite",dto){
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("REPLYWRITE 에러");
		}
		System.out.println(res);	
	
		
	}

	@Override
	public String ReplyUpdate(BoardReplyDto dto) {
		int res =0;
		
		try {
			
			res= sqlSession.Update(NAMESPACE+"ReplyUpdate",dto){
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("REPLYUPDATE 에러");
		}
			System.out.println(res);
	}

	@Override
	public int ReplyDelete(BoardReplyDto dto) {
		int res =0;
		
		try {
			
			res=sqlSession.Delete(NAMESPACE+"ReplyDelete",dto){
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("REPLYDELETE 에러");
			
		}
		
		System.out.println(res);
		}
	
	}
	}

	
