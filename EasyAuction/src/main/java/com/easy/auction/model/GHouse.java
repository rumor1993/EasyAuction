package com.easy.auction.model;

//일반경매 빈
public class GHouse {
	private int gh_num; // 입찰번호
	private int gh_bidnum;		//경매장번호
	private int eb_boardnum;	//게시판번호
	private String eb_itemnum;	//물품번호
	private String gh_buyer;	//입찰자
	private int gh_bidprice;	//입찰가
	private String gh_biddate;	//입찰날짜
	
	public int getGh_bidnum() {
		return gh_bidnum;
	}
	public void setGh_bidnum(int gh_bidnum) {
		this.gh_bidnum = gh_bidnum;
	}
	public int getEb_boardnum() {
		return eb_boardnum;
	}
	public void setEb_boardnum(int eb_boardnum) {
		this.eb_boardnum = eb_boardnum;
	}
	public String getEb_itemnum() {
		return eb_itemnum;
	}
	public void setEb_itemnum(String eb_itemnum) {
		this.eb_itemnum = eb_itemnum;
	}
	public String getGh_buyer() {
		return gh_buyer;
	}
	public void setGh_buyer(String gh_buyer) {
		this.gh_buyer = gh_buyer;
	}

	public int getGh_bidprice() {
		return gh_bidprice;
	}
	public void setGh_bidprice(int gh_bidprice) {
		this.gh_bidprice = gh_bidprice;
	}

	public String getGh_biddate() {
		return gh_biddate;
	}
	public void setGh_biddate(String gh_biddate) {
		this.gh_biddate = gh_biddate;
	}
	public int getGh_num() {
		return gh_num;
	}
	public void setGh_num(int gh_num) {
		this.gh_num = gh_num;
	}

	
	
}
