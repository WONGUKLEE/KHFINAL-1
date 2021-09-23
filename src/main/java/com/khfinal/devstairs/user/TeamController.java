package com.khfinal.devstairs.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.devstairs.user.biz.TeamBiz;
import com.khfinal.devstairs.user.dto.TeamCodeDto;
import com.khfinal.devstairs.user.dto.TeamDto;
import com.khfinal.devstairs.user.dto.UserDto;

@Controller
public class TeamController {
	
	@Autowired
	private TeamBiz teambiz;
	
	
	@RequestMapping("/teammakeform.do")
	public String teammakeform() {
		return "build-workspace";
	}
	
	@RequestMapping(value ="/teamnamecheck.do",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Boolean> namecheck(String teamname){
		System.out.println(teamname);
		TeamCodeDto res = teambiz.nameCheck(teamname);
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		boolean check = false;
		if(res!=null) {
			check = true;
			map.put("check", check);
		}else {
			map.put("check", check);
		}
		
		
		return map;
	}
	
	@RequestMapping("/workspace.do")
	public String workspace(int teamcode,HttpSession session,Model model) {
		System.out.println("teamcode : " + teamcode);
		UserDto login = (UserDto) session.getAttribute("login");
		List<TeamCodeDto> teamlist = teambiz.getTeamList(login.getUserid());
		List<UserDto> memberlist = teambiz.memberlist(teamcode);
		TeamCodeDto teaminfo = teambiz.teaminfo(teamcode);
		model.addAttribute("login", login);
		model.addAttribute("teamlist", teamlist);
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("teaminfo", teaminfo);
		
		
		return "workspace-home";
	}
	
	@RequestMapping(value= "/makeWorkspace.do")
	public String makeWorkspace(TeamCodeDto dto,HttpSession session,Model model) {
		System.out.println("팀이름 잘넘어왔나 : " +dto.getTeamname());
		UserDto login = (UserDto) session.getAttribute("login");
		dto.setAdmin(login.getUsername());
		int res = teambiz.teammake(dto);
		if(res>0) {
			System.out.println("팀생성 성공");
			TeamCodeDto tcDto = teambiz.nameCheck(dto.getTeamname());
			TeamDto tDto = new TeamDto(tcDto.getTeamcode(),login.getUserid());
			int res2= teambiz.teaminsert(tDto);
			if(res2>0) {
				System.out.println("팀에 인원넣었음");
				return "redirect:start.do";
			}
		}
		return "redirect:teammakeform.do";
	}
	
	@RequestMapping(value="/userCheck.do",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<UserDto> searchUserList(String email,HttpSession session){
		UserDto dto = (UserDto) session.getAttribute("login");
		String userid = dto.getUserid();
		List<UserDto> list = new ArrayList<UserDto>();
		list = teambiz.searchUser(email,userid);

		
		
		return list;
		
	}
	
	
	
	
}
