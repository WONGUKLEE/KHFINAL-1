package com.khfinal.devstairs.user.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khfinal.devstairs.user.dao.TeamDao;
import com.khfinal.devstairs.user.dto.InviteDto;
import com.khfinal.devstairs.user.dto.TeamCodeDto;
import com.khfinal.devstairs.user.dto.TeamDto;
import com.khfinal.devstairs.user.dto.UserDto;

@Service
public class TeamBiz {
	
	@Autowired
	private TeamDao dao;
	
	public int teammake(TeamCodeDto dto) {
		return dao.teammake(dto);
	}
	public int teaminsert(TeamDto dto) {
		return dao.teaminsert(dto);
	}
	public TeamCodeDto nameCheck(String teamname) {
		return dao.nameCheck(teamname);
	}
	public TeamDto teamselect(String userid) {
		return dao.teamselect(userid);
	}
	public List<TeamCodeDto> getTeamList(String userid){
		return dao.getTeamList(userid);
	}
	
	public List<UserDto> memberlist(int teamcode){
		return dao.memberlist(teamcode);
	}
	
	public TeamCodeDto teaminfo(int teamcode) {
		return dao.teaminfo(teamcode);
	}
	public List<UserDto> searchUser(String email,String userid){
		return dao.searchUser(email,userid);
	}
	public int inviteUser(InviteDto dto) {
		return dao.inviteUser(dto);
	}
	public int inviteDel(InviteDto dto) {
		return dao.inviteDel(dto);
	}
	public int teamUserDel(String userid, int teamcode) {
		return dao.teamUserDel(userid, teamcode);
	}
	public int workspaceDel(int teamcode) {
		return dao.workspaceDel(teamcode);
	}
}
