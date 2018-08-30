function sub2(a,b){
   
   
   var _jsDeliveryCompanyArr = [
      ["0","선택해주세요"],
      ["1", "경동택배", {cpName: "경동", url: "https://www.kdexp.com/sub3_shipping.asp?stype=1&p_item=##NUM##" }]
      ,
      ["2", "대한항공", {cpName: "대한항공", url: "https://cargo.koreanair.com/ecus/trc/servlet/TrackingServlet?pid=5&version=kor&menu1=m1&menu2=m01-1&awb_no=##NUM##" }]
      ,
      ["3", "동부택배", {cpName: "동부익스프레스", url: "https://www.dongbups.com/newHtml/delivery/delivery_search_view.jsp?item_no=##NUM##" }]
      ,
      ["4", "로젠택배", {cpName: "로젠", url: "https://www.ilogen.com/iLOGEN.Web.New/TRACE/TraceView.aspx?gubun=slipno&slipno=##NUM##" }]
      ,
      ["5", "범한판토스", {cpName: "범한판토스", url: "https://www.epantos.com/jsp/gx/tracking/tracking/trackingInquery.jsp?refNo=##NUM##" }]
      ,
      ["6", "우체국택배", {cpName: "우체국", url: "https://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=##NUM##" }]
      ,
      ["7", "일양로지스택배", {cpName: "일양로지스", url: "https://www.ilyanglogis.com/functionality/tracking_result.asp?hawb_no=##NUM##" }]
      ,
      ["8", "천일택배", {cpName: "천일", url: "https://www.chunil.co.kr/HTrace/HTrace.jsp?transNo=##NUM##" }]
      ,
      ["9", "한덱스택배", {cpName: "한덱스", url: "https://btob.sedex.co.kr/work/app/tm/tmtr01/tmtr01_s4.jsp?IC_INV_NO=##NUM##" }]
      ,
      ["10", "한의사랑택배", {cpName: "한의사랑", url: "https://www.hanips.com/html/sub03_03_1.html?logicnum=##NUM##" }]
      ,
      ["11", "한진택배", {cpName: "한진", url: "https://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num=##NUM##" }]
      ,
      ["12", "현대택배", {cpName: "현대", url: "https://www.hlc.co.kr/personalService/tracking/06/tracking_goods_result.jsp?InvNo=##NUM##" }]
      ,
      ["13", "CJ 대한통운택배", {cpName: "CJ대한통운", url: "https://www.doortodoor.co.kr/parcel/doortodoor.do?fsp_action=PARC_ACT_002&fsp_cmd=retrieveInvNoACT&invc_no=##NUM##" }]
      ,
      ["14", "CVSnet편의점택배", {cpName: "CVSNET편의점", url: "https://was.cvsnet.co.kr/_ver2/board/ctod_status.jsp?invoice_no=##NUM##" }]
      ,
      ["15", "DHL택배", {cpName: "DHL", url: "https://www.dhl.co.kr/content/kr/ko/express/tracking.shtml?brand=DHL&AWB=##NUM##" }]
      ,
      ["16", "FedEx택배", {cpName: "FEDEX", url: "https://www.fedex.com/Tracking?ascend_header=1&clienttype=dotcomreg&cntry_code=kr&language=korean&tracknumbers=##NUM##" }]
      ,
      ["17", "GTX로지스택배", {cpName: "GTX로지스", url: "https://www.gtxlogis.co.kr/tracking/default.asp?awblno=##NUM##" }]
      ,
      ["18", "KG옐로우캡택배", {cpName: "KG옐로우캡", url: "https://www.yellowcap.co.kr/custom/inquiry_result.asp?INVOICE_NO=##NUM##" }]
      ,
      ["19", "KGB택배", {cpName: "KGB", url: "https://www.kgbls.co.kr/sub5/trace.asp?f_slipno=##NUM##" }]
      ,
      ["20", "OCS택배", {cpName: "OCS", url: "https://www.ocskorea.com/online_bl_multi.asp?mode=search&search_no=##NUM##" }]
      ,
      ["21", "TNT Express", {cpName: "TNTExpress", url: "https://www.tnt.com/webtracker/tracking.do?respCountry=kr&respLang=ko&searchType=CON&cons=##NUM##" }]
      ,
      ["22", "UPS택배", {cpName: "UPS", url: "https://www.apps.ups.com/WebTracking/track?track=yes&trackNums=##NUM##" }]
      ];
   var invoice_num = a;
   var test = ".select_box_order" + b;
   var selectNum = $(test).val();
   
   
   if (invoice_num==''){
      alert('송장번호를 입력해주세요.');
      invoice_num = "";
   }
   if(selectNum=='0'){
      alert('업체를 다시 선택해주세요');
      return false;
   }
   else{
   var selectNum = $('#_jsDeliveryCorpListHiddenSelBox option:selected').val();
   var cpName = _jsDeliveryCompanyArr[selectNum][2].cpName;
   url = _jsDeliveryCompanyArr[selectNum][2].url;
   url = url.replace("##NUM##", invoice_num);
   window.open(url);
   }
   
}