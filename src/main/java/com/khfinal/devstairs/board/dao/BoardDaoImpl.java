package com.khfinal.devstairs.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.devstairs.board.dto.BoardDto;
import com.khfinal.devstairs.board.dto.CategoryDto;
import com.khfinal.devstairs.user.dto.TeamDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardDto> selectList(int b_teamcode) {
		List<BoardDto> list =  new ArrayList<BoardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "list", b_teamcode);
			
		} catch (Exception e) {
			System.out.println("[error] selectList");
			e.printStackTrace();
			
		}
		
		return list;
	}
	
	

	@Override
	public List<BoardDto> myList(String b_userid, int b_teamcode) {
		List<BoardDto> list = null;
		
		TeamDto dto = new TeamDto(b_teamcode, b_userid);
		
		try {
			list = sqlSession.selectList(NAMESPACE + "mylist", dto);
			
		} catch (Exception e) {
			System.out.println("[error] myList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BoardDto> CategoryList(int c_no, String b_userid, int b_teamcode) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		CategoryDto dto = new CategoryDto(c_no,b_userid,b_teamcode);
		try {
			list = sqlSession.selectList(NAMESPACE + "writetype", dto );
			
		} catch (Exception e) {
			System.out.println("[error] meetingList");
			e.printStackTrace();
		}
		
		return list;
	}



	@Override
	public BoardDto selectOne(int b_no) {
		BoardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectone", b_no);
			
		} catch (Exception e) {
			System.out.println("[error] selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
			System.out.println("insert 결과 :" + res);
			
		} catch (Exception e) {
			System.out.println("[error] Insert");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
			
		} catch (Exception e) {
			System.out.println("[error] Update");
			e.printStackTrace();
		} 
		
		return res;
	}

	@Override
	public int delete(int b_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", b_no);
			
		} catch (Exception e) {
			System.out.println("[error] Delete");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public void plusCnt(int b_no) {
		
		try {
			sqlSession.update(NAMESPACE + "pluscnt", b_no);
		} catch (Exception e) {
			System.out.println("[error] plusCnt");
			e.printStackTrace();
		}
		
	}

}
