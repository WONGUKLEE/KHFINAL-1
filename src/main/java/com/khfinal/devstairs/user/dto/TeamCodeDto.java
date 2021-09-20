package com.khfinal.devstairs.user.dto;

import org.springframework.stereotype.Component;

@Component
public class TeamCodeDto {
	private int teamcode;
	private String teamname;
	private String teamlogo;
	private String admin;
	public TeamCodeDto() {
		super();
	}
	public TeamCodeDto(int teamcode, String teamname, String teamlogo,String admin) {
		super();
		this.teamcode = teamcode;
		this.teamname = teamname;
		this.teamlogo = teamlogo;
		this.admin = admin;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public int getTeamcode() {
		return teamcode;
	}
	public void setTeamcode(int teamcode) {
		this.teamcode = teamcode;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public String getTeamlogo() {
		return teamlogo;
	}
	public void setTeamlogo(String teamlogo) {
		this.teamlogo = teamlogo;
	}
	
	
}
