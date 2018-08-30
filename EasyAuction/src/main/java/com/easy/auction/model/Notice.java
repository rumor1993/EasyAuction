package com.easy.auction.model;

import org.springframework.web.multipart.MultipartFile;

public class Notice {

	private int    en_num;
	private String en_admin;
	private String en_sub;
	private String en_cont;
	private int	   en_hit;
	private String en_file;
	private String en_original;
	private String en_date;
	private MultipartFile uploadfile;
	
	public int getEn_num() {
		return en_num;
	}
	public void setEn_num(int en_num) {
		this.en_num = en_num;
	}
	public String getEn_admin() {
		return en_admin;
	}
	public void setEn_admin(String en_admin) {
		this.en_admin = en_admin;
	}
	public String getEn_sub() {
		return en_sub;
	}
	public void setEn_sub(String en_sub) {
		this.en_sub = en_sub;
	}
	public String getEn_cont() {
		return en_cont;
	}
	public void setEn_cont(String en_cont) {
		this.en_cont = en_cont;
	}
	public int getEn_hit() {
		return en_hit;
	}
	public void setEn_hit(int en_hit) {
		this.en_hit = en_hit;
	}
	public String getEn_file() {
		return en_file;
	}
	public void setEn_file(String en_file) {
		this.en_file = en_file;
	}
	public String getEn_original() {
		return en_original;
	}
	public void setEn_original(String en_original) {
		this.en_original = en_original;
	}
	public String getEn_date() {
		return en_date;
	}
	public void setEn_date(String en_date) {
		this.en_date = en_date;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	@Override
	public String toString() {
		return "Notice [en_num=" + en_num + ", en_admin=" + en_admin + ", en_sub=" + en_sub + ", en_cont=" + en_cont
				+ ", en_hit=" + en_hit + ", en_file=" + en_file + ", en_original=" + en_original + ", en_date="
				+ en_date + ", uploadfile=" + uploadfile + "]";
	}
	

}
