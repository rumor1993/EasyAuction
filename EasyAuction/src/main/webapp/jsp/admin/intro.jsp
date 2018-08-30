<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EasyAuction</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.review-title{opacity:0.9;background:black;width:100%;height:150px !important;
      margin:0px 0px 30px 0px;padding:50px 70px;z-index:1 !important}
.review-title-addr{font-size:30pt;float:left;z-index:100;color:white !important;}
.review-title-img{float:right;z-index:100;color:white;margin-top:20px !important;}
.fa-home{color:white;font-size:15pt;}
.head-title{width:200px;}
.bonmun {
   margin: 0px 250px 50px 200px;
   display: block;
}
.intro1{margin-left:10%}
.col-sm-7{width:40% !important;}
table{
   border:1px solid black;
   text-align:center;
   width:100%;
   height:300px;
}
th{
   font-size:40px;
   text-align:center;
}
.intro-table{
   margin-left:50%;
   text-align:left;
}
td{
   font-size:15px;
   line-height:30px;
}
.table-top{
   margin-top:15%;
}
.cont{
   text-align:left;
   margin-left:20%
}
.tong{
   deisplay:block;
   margin-top: 30px !important;
   margin-bottom: 30px !important;
}
.tong1{
   float:left;
   width:50%;
}
.nbutton1 {
   width: 120px;
   height: 30px;
   font-size: 18px !important;
   color: #F03C02 !important;
   border: 1px solid #F03C02 !important;
   border-radius: 3px !important;
   background-color: white !important;
   cursor: pointer !important;
   text-align:center;
   text-decoration:none;
}
.row{margin-top:25%;line-height: 30px}
a{text-decoration:none}
.guide_t{border:"1px solid black"; margin-top:35%;}
.stepBox{text-align:left;}
.mb40{margin-top: 3%;}
.row1{border:1px solid black; text-align:left;}
.dropdown4, .dropdown2{margin-top:1%;}
.row2{margin-left:1%;}
.imgSize2{width:100%;}

@media screen and (max-width: 550px){
   .body {width:100%;}
   .fs16 lineH26{width:100%;}
   .col-sm-7{width: 100% !important;}
   .bonmun{margin: 0}
   h1{text-align: center;}
   .review-title-addr{    font-size: 26pt;}
   .cont { text-align: left; margin-left: 0%; text-align: center; font-size: 6pt;}
    .h2, h2 {
    font-size: 24px;}
    .tong2{width: 200px;}
    .h3, h3 {
    font-size: 13pt;}
    .row1{font-size: 8pt;}
    .thclose{display: none; text-align: center;}
    .dpTableC fs16 lineH26 cont{font-size: 9pt;}
    .list{width:95%;}
   }
</style>

</head>
<jsp:include page="../main/header.jsp"/>
<body>
<div class="review-title">
      <span class="review-title-addr">이지옥션 소개</span>
      <span class="review-title-img"><i class="fa fa-home" aria-hidden="true"></i> &nbsp;> &nbsp;Intro </span>
</div>

<div class="bonmun">
<br><br>
<h1>Guide</h1>
<br><br>
   <div class="intro1">
      <div class="col-sm-7">
         <dl class="cont">
            <dt class="h2 mb30">
               <strong style="color:#F03C02">이지옥션</strong>이 <strong>처음이신가요?</strong>
            </dt>
            <dd class="fs16 lineH26">
               모든 구매자와 판매자에게 열려있는 오픈마켓.<br /> 이지옥션! 당신을 환영합니다.<br />더 이상 헤매지 마십시오. 
               이지옥션에 다 있습니다.
            </dd>
            </dl>
      </div>
      <div class="col-sm-5">
         <img src="./resources/images/intro_auction.jpg" class="sajin1" style=" width:60%;height:30%;">
      </div>
   </div>
   <br><br>
   <div class="table-top">
   <table>
      <tr>
         <th class="thclose"><div class="intro-table">
            지금<br class="visible-lg visible-md" /> 
            <strong class="fcBlue" style="color: #F03C02">이지옥션</strong>
               <br class="visible-lg visible-md" /> 에서는</div>
         </th>
         <td>
            <div class="dpTableC fs16 lineH26 cont">
               <strong>1960년대 생활사</strong> 자료가 <strong>1분에 1개</strong>씩 낙찰되고 있습니다. <br />
               <strong>한국미술품</strong>이 <strong>1시간마다 8작품</strong>이 낙찰되고 있습니다. <br />
               <strong>중국미술품</strong>이 <strong>1시간에 5작품</strong>이 낙찰되고 있습니다. <br />
               <strong>우표와 엽서</strong>가 <strong>1시간마다 15개</strong>씩 팔리고 있습니다. <br />
               <strong>희귀 양장고서와 중고책</strong>이 <strong>1시간마다 8권</strong>씩 팔리고 있습니다. <br />
               <strong>SP, LP, 오디오</strong> 등 음악관련 상품이 <strong>1시간마다 5건</strong>씩 낙찰되고 있습니다. <br />
               <strong>필름, 대본, 포스터</strong> 등 영화 자료가 <strong>매일 20개</strong>씩 팔리고 있습니다.<br />
               <strong>옛날 장남감과 인형</strong>이 <strong>매일 7개</strong>씩 팔리고 있습니다.
            </div>
         </td>
      </tr>
   </table>
   </div>
   
   <div class="tong">
      <div class="tong1">
         <img class="tong2" src="./resources/images/intro_sajin1.jpg">
      </div>
      <div class="tong1">
         <img class="tong2" src="./resources/images/intro_sajin2.jpg">
      </div>
   </div>
   
   <div class="row">
      <h3><strong style="color:#F03C02">◇이지옥션</strong>을 이용하시기 전에 꼭! 확인해주세요.</h3>
      <ul class="list">
         <li>이지옥션을 이용하시려면 먼저 회원가입과 로그인이 필요합니다. 
            <a href="./member_join.nhn" class="nbutton1">회원가입</a> 
            <a href="./member_login.nhn" class="nbutton1">로그인</a>
         </li>
         <li>위조, 가짜, 법령상 판매가 제한 또는 금지된 품목은 등록할 수 없습니다.</li>
         <li>과대광고, 허위사실을 기재할 수 없습니다.</li>
         <li>물품등록 500만원 이하는 무료입니다.</li>
         <li>정상적인 거래완료 후, 구매/판매 수수료 공제 후 송금됩니다.</li>
         <li>품목 별 수수료가 상이합니다.</li>
         <li>이지옥션을 가격을 올리기 위한 불법행위를 엄격히 제한 및 관리하고 있습니다.</li>
         <li>이지옥션을 모든 거래는 매매보호서비스를 통해 안전하게 거래되어 반품, 교환, 환불이 가능합니다.</li>
         <li>등록된 정보와 상이할 경우, 수령 3개월 이내, 그러한 사실을 알 수 있었던 30일 이내에 판매자와 반품이
            가능합니다.</li>
         <li>이지옥션을 입찰방식은 가장 높은 입찰금액을 제시한 사람에게 낙찰(판매)됩니다.</li>
      </ul>
   </div>
   
   <div class="row1">
      <div class="row2">
      <h3 class="subTitle2">&nbsp;◇온라인 경매</h3>
      <p class="mb20 fs16"><strong>온라인 경매를 시작하기 전에 꼭! 확인해주세요.</strong></p>
      <ul class="list">
         <li class="mb20">등록할 물품의 카테고리를 정확하게 분류하는 것은 높은 낙찰가와 빠른 판매를 돕는 지름길 입니다.</li>
         <li class="mb20">물품의 원산지를 꼭 기입해주셔야 합니다.</li>
         <li class="mb20">직거래를 위한 판매자 정보 노출은 불가 합니다.<strong>(직거래, 가격흥정 피해 사례)</strong></li>
      </ul>
      <div class="stepBox">
         <h3 class="mb40 fs16"><strong>온라인 경매 판매절차 한 눈에 보기</strong></h3>
         <div class="text-center mb30">
            <img src="./resources/images/intro_step.PNG" class="imgSize2" alt="">
         </div>
      </div>
      </div>
   </div>
   <br>
   <div class="row1">
      <div class="row2">
      <h3 class="subTitle2">&nbsp;◇특별 경매로 판매하기</h3> 
      <p class="mb20 fs16"><strong>특별경매를 시작하기 전에 꼭! 확인해주세요.</strong></p> 
      <ul class="list">
         <li class="mb20">한가지 주제로 포함될 수 있는 물품이나 일괄 물품을 대상으로 합니다.</li>
         <li class="mb20">물품을 위탁 받은 후, 물품 등록 및 배송은 코베이에서 진행됩니다.</li>
         <li class="mb20">위탁한 물품은 경매진행 후 철회가 불가합니다.</li>
         <li class="mb20">구매수수료는 낙찰가의 12.1%(부가세포함) , 판매수수료는 낙찰가의 16.5%(부가세포함)입니다.</li>
         <li class="mb20">판매대금은 구매자의 수령확인 후, 송금되기 때문에 15일 가량 소요됩니다.</li>
      </ul>
      <div class="stepBox">
         <h3 class="mb40 fs16"><strong>특별경매 판매절차 한 눈에 보기</strong></h3><a href="./special_product_list.nhn" class="nbutton1">특별경매 가기</a>
         <div class="text-center mb30">
            <img src="./resources/images/intro_step2.png" class="imgSize2" alt="">
         </div>
      </div>
      </div>
   </div>
   <a href="#" class="scrollup">
   <i class="icon-chevron-up icon-square icon-32 active"></i></a>
<br><br><br><br><br>
</div>
</body>
<jsp:include page="../main/footer.jsp"/>
</html>