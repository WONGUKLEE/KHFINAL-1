package com.khfinal.devstairs.user.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khfinal.devstairs.user.dto.InviteDto;
import com.khfinal.devstairs.user.dto.TeamCodeDto;
import com.khfinal.devstairs.user.dto.TeamDto;
import com.khfinal.devstairs.user.dto.UserDto;

@Repository
public class TeamDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="teammapper.";
	private String base_path = "";
	
	
	// 팀만드는 메소드(팀코드에)
		public int teammake(TeamCodeDto dto) {
			int res = 0;
			
			try {
				res = sqlSession.insert(namespace+"maketeam",dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return res;
		}
		
		// 팀코드 + 유저아이디로 팀에 유저넣기(팀테이블에)
		public int teaminsert(TeamDto dto) {
			int res = 0;
			
			try {
				res = sqlSession.insert(namespace+"teaminsert",dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return res;
		}
		// 팀 이름 중복체크 메소드
		public TeamCodeDto nameCheck(String teamname) {
			TeamCodeDto dto = null;
			
			try {
				dto = sqlSession.selectOne(namespace+"teamcheck",teamname);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return dto;
		}
		
		//이거 쓸지안쓸지 모르겠네요 그냥 유저가 무슨무슨팀에속해있는지 가져오는거
		public TeamDto teamselect(String userid) {
			TeamDto dto = null;
			
			try {
				dto= sqlSession.selectOne(namespace+"teamselect",userid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return dto;
		}
		
		// 유저아이디를 통해 속해있는 팀들 가져오기
		public List<TeamCodeDto> getTeamList(String userid) {
			List<TeamCodeDto> list = new ArrayList<TeamCodeDto>();
			
			try {
				list = sqlSession.selectList(namespace+"teamlist",userid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		//팀 멤버들의 정보를 가져오는 메소드
		public List<UserDto> memberlist(int teamcode){
			List<UserDto> list = new ArrayList<UserDto>();
			
			try {
				list = sqlSession.selectList(namespace+"memberlist",teamcode);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		//팀코드를 통해서 팀정보하나 가져오기
		public TeamCodeDto teaminfo(int teamcode) {
			TeamCodeDto dto = null;
			
			try {
				dto = sqlSession.selectOne(namespace+"teaminfo", teamcode);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return dto;
		}
		
		
		//검색을 통해서 userlist 불러오는 메소드
		public List<UserDto> searchUser(String email,String userid){
			List<UserDto> list = null;
			Map<String,String> map = new HashMap<String, String>();
			map.put("email",email);
			map.put("userid", userid);
			try {
				list = sqlSession.selectList(namespace+"searchUser", map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		//invite테이블에 팀원 추가하는 메소드
		public int inviteUser(InviteDto dto) {
			int res = 0;
			
			try {
				res = sqlSession.insert(namespace+"inviteUser",dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return res;
		}
		
		//invite테이블에 팀원 지우는거
		public int inviteDel(InviteDto dto) {
			int res = 0;
			
			try {
				res = sqlSession.delete(namespace+"inviteDel",dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return res;
		}
		// 팀원 추방메소드
		public int teamUserDel(String userid, int teamcode) {
			int res = 0;
			TeamDto dto = new TeamDto(teamcode,userid);
			try {
				res =sqlSession.delete(namespace+"teamUserDel",dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return res;
		}
		//워크스페이스 삭제 메소드
		public int workspaceDel(int teamcode) {
			int res = 0;
			
			try {
				res = sqlSession.delete(namespace+"workspaceDel",teamcode);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return res;
		}
}
