package com.easy.auction.model;

//특별경매 빈
public class SHouse {
	private int sh_num; //입찰번호
	private int esl_num; //경매장 임의 번
	private int sh_bidnum;		//경매장번호
	private String eb_itemnum;	//물품번호
	private String eb_itemname; //물품이름
	private String sh_buyer;	//입찰자
	private int sh_bidprice;	//입찰가
	private String sh_adkey;	//관리자 코멘트 키워드
	private String sh_comment;	//관리자 코멘트
	private String sh_biddate;	//입찰날짜
	private int sh_bidcount;
	
	public int getSh_num() {
		return sh_num;
	}
	public void setSh_num(int sh_num) {
		this.sh_num = sh_num;
	}
	public int getEsl_num() {
		return esl_num;
	}
	public void setEsl_num(int esl_num) {
		this.esl_num = esl_num;
	}
	public int getSh_bidnum() {
		return sh_bidnum;
	}
	public void setSh_bidnum(int sh_bidnum) {
		this.sh_bidnum = sh_bidnum;
	}
	public String getEb_itemnum() {
		return eb_itemnum;
	}
	public void setEb_itemnum(String eb_itemnum) {
		this.eb_itemnum = eb_itemnum;
	}
	public String getEb_itemname() {
		return eb_itemname;
	}
	public void setEb_itemname(String eb_itemname) {
		this.eb_itemname = eb_itemname;
	}
	public String getSh_buyer() {
		return sh_buyer;
	}
	public void setSh_buyer(String sh_buyer) {
		this.sh_buyer = sh_buyer;
	}
	public int getSh_bidprice() {
		return sh_bidprice;
	}
	public void setSh_bidprice(int sh_bidprice) {
		this.sh_bidprice = sh_bidprice;
	}
	public String getSh_adkey() {
		return sh_adkey;
	}
	public void setSh_adkey(String sh_adkey) {
		this.sh_adkey = sh_adkey;
	}
	public String getSh_comment() {
		return sh_comment;
	}
	public void setSh_comment(String sh_comment) {
		this.sh_comment = sh_comment;
	}
	public String getSh_biddate() {
		return sh_biddate;
	}
	public void setSh_biddate(String sh_biddate) {
		this.sh_biddate = sh_biddate;
	}
	public int getSh_bidcount() {
		return sh_bidcount;
	}
	public void setSh_bidcount(int sh_bidcount) {
		this.sh_bidcount = sh_bidcount;
	}
	
}
