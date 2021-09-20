package com.khfinal.devstairs.user.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class UserDto {
	private String userid;
	private String userpw;
	private String username;
	private String stmessage;
	private String imgurl;
	private Date regdate;
	private String authkey;
	private int authstate;
	private String grade;
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public UserDto() {
		super();
	}
	public String getAuthkey() {
		return authkey;
	}
	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}
	public int getAuthstate() {
		return authstate;
	}
	public void setAuthstate(int authstate) {
		this.authstate = authstate;
	}
	public UserDto(String userid, String userpw, String username, String stmessage, String imgurl, Date regdate,
			String authkey, int authstate, String grade) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.stmessage = stmessage;
		this.imgurl = imgurl;
		this.regdate = regdate;
		this.authkey = authkey;
		this.authstate = authstate;
		this.grade = grade;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStmessage() {
		return stmessage;
	}
	public void setStmessage(String stmessage) {
		this.stmessage = stmessage;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
