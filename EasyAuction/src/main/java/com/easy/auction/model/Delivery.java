package com.easy.auction.model;

public class Delivery {
	
	private int ed_num;
	private String receive_id;
	private String send_id;
	private String ed_delinum;
	private String eb_itemnum;
	private String ed_company;
	
	public String getEb_itemnum() {
		return eb_itemnum;
	}
	public void setEb_itemnum(String eb_itemnum) {
		this.eb_itemnum = eb_itemnum;
	}
	public int getEd_num() {
		return ed_num;
	}
	public void setEd_num(int ed_num) {
		this.ed_num = ed_num;
	}
	public String getReceive_id() {
		return receive_id;
	}
	public void setReceive_id(String receive_id) {
		this.receive_id = receive_id;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getEd_delinum() {
		return ed_delinum;
	}
	public void setEd_delinum(String ed_delinum) {
		this.ed_delinum = ed_delinum;
	}
	public String getEd_company() {
		return ed_company;
	}
	public void setEd_company(String ed_company) {
		this.ed_company = ed_company;
	}
	
}
