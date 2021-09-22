package com.khfinal.devstairs.board.dto;

import java.util.Date;

public class BoardDto {
	private int b_no;
	private String b_userid;
	private int c_no;
	private int b_teamcode;
	private String b_title;
	private String b_content;
	private Date b_date;
	private String b_img;
	private String b_file;
	private int b_readcnt;
	private String b_category;
	private int b_likecnt;
	
	//기본 메소드
	public BoardDto() {
		super();
	}

	//매개변수 메소드
	public BoardDto(int b_no, String b_userid, int c_no, int b_teamcode, String b_title, String b_content, Date b_date,
			String b_img, String b_file, int b_readcnt, String b_category, int b_likecnt) {
		super();
		this.b_no = b_no;
		this.b_userid = b_userid;
		this.c_no = c_no;
		this.b_teamcode = b_teamcode;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_date = b_date;
		this.b_img = b_img;
		this.b_file = b_file;
		this.b_readcnt = b_readcnt;
		this.b_category = b_category;
		this.b_likecnt = b_likecnt;
	}

	//getter&setter
	public int getB_no() {
		return b_no;
	}


	public void setB_no(int b_no) {
		this.b_no = b_no;
	}


	public String getB_userid() {
		return b_userid;
	}


	public void setB_userid(String b_userid) {
		this.b_userid = b_userid;
	}


	public int getC_no() {
		return c_no;
	}


	public void setC_no(int c_no) {
		this.c_no = c_no;
	}


	public int getB_teamcode() {
		return b_teamcode;
	}


	public void setB_teamcode(int b_teamcode) {
		this.b_teamcode = b_teamcode;
	}


	public String getB_title() {
		return b_title;
	}


	public void setB_title(String b_title) {
		this.b_title = b_title;
	}


	public String getB_content() {
		return b_content;
	}


	public void setB_content(String b_content) {
		this.b_content = b_content;
	}


	public Date getB_date() {
		return b_date;
	}


	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}


	public String getB_img() {
		return b_img;
	}


	public void setB_img(String b_img) {
		this.b_img = b_img;
	}


	public String getB_file() {
		return b_file;
	}


	public void setB_file(String b_file) {
		this.b_file = b_file;
	}


	public int getB_readcnt() {
		return b_readcnt;
	}


	public void setB_readcnt(int b_readcnt) {
		this.b_readcnt = b_readcnt;
	}


	public String getB_category() {
		return b_category;
	}


	public void setB_category(String b_category) {
		this.b_category = b_category;
	}


	public int getB_likecnt() {
		return b_likecnt;
	}


	public void setB_likecnt(int b_likecnt) {
		this.b_likecnt = b_likecnt;
	}
	
	
}
