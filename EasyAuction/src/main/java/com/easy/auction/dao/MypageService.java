package com.easy.auction.dao;

import java.util.List;
import java.util.Map;

import com.easy.auction.model.Attent;
import com.easy.auction.model.BoardBean;
import com.easy.auction.model.MemberBean;
import com.easy.auction.model.PList;
import com.easy.auction.model.Point;
import com.easy.auction.model.Review;
import com.easy.auction.model.SList;

public interface MypageService {

   /*포인트 구해오기*/
   public int getPoint(String id) throws Exception;
   
   /*포인트 요청하기*/
   public void requestPoint(Point point) throws Exception;
   
   /*총 리스트 수 가져오기*/
   public int getListCount(String id) throws Exception;
   
   /*리스트 불러오기*/
   public List<Point> getLookuplist(Map m) throws Exception;
   
   /*주문 조회 내역 수 */
   public int getOrderListCount(String id)throws Exception;
   
   /*주문 내역 조회*/
   public List<PList> getOrderlist(Map m)throws Exception;
   
   /*주문 취소*/
   public void orderCancel(String id)throws Exception; 
   
   /*배송 확정*/
   public Map result_ok(Map m)throws Exception;
   
   public BoardBean selectBoardfileInfo(String itemnum) throws Exception;
   
   public void updateBoardfileDate(BoardBean board) throws Exception;

   /*회원 정보*/
   public MemberBean member_info(String id)throws Exception;
   
   /*비밀번호 조회*/
   public String member_password(String em_id)throws Exception;
   
   /*회원정보 업데이트*/
   public void member_update(MemberBean member)throws Exception;
   
   /*좋아요 리스트*/
   public List<Attent> getLikelist(Map m)throws Exception;
   
   /*좋아요 리스트 총갯수*/
   public int getLikeListCount(String id)throws Exception;
   
   /*취소 이유 */
   public void reasonAdd(Map m)throws Exception;
   
   /*메인조회 리스트1*/
   public List<PList> getListmain1(String id)throws Exception;
   
   /*리뷰 리스트*/
   public List<Review> getReivewlist(Map m)throws Exception;
   
   /*리뷰 리스트 갯수*/
   public int getListCount_review(String id)throws Exception;
   
   /*판매 리스트 갯수*/
   public int getListCount_sale(String id)throws Exception;
   
   /*판매 리스트*/
   public List<SList> getsalelist(Map m)throws Exception;
   
   /*배송 정보 입력*/
   public void deliveryinfo_insert(Map m)throws Exception;
   
   /*메인조회 리스트2*/
   public List<SList> getListmain2(String id)throws Exception;
   
   /*메인조회 리스트3*/
   public List<Review> getListmain3(String id)throws Exception;
   
   /*배송상태 확인*/
   public String getstate(String itemnum)throws Exception;
   
   /*확정후 포인트 처리1*/
   public void point_processing(Map pmap) throws Exception;
   
   /*확정후 포인트 처리2*/
   public void point_processing2(Map pmap) throws Exception;
   
   /*판매한 가격 조회*/
   public int getItemprice(String itemnum) throws Exception;
   
   
}