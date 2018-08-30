package com.easy.auction.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easy.auction.model.Attent;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.Point;
import com.easy.auction.model.Review;
import com.easy.auction.model.SList;

@Service("MypageService")
public class MypageServiceImpl implements MypageService {

   @Autowired
   private MypageDAOImpl mypageDAO;

   @Override
   public int getPoint(String id) throws Exception {
      int point = mypageDAO.getPoint(id);
      return point;
   }

   @Override
   public void requestPoint(Point point) throws Exception {
      mypageDAO.requestPoint(point);
      
   }

   @Override
   public int getListCount(String id) throws Exception {
      int listcount = mypageDAO.getListCount(id);
      return listcount;
   }

   @Override
   public List<Point> getLookuplist(Map m) {
      List<Point> lookupList = mypageDAO.getLookuplist(m);
      return lookupList;
   }

   @Override
   public int getOrderListCount(String id) throws Exception {
      int listcount = mypageDAO.getOrderListCount(id);
      return listcount;
   }

   @Override
   public List<PList> getOrderlist(Map m) throws Exception {
      List<PList> orderlist = mypageDAO.getOrderList(m);
      return orderlist;
   }

   @Override
   public void orderCancel(String id) {
      mypageDAO.orderCancel(id);
      
   }

   @Override
   public Map result_ok(Map m) {
      mypageDAO.result_ok(m);
      return m;
   }
   
   @Override
   public BoardBean selectBoardfileInfo(String itemnum) {
	   return mypageDAO.selectBoardfileInfo(itemnum);
   }
   
   @Override
   public void updateBoardfileDate(BoardBean board) {
	   mypageDAO.updateBoardfileDate(board);
   }

   @Override
   public MemberBean member_info(String id) {
      MemberBean memberbean = mypageDAO.member_info(id);
      return memberbean;
   }

   @Override
   public String member_password(String em_id) {
      String pwd = mypageDAO.member_password(em_id);
      return pwd;
   }

   @Override
   public void member_update(MemberBean member) {
      mypageDAO.member_update(member);
   }

   @Override
   public List<Attent> getLikelist(Map m) {
      List<Attent> likelist = mypageDAO.getLikelist(m);
      return likelist;
   }

   @Override
   public int getLikeListCount(String id) {
      int count = mypageDAO.getListListCount(id);
      return count;
   }

   @Override
   public void reasonAdd(Map m) {
      mypageDAO.reasonAdd(m);
   }

   @Override
   public List<PList> getListmain1(String id) {
      List<PList> list1 =mypageDAO.getListmain1(id);
      return list1;
   }

   @Override
   public List<Review> getReivewlist(Map m) {
      List<Review> reviewlist = mypageDAO.getReviewlist(m);
      return reviewlist;
   }

   @Override
   public int getListCount_review(String id) {
      int count = mypageDAO.getListCount_review(id);
      return count;
   }

   @Override
   public int getListCount_sale(String id) throws Exception {
      int count = mypageDAO.getListCount_sale(id);
      return count;
   }

   @Override
   public List<SList> getsalelist(Map m) throws Exception {
      List<SList> salelist = mypageDAO.getsalelist(m);
      return salelist;
   }


   @Override
   public void deliveryinfo_insert(Map m) throws Exception {
      mypageDAO.deliverinfo_insert(m);
      
   }

   @Override
   public List<SList> getListmain2(String id) throws Exception {
      List<SList> salelist = mypageDAO.getListmain2(id);
      return salelist;
   }

   @Override
   public List<Review> getListmain3(String id) throws Exception {
      List<Review> reviewlist = mypageDAO.getListmain3(id);
      return reviewlist;
   }

   @Override
   public String getstate(String itemnum) throws Exception {
      String state = mypageDAO.getstate(itemnum);
      return state;
   }

   @Override
   public void point_processing(Map pmap) throws Exception {
      mypageDAO.point_processing(pmap);
      
   }

   @Override
   public void point_processing2(Map pmap) throws Exception {
      mypageDAO.point_processing2(pmap);
      
   }

   @Override
   public int getItemprice(String itemnum) throws Exception {
      int price = mypageDAO.getItemprice(itemnum);
      return price;
   }




}