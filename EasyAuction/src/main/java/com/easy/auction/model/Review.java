package com.easy.auction.model;

import org.springframework.web.multipart.MultipartFile;

public class Review {

	private int er_num;
	private String em_id;
	private String er_pass;
	private String er_kind;
	private String er_itemnum;
	private String er_itemname;
	private String er_sub;
	private String er_cont;
	private int er_hit;
	private MultipartFile uploadfile;

	private String er_file;
	private String er_original;
	private String er_date;

	private int rnum;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getEr_num() {
		return er_num;
	}

	public void setEr_num(int er_num) {
		this.er_num = er_num;
	}

	public String getEm_id() {
		return em_id;
	}

	public void setEm_id(String em_id) {
		this.em_id = em_id;
	}

	public String getEr_pass() {
		return er_pass;
	}

	public void setEr_pass(String er_pass) {
		this.er_pass = er_pass;
	}

	public String getEr_kind() {
		return er_kind;
	}

	public void setEr_kind(String er_kind) {
		this.er_kind = er_kind;
	}

	public String getEr_itemnum() {
		return er_itemnum;
	}

	public void setEr_itemnum(String er_itemnum) {
		this.er_itemnum = er_itemnum;
	}

	public String getEr_itemname() {
		return er_itemname;
	}

	public void setEr_itemname(String er_itemname) {
		this.er_itemname = er_itemname;
	}

	public String getEr_sub() {
		return er_sub;
	}

	public void setEr_sub(String er_sub) {
		this.er_sub = er_sub;
	}

	public String getEr_cont() {
		return er_cont;
	}

	public void setEr_cont(String er_cont) {
		this.er_cont = er_cont;
	}

	public int getEr_hit() {
		return er_hit;
	}

	public void setEr_hit(int er_hit) {
		this.er_hit = er_hit;
	}

	public String getEr_file() {
		return er_file;
	}

	public void setEr_file(String er_file) {
		this.er_file = er_file;
	}

	public String getEr_original() {
		return er_original;
	}

	public void setEr_original(String er_original) {
		this.er_original = er_original;
	}

	public String getEr_date() {
		return er_date;
	}

	public void setEr_date(String er_date) {
		this.er_date = er_date;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

}
