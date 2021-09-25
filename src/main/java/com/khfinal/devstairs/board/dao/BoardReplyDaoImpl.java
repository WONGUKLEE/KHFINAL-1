package com.khfinal.devstairs.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.devstairs.board.dto.BoardReplyDto;

@Repository
public class BoardReplyDaoImpl implements BoardReplyDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardReplyDto> ReplyList(int br_no) {
		 List<BoardReplyDto> list = new ArrayList<BoardReplyDto>();
		 
		 
		try {
			
			list = sqlSession.selectList(NAMESPACE+"ReplyList",br_no);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		return list;
	}

	@Override
	public int ReplyWrite(BoardReplyDto dto) {
		int res =0;
		
		
		try {
			
			res = sqlSession.insert(NAMESPACE+"ReplyWrite",dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR : replywrite");
		}
		System.out.println(res);	
	
		return res;
	}

	@Override
	public int ReplyUpdate(BoardReplyDto dto) {
		int res =0;
		
		try {
			
			res= sqlSession.update(NAMESPACE+"ReplyUpdate",dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR: replyupdate");
		}
			System.out.println(res);
			return res;
	}

	@Override
	public int ReplyDelete(BoardReplyDto dto) {
		int res =0;
		
		try {
			
			res=sqlSession.delete(NAMESPACE+"ReplyDelete",dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR: replydelete");
			
		}
		
		System.out.println(res);
		
		return res;
	
	}
}

	
