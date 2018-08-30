package com.easy.auction.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.easy.auction.model.BoardBean;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.Point;
import com.easy.auction.model.Review;
import com.easy.auction.model.SList;

@Repository
public class MypageDAOImpl {

   @Autowired
   private SqlSessionTemplate sqlSession;
   
   
   public int getPoint(String id) {
      int point=0;
      point = sqlSession.selectOne("select_point", id);
      return point;
   }

   public void requestPoint(Point point) {
      sqlSession.insert("insert_point",point);
      
   }

   public int getListCount(String id) {
      int listcount = sqlSession.selectOne("select_listcount",id);
      return listcount;
   }

   public List<Point> getLookuplist(Map m) {
      List<Point> lookuplist = sqlSession.selectList("select_pointlist",m);
      return lookuplist;
   }
   
   public int getOrderListCount(String id){
      int listcount = sqlSession.selectOne("select_orderlistcount",id);
      return listcount;
   }

   public List<PList> getOrderList(Map m) {
      List<PList> orderlist = sqlSession.selectList("select_orderlist",m);
      return orderlist;
   }

   public void orderCancel(String id) {
      sqlSession.update("update_cancel",id);
      
   }
   
   public Map result_ok(Map m) {
      sqlSession.update("update_result_ok",m);
      return m;
   }
   
   public BoardBean selectBoardfileInfo(String itemnum) {
	   return sqlSession.selectOne("Mypage.select_boardfile_info", itemnum);
   }
   
   public void updateBoardfileDate(BoardBean board) {
	   sqlSession.update("Mypage.update_boardfile_date", board);
   }

   public MemberBean member_info(String id) {
      MemberBean memberbean = (MemberBean) sqlSession.selectOne("select_memberinfo", id);
      return memberbean;
   }

   public String member_password(String em_id) {
      String pwd = sqlSession.selectOne("select_pwd",em_id);
      return pwd;
   }

   public void member_update(MemberBean member) {
      sqlSession.update("update_member",member);
      
   }

   public List getLikelist(Map m) {
      List likelist = sqlSession.selectList("select_likelist",m);
      return likelist;
   }

   public int getListListCount(String id) {
      int count = sqlSession.selectOne("select_likelistcount",id);
      return count;
   }

   public void reasonAdd(Map m) {
      sqlSession.insert("insert_reasonAdd",m);
      
   }

   public List<PList> getListmain1(String id) {
      List<PList> list1 = sqlSession.selectList("select_listmain1",id);
      return list1;
   }

   public List<Review> getReviewlist(Map m) {
      List<Review> reviewlist = sqlSession.selectList("select_reivewlist",m);
      return reviewlist;
   }

   public int getListCount_review(String id) {
      int count = sqlSession.selectOne("select_listcountreview" , id);
      return count;
   }

   public int getListCount_sale(String id) {
      int count = sqlSession.selectOne("select_listcountsale" , id);
      return count;
   }

   public List<SList> getsalelist(Map m) {
      List<SList> salelist = sqlSession.selectList("select_salelist",m);
      return salelist;
   }


   public void deliverinfo_insert(Map m) {
      sqlSession.insert("insert_deliverinfo",m);
      
   }

   public List<SList> getListmain2(String id) {
      List<SList> salelist = sqlSession.selectList("select_listmain2",id);
      return salelist;
   }

   public List<Review> getListmain3(String id) {
      List<Review> reviewlist = sqlSession.selectList("select_listmain3",id);
      return reviewlist;
   }

   public String getstate(String itemnum) {
      String state = sqlSession.selectOne("selete_state",itemnum);
      return state;
   }

   public void point_processing(Map pmap) {
      sqlSession.update("update_point", pmap);
      
   }

   public void point_processing2(Map pmap) {
      sqlSession.update("update_point2", pmap);
      
   }

   public int getItemprice(String itemnum) {
      int price = sqlSession.selectOne("select_price",itemnum);
      return price;
   }





}