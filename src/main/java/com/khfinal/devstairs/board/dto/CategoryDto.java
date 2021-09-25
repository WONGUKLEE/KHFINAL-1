package com.khfinal.devstairs.board.dto;

public class CategoryDto {
	private int c_no;
	private String b_userid;
	private int b_teamcode;
	public CategoryDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryDto(int c_no, String b_userid, int b_teamcode) {
		super();
		this.c_no = c_no;
		this.b_userid = b_userid;
		this.b_teamcode = b_teamcode;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getB_userid() {
		return b_userid;
	}
	public void setB_userid(String b_userid) {
		this.b_userid = b_userid;
	}
	public int getB_teamcode() {
		return b_teamcode;
	}
	public void setB_teamcode(int b_teamcode) {
		this.b_teamcode = b_teamcode;
	}
	
	
	
	

}
