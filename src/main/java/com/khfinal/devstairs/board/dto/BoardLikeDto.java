package com.khfinal.devstairs.board.dto;

public class BoardLikeDto {
	
	private String bl_userid;
	private int bl_no;
	public BoardLikeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardLikeDto(String bl_userid, int bl_no) {
		super();
		this.bl_userid = bl_userid;
		this.bl_no = bl_no;
	}
	public String getBl_userid() {
		return bl_userid;
	}
	public void setBl_userid(String bl_userid) {
		this.bl_userid = bl_userid;
	}
	public int getBl_no() {
		return bl_no;
	}
	public void setBl_no(int bl_no) {
		this.bl_no = bl_no;
	}
	
	
}
