package com.khfinal.devstairs.board.dto;

import java.util.Date;

public class BoardReplyDto {
	private int br_index;
	private int br_no;
	private String br_userid;
	private int br_teamcode;
	private String br_content;
	private Date br_date;
	public BoardReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardReplyDto(int br_index, int br_no, String br_userid, int br_teamcode, String br_content, Date br_date) {
		super();
		this.br_index = br_index;
		this.br_no = br_no;
		this.br_userid = br_userid;
		this.br_teamcode = br_teamcode;
		this.br_content = br_content;
		this.br_date = br_date;
	}
	public int getBr_index() {
		return br_index;
	}
	public void setBr_index(int br_index) {
		this.br_index = br_index;
	}
	public int getBr_no() {
		return br_no;
	}
	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}
	public String getBr_userid() {
		return br_userid;
	}
	public void setBr_userid(String br_userid) {
		this.br_userid = br_userid;
	}
	public int getBr_teamcode() {
		return br_teamcode;
	}
	public void setBr_teamcode(int br_teamcode) {
		this.br_teamcode = br_teamcode;
	}
	public String getBr_content() {
		return br_content;
	}
	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}
	public Date getBr_date() {
		return br_date;
	}
	public void setBr_date(Date br_date) {
		this.br_date = br_date;
	}
	
	
	

}
