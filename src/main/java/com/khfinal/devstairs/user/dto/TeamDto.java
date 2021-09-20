package com.khfinal.devstairs.user.dto;

import org.springframework.stereotype.Component;

@Component
public class TeamDto {

	private int teamcode;
	private String userid;
	public TeamDto() {
		super();
	}
	public TeamDto(int teamcode, String userid) {
		super();
		this.teamcode = teamcode;
		this.userid = userid;
	}
	public int getTeamcode() {
		return teamcode;
	}
	public void setTeamcode(int teamcode) {
		this.teamcode = teamcode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
}
