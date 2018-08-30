<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <meta charset="utf-8">
  <title>EasyAuction</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="./resources/css/bootstrap.css" rel="stylesheet" />
  <link href="./resources/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="./resources/css/fancybox/jquery.fancybox.css" rel="stylesheet">
  <link href="./resources/css/jcarousel.css" rel="stylesheet" />
  <link href="./resources/css/flexslider.css" rel="stylesheet" />
  <link href="./resources/css/cslider.css" rel="stylesheet" />
  <link href="./resources/css/style.css" rel="stylesheet" />
  <link href="./resources/css/font.css" rel="stylesheet" />
  <!-- Theme skin -->
  <link id="t-colors" href="./resources/skins/default.css" rel="stylesheet" />
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="./resources/ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="./resources/ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="./resources/ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="./resources/ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="./resources/ico/favicon.png" />
<head>
  <meta charset="utf-8">
  <title>이지경매</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <style>
  	
  	.review-img{
		width:200px;height:170px !important;
		border: 1px solid whilte;
		border-radius: 50px;
	}
	.special-img{width:400px; height:300px;margin-left:30px;}
	.pop-img, .dline-img{width:200px; height:200px !important;}
	.text-dline, .text-pop, .text-review{text-align:center;font-weight:bolder;}
	.cta-text-chat{font-size:23pt;}
	.eb_itemnum{font-size:17pt;}
	.eb_audate{margin-top:30px;font-size:17pt;}
	.eb_stprice{margin-top:60px;font-size:17pt;}
	@media only screen and (max-width: 500px) {
		.eb_itemnum, .eb_audate, .eb_stprice{font-size:7pt !important;}
	}
  </style>
	<script>
	
	  function chattingWindow(){
			 window.open('./main_chat.nhn', 'popup', 
				'width=400, height=650, top=50, left=100, toolbar=no,scrollbars=yes,resizable=yes,fullscreen=no');
		 }
  </script>
</head>

<body>
<jsp:include page="./header.jsp"/>
  <div id="wrapper">
  	
    <section id="featured">
      <!-- start slider -->
      <div id="da-slider" class="da-slider">
      <c:forEach var="sdline" items="${specialDeadline}">
        <div class="da-slide">
          <h2>${sdline.eb_itemname}</h2>
          <p class="eb_itemnum">물품 번호 : ${sdline.eb_itemnum}</p>
          <p class="eb_audate">경매 시간 : ${sdline.eb_audate }</p>
          <p class="eb_stprice">경매 시초가 : ${sdline.eb_stprice }원</p>
          
          <a href="./special_auction_info.nhn?itemnum=${sdline.eb_itemnum}&ey_smallcategory=&ey_bigcategory=&range=fastopen" class="da-link">Read more</a>
          <c:if test="${sdline.eb_file != null }">
	          <div class="da-img">
	            <img src="./resources/upload${sdline.eb_file}" alt="image01" class="special-img" />
	          </div>
          </c:if>
          <c:if test="${sdline.eb_file == null }">
	          <div class="da-img">
	            <img src="./resources/img/special/noimage.jpg" alt="image01" class="special-img" />
	          </div>
          </c:if>
        </div>
        </c:forEach>
        <nav class="da-arrows">
          <span class="da-arrows-prev"></span>
          <span class="da-arrows-next"></span>
        </nav>
      </div>
      <!-- end slider -->
    </section>
    <section class="callaction">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="big-cta">
              <div class="cta-text">
                <h4 class="cta-text-chat">저희 이지경매에 대해 궁금하신 사항은 <span class="highlight"><strong>실시간 문의하기</strong></span>를 통해 연락주세요.</h4>
              </div>
              <div class="cta floatright">
              	<c:if test="${sessionScope.id != null }">
                	<a class="btn btn-large btn-theme btn-rounded" href="#" onClick="chattingWindow();">실시간 문의하기</a>
                </c:if>
                <c:if test="${sessionScope.id == null }">
                	<a class="btn btn-large btn-theme btn-rounded" href="#" onClick="alert('로그인해주세요.');">실시간 문의하기</a>
                </c:if>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <h4 class="heading"><strong>후기게시판</strong></h4>
            <div class="row">
            <c:forEach var="rlatest" items="${reviewLatest}">
              <div class="span3">
                <div class="box aligncenter">
                  <c:if test="${rlatest.er_file != null}">
                  	<img src="./resources/upload${rlatest.er_file}" class="review-img" alt="Lorem ipsum dolor sit amet.">
                  </c:if>
                  <c:if test="${rlatest.er_file == null}">
                  	<img src="./resources/images/review/no1.png" class="review-img" alt="Lorem ipsum dolor sit amet.">
				  </c:if>
                  <div class="text">
                    <h6 class="text-review">${rlatest.er_sub}</h6>
                    <p>
                      [${rlatest.er_kind}] ${rlatest.er_itemname}
                    </p>
                    <a href="./review_cont.nhn?num=${rlatest.er_num}&page=1&state=cont">Learn more</a>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
          </div>
        </div>
        <!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        <!-- end divider -->
        <!-- Portfolio Projects -->
        <div class="row">
          <div class="span12">
            <h4 class="heading"><strong>경매게시판</strong><br></h4>
            <h4 class="heading">인기순</h4>
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="portfolio">
                  <c:forEach var="pop" items="${commonPopularity}">
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span3 design" data-id="id-0" data-type="web">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                    <a class="hover-wrap" href="common_product_cont.nhn?eb_itemnum=${pop.eb_itemnum}&state=cont">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    <!-- Thumb Image and Description -->
                    <c:if test="${pop.eb_file != null}">
                    	<img src="./resources/upload${pop.eb_file}" class="pop-img">
                    </c:if>
                    <c:if test="${pop.eb_file == null}">
                    	<img src="./resources/img/special/noimage.jpg" class="pop-img">
                    </c:if>
                    <div class="text">
                    	<h6 class="text-pop" style="font-family: 'Nanum Gothic', serif; font-size:12pt;">${pop.eb_itemname}</h6>
                  	</div>
                  </li>
                  </c:forEach>
                </ul>
              </section>
            </div>
            <h4 class="heading">마감순</h4>
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="portfolio">
                  <c:forEach var="dline" items="${commonDeadline}">
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span3 photography" data-id="id-4" data-type="web">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                    <a class="hover-wrap" href="common_product_cont.nhn?eb_itemnum=${dline.eb_itemnum}&state=cont">
						<span class="overlay-img"></span>
						<span class="overlay-img-thumb font-icon-plus"></span>
						</a>
                    <!-- Thumb Image and Description -->
                    <c:if test="${dline.eb_file != null}">
                    	<img src="./resources/upload${dline.eb_file}" class="dline-img">
                    </c:if>
                    <c:if test="${dline.eb_file == null}">
                    	<img src="./resources/img/special/noimage.jpg" class="dline-img">
                    </c:if>
                    <div class="text">
                    	<h6 class="text-dline" style="font-family: 'Nanum Gothic', serif; font-size:12pt;">${dline.eb_itemname}</h6>
                  	</div>
                  	
                  </li>
                  </c:forEach>
                </ul>
              </section>
            </div>
          </div>
        </div>
        <!-- End Portfolio Projects -->
      </div>
    </section>
    <section id="bottom">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="aligncenter">
              <div id="twitter-wrapper">
                <div id="twitter">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
  </div>
  <a href="#" class="scrollup"><i class="icon-chevron-up icon-square icon-32 active"></i></a>
  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="./resources/js/jquery.js"></script>
  <script src="./resources/js/jquery.easing.1.3.js"></script>
  <script src="./resources/js/bootstrap.js"></script>
  <script src="./resources/js/jcarousel/jquery.jcarousel.min.js"></script>
  <script src="./resources/js/jquery.fancybox.pack.js"></script>
  <script src="./resources/js/jquery.fancybox-media.js"></script>
  <script src="./resources/js/google-code-prettify/prettify.js"></script>
  <script src="./resources/js/portfolio/jquery.quicksand.js"></script>
  <script src="./resources/js/portfolio/setting.js"></script>
  <script src="./resources/js/jquery.flexslider.js"></script>
  <script src="./resources/js/jquery.nivo.slider.js"></script>
  <script src="./resources/js/modernizr.custom.js"></script>
  <script src="./resources/js/jquery.ba-cond.min.js"></script>
  <script src="./resources/js/jquery.slitslider.js"></script>
   <script src="./resources/js/jquery.cslider.js"></script>
  <script src="./resources/js/animate.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="./resources/js/custom.js"></script>

<jsp:include page="./footer.jsp"/>
</body>

</html>
