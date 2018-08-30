package com.easy.auction.model;

import org.springframework.web.multipart.MultipartFile;

public class FAQ {

	private int ef_num;
	private String ef_cate;
	private String ef_admin;
	private String ef_sub;
	private String ef_cont;
	private String ef_file;
	private String ef_original;
	private String ef_date;
	private MultipartFile uploadfile;
	
	public int getEf_num() {
		return ef_num;
	}
	public void setEf_num(int ef_num) {
		this.ef_num = ef_num;
	}
	public String getEf_cate() {
		return ef_cate;
	}
	public void setEf_cate(String ef_cate) {
		this.ef_cate = ef_cate;
	}
	public String getEf_admin() {
		return ef_admin;
	}
	public void setEf_admin(String ef_admin) {
		this.ef_admin = ef_admin;
	}
	public String getEf_sub() {
		return ef_sub;
	}
	public void setEf_sub(String ef_sub) {
		this.ef_sub = ef_sub;
	}
	public String getEf_cont() {
		return ef_cont;
	}
	public void setEf_cont(String ef_cont) {
		this.ef_cont = ef_cont;
	}
	public String getEf_file() {
		return ef_file;
	}
	public void setEf_file(String ef_file) {
		this.ef_file = ef_file;
	}
	public String getEf_original() {
		return ef_original;
	}
	public void setEf_original(String ef_original) {
		this.ef_original = ef_original;
	}
	public String getEf_date() {
		return ef_date;
	}
	public void setEf_date(String ef_date) {
		this.ef_date = ef_date;
	}
	
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	@Override
	public String toString() {
		return "FAQ [ef_num=" + ef_num + ", ef_cate=" + ef_cate + ", ef_admin=" + ef_admin + ", ef_sub=" + ef_sub
				+ ", ef_cont=" + ef_cont + ", ef_file=" + ef_file + ", ef_original=" + ef_original + ", ef_date="
				+ ef_date + ", uploadfile=" + uploadfile + "]";
	}
	
	
}
