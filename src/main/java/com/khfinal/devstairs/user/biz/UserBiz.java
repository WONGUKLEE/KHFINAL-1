package com.khfinal.devstairs.user.biz;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.khfinal.devstairs.user.dao.UserDao;
import com.khfinal.devstairs.user.dto.InviteTeamDto;
import com.khfinal.devstairs.user.dto.TeamCodeDto;
import com.khfinal.devstairs.user.dto.TeamDto;
import com.khfinal.devstairs.user.dto.UserDto;

@Service
public class UserBiz {

	@Autowired
	private UserDao dao;
	
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}
	public UserDto login(UserDto dto) {
		return dao.login(dto);
	}
	public int regist(UserDto dto) {
		return dao.regist(dto);
	}
	public int naverRegist(UserDto dto) {
		return dao.naverRegist(dto);
	}
	public UserDto selectOne(UserDto dto) {
		return dao.selectOne(dto);
	}
	public int uploadFile(MultipartFile file,String userid,String path) throws IOException {
		return dao.uploadFile(file,userid,path);
	}
	public int testlogin(UserDto dto) {
		return dao.testlogin(dto);
	}
	public int testupdate(UserDto dto) {
		return dao.testupdate(dto);
	}
	public int testDelete(UserDto dto) {
		return dao.testDelete(dto);
	}
	public int authkeyUpdate(UserDto dto) {
		return dao.authkeyUpdate(dto);
	}
	public int UserUpdate(UserDto dto) {
		return dao.UserUpdate(dto);
	}
	public int AdminNameUpdate(Map<String,String> map) {
		return dao.AdminNameUpdate(map);
	}
	public List<InviteTeamDto> inviteList(String userid){
		return dao.inviteList(userid);
	}
}
