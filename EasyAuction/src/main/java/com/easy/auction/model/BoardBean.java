package com.easy.auction.model;

import org.springframework.web.multipart.MultipartFile;

//경매물품 게시판 테이블
public class BoardBean {
	
	private String eb_itemnum;
	private int eb_boardnum;
	private String em_id;
	private int eb_pass;
	private String eb_state; // 6단계 나누는 용
	private String eb_itemname;
	private String eb_cont;
	private int eb_drprice;
	private int eb_stprice;
	private int eb_laprice;
	private int ey_categorynum;
	private String eb_madein;
	private int eb_bidcount;   // 입찰수
	private int eb_attcount;  // 관심수
	private MultipartFile uploadfile;
	private String eb_file; 
	private String eb_original;
	private int eb_hit;
	private String eb_audate; // 시작
	private String eb_saledate; // 판매
	private String eb_ladate; // 종료일
	private String eb_stdate; // 작성날짜
	private String eb_choicedate; // 
	private String eb_kind; // 일반 , 특별 구분
	
	
	public int getEb_pass() {
		return eb_pass;
	}
	public void setEb_pass(int eb_pass) {
		this.eb_pass = eb_pass;
	}
	public String getEb_itemnum() {
		return eb_itemnum;
	}
	public void setEb_itemnum(String eb_itemnum) {
		this.eb_itemnum = eb_itemnum;
	}
	public int getEb_boardnum() {
		return eb_boardnum;
	}
	public void setEb_boardnum(int eb_boardnum) {
		this.eb_boardnum = eb_boardnum;
	}
	public String getEm_id() {
		return em_id;
	}
	public void setEm_id(String em_id) {
		this.em_id = em_id;
	}
	public String getEb_state() {
		return eb_state;
	}
	public void setEb_state(String eb_state) {
		this.eb_state = eb_state;
	}
	public String getEb_itemname() {
		return eb_itemname;
	}
	public void setEb_itemname(String eb_itemname) {
		this.eb_itemname = eb_itemname;
	}
	public String getEb_cont() {
		return eb_cont;
	}
	public void setEb_cont(String eb_cont) {
		this.eb_cont = eb_cont;
	}
	public int getEb_drprice() {
		return eb_drprice;
	}
	public void setEb_drprice(int eb_drprice) {
		this.eb_drprice = eb_drprice;
	}
	public int getEb_stprice() {
		return eb_stprice;
	}
	public void setEb_stprice(int eb_stprice) {
		this.eb_stprice = eb_stprice;
	}
	public int getEb_laprice() {
		return eb_laprice;
	}
	public void setEb_laprice(int eb_laprice) {
		this.eb_laprice = eb_laprice;
	}
	public String getEb_madein() {
		return eb_madein;
	}
	public void setEb_madein(String eb_madein) {
		this.eb_madein = eb_madein;
	}
	public int getEb_bidcount() {
		return eb_bidcount;
	}
	public void setEb_bidcount(int eb_bidcount) {
		this.eb_bidcount = eb_bidcount;
	}
	public int getEb_attcount() {
		return eb_attcount;
	}
	public void setEb_attcount(int eb_attcount) {
		this.eb_attcount = eb_attcount;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getEb_file() {
		return eb_file;
	}
	public void setEb_file(String eb_file) {
		this.eb_file = eb_file;
	}
	public String getEb_original() {
		return eb_original;
	}
	public void setEb_original(String eb_original) {
		this.eb_original = eb_original;
	}
	public int getEb_hit() {
		return eb_hit;
	}
	public void setEb_hit(int eb_hit) {
		this.eb_hit = eb_hit;
	}
	public String getEb_audate() {
		return eb_audate;
	}
	public void setEb_audate(String eb_audate) {
		this.eb_audate = eb_audate;
	}
	public String getEb_saledate() {
		return eb_saledate;
	}
	public void setEb_saledate(String eb_saledate) {
		this.eb_saledate = eb_saledate;
	}
	public String getEb_ladate() {
		return eb_ladate;
	}
	public void setEb_ladate(String eb_ladate) {
		this.eb_ladate = eb_ladate;
	}
	public String getEb_stdate() {
		return eb_stdate;
	}
	public void setEb_stdate(String eb_stdate) {
		this.eb_stdate = eb_stdate;
	}
	public String getEb_choicedate() {
		return eb_choicedate;
	}
	public void setEb_choicedate(String eb_choicedate) {
		this.eb_choicedate = eb_choicedate;
	}
	public int getEy_categorynum() {
		return ey_categorynum;
	}
	public void setEy_categorynum(int ey_categorynum) {
		this.ey_categorynum = ey_categorynum;
	}
	public String getEb_kind() {
		return eb_kind;
	}
	public void setEb_kind(String eb_kind) {
		this.eb_kind = eb_kind;
	}
	
	

	
}
