package com.khfinal.devstairs.user.dto;

import org.springframework.stereotype.Component;

@Component
public class InviteDto {
	private String userid;
	private int teamcode;
	public InviteDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InviteDto(String userid, int teamcode) {
		super();
		this.userid = userid;
		this.teamcode = teamcode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getTeamcode() {
		return teamcode;
	}
	public void setTeamcode(int teamcode) {
		this.teamcode = teamcode;
	}
	
	
}
