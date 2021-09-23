package com.khfinal.devstairs.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khfinal.devstairs.user.biz.TeamBiz;
import com.khfinal.devstairs.user.dto.InviteDto;
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
	public String makeWorkspace(TeamCodeDto dto,HttpSession session,Model model,@RequestParam(value="adduserid") String userid) {
		System.out.println("팀이름 잘넘어왔나 : " +dto.getTeamname());
		System.out.println("유저아이디 넘어온거 확인 : " + userid);
		String[] ids = null;
		if(userid.length()>25) {
			ids = userid.split(",");
			System.out.println(ids[0]);
		}
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
				if(ids!=null) {
					for(int i =0;i<ids.length;i++) {
						InviteDto idto = new InviteDto(ids[i],tcDto.getTeamcode());
						int res3= teambiz.inviteUser(idto);
						if(res3==0) {
							System.out.println("팀원초대 실패");
						}else {
							System.out.println("팀원초대 성공 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ");
						}
					}
				}else {
					InviteDto idto = new InviteDto(userid,tcDto.getTeamcode());
					int res3 = teambiz.inviteUser(idto);
					if(res3==0) {
						System.out.println("팀원초대 실패");
					}else {
						System.out.println("팀원초대 성공!!!!!!!!!!!!!!");
					}
				}
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
	
	@RequestMapping(value="addTeam.do",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Boolean> addTeam(int teamcode,HttpSession session){
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		boolean check = false;
		UserDto login = (UserDto)session.getAttribute("login");
		TeamDto tdto = new TeamDto(teamcode,login.getUserid());
		int res = teambiz.teaminsert(tdto);
		if(res>0) {
			int res2 = teambiz.inviteDel(new InviteDto(tdto.getUserid(),tdto.getTeamcode()));
			if(res2>0) {
				check = true;
			}
		}
		map.put("check", check);
		
		return map;
	}
	
	@RequestMapping(value="inviteDel.do", method= RequestMethod.POST)
	@ResponseBody
	public Map<String,Boolean> inviteDelete(int teamcode,HttpSession session){
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		boolean check = false;
		UserDto login = (UserDto)session.getAttribute("login");
		int res = teambiz.inviteDel(new InviteDto(login.getUserid(),teamcode));
		if(res>0) {
			check = true;
		}
		map.put("check", check);
		
		return map;
	}
	
	
	
	
	
}
