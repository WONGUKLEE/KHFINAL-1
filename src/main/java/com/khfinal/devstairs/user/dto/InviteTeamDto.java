package com.khfinal.devstairs.user.dto;

public class InviteTeamDto {
	private String userid;
	private String teamname;
	private int teamcode;
	public InviteTeamDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InviteTeamDto(String userid, String teamname, int teamcode) {
		super();
		this.userid = userid;
		this.teamname = teamname;
		this.teamcode = teamcode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public int getTeamcode() {
		return teamcode;
	}
	public void setTeamcode(int teamcode) {
		this.teamcode = teamcode;
	}

	
}
