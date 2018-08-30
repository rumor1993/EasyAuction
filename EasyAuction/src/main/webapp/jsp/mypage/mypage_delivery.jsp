<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
#deliveryColl .collTitle {
	margin-bottom: 16px;
}

#deliveryColl .select_box {
	border: 1px solid #7f9db7;
	width: 135px;
	height: 20px;
	font-size: 12px;
}

#deliveryColl .inp_txt {
	width: 140px;
	height: 14px;
	padding: 4px 0 3px 2px;
	border-top: 1px solid #ababab;
	border-left: 1px solid #ababab;
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
	font-size: 12px;
	line-height: 14px;
}

#deliveryColl .wrap_inquiry {
	padding-bottom: 15px;
	border: 1px solid #e8e8e8;
	background: #f9f9f9;
}

#deliveryColl .wrap_inquiry .box_search {
	width: 701px;
	padding: 13px 0 0 15px;
	border-top: 1px solid #fcfcfc;
	border-left: 1px solid #fcfcfc;
}

#deliveryColl .wrap_inquiry .info_delivery {
	float: left;
}

#deliveryColl .wrap_inquiry .info_delivery .tit {
	float: left;
	padding-right: 4px;
	font-size: 12px;
	font-weight: bold;
	line-height: 22px;
	color: #000;
	clear: both;
}

#deliveryColl .wrap_inquiry .info_delivery .cont {
	float: left;
	width: 154px;
}

#deliveryColl .wrap_inquiry .inp_txt {
	float: left;
	width: 140px;
	margin-right: 5px;
}

#deliveryColl .wrap_inquiry .btn_inquiry {
	display: block;
	overflow: hidden;
	float: left;
	width: 41px;
	height: 23px;
	padding: 0;
	border: 0;
	background:
		url(http://i1.search.daumcdn.net/s/search_all/2011/btn/btn_delivery.gif)
		no-repeat 0 0;
	font-size: 0;
	line-height: 0;
	text-indent: -999em;
	cursor: pointer;
}

#deliveryColl .wrap_inquiry .delivery_num .cont {
	width: 190px;
}

#deliveryColl .wrap_inquiry .refer {
	float: left;
	margin: 6px 0 0 6px;
	font: normal 11px '����', dotum;
	color: #777;
	line-height: 13px;
}
/* �������� */
#deliveryColl .list_relation {
	margin: 12px 0 0 0;
	clear: both;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
var url = "";
function kocnSubmit() {
	var _jsDeliveryCompanyArr = [
		["0","�������ּ���"],
		["1", "�浿�ù�", {cpName: "�浿", url: "www.kdexp.com/sub3_shipping.asp?stype=1&p_item=##NUM##" }]
		,
		["2", "�����װ�", {cpName: "�����װ�", url: "cargo.koreanair.com/ecus/trc/servlet/TrackingServlet?pid=5&version=kor&menu1=m1&menu2=m01-1&awb_no=##NUM##" }]
		,
		["3", "�����ù�", {cpName: "�����ͽ�������", url: "www.dongbups.com/newHtml/delivery/delivery_search_view.jsp?item_no=##NUM##" }]
		,
		["4", "�����ù�", {cpName: "����", url: "www.ilogen.com/iLOGEN.Web.New/TRACE/TraceView.aspx?gubun=slipno&slipno=##NUM##" }]
		,
		["5", "�������佺", {cpName: "�������佺", url: "www.epantos.com/jsp/gx/tracking/tracking/trackingInquery.jsp?refNo=##NUM##" }]
		,
		["6", "��ü���ù�", {cpName: "��ü��", url: "service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=##NUM##" }]
		,
		["7", "�Ͼ�������ù�", {cpName: "�Ͼ������", url: "www.ilyanglogis.com/functionality/tracking_result.asp?hawb_no=##NUM##" }]
		,
		["8", "õ���ù�", {cpName: "õ��", url: "www.chunil.co.kr/HTrace/HTrace.jsp?transNo=##NUM##" }]
		,
		["9", "�ѵ����ù�", {cpName: "�ѵ���", url: "btob.sedex.co.kr/work/app/tm/tmtr01/tmtr01_s4.jsp?IC_INV_NO=##NUM##" }]
		,
		["10", "���ǻ���ù�", {cpName: "���ǻ��", url: "www.hanips.com/html/sub03_03_1.html?logicnum=##NUM##" }]
		,
		["11", "�����ù�", {cpName: "����", url: "www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num=##NUM##" }]
		,
		["12", "�����ù�", {cpName: "����", url: "www.hlc.co.kr/personalService/tracking/06/tracking_goods_result.jsp?InvNo=##NUM##" }]
		,
		["13", "CJ ��������ù�", {cpName: "CJ�������", url: "www.doortodoor.co.kr/parcel/doortodoor.do?fsp_action=PARC_ACT_002&fsp_cmd=retrieveInvNoACT&invc_no=##NUM##" }]
		,
		["14", "CVSnet�������ù�", {cpName: "CVSNET������", url: "was.cvsnet.co.kr/_ver2/board/ctod_status.jsp?invoice_no=##NUM##" }]
		,
		["15", "DHL�ù�", {cpName: "DHL", url: "www.dhl.co.kr/content/kr/ko/express/tracking.shtml?brand=DHL&AWB=##NUM##" }]
		,
		["16", "FedEx�ù�", {cpName: "FEDEX", url: "www.fedex.com/Tracking?ascend_header=1&clienttype=dotcomreg&cntry_code=kr&language=korean&tracknumbers=##NUM##" }]
		,
		["17", "GTX�������ù�", {cpName: "GTX������", url: "www.gtxlogis.co.kr/tracking/default.asp?awblno=##NUM##" }]
		,
		["18", "KG���ο�ĸ�ù�", {cpName: "KG���ο�ĸ", url: "www.yellowcap.co.kr/custom/inquiry_result.asp?INVOICE_NO=##NUM##" }]
		,
		["19", "KGB�ù�", {cpName: "KGB", url: "www.kgbls.co.kr/sub5/trace.asp?f_slipno=##NUM##" }]
		,
		["20", "OCS�ù�", {cpName: "OCS", url: "www.ocskorea.com/online_bl_multi.asp?mode=search&search_no=##NUM##" }]
		,
		["21", "TNT Express", {cpName: "TNTExpress", url: "www.tnt.com/webtracker/tracking.do?respCountry=kr&respLang=ko&searchType=CON&cons=##NUM##" }]
		,
		["22", "UPS�ù�", {cpName: "UPS", url: "www.apps.ups.com/WebTracking/track?track=yes&trackNums=##NUM##" }]
		];
	
	var invoice_num = $('#kocn_number').val();
	if (invoice_num==''){
		alert('�����ȣ�� �Է����ּ���.');
		invoice_num = "";
	}else{
	var selectNum = $('#_jsDeliveryCorpListHiddenSelBox option:selected').val();
	var cpName = _jsDeliveryCompanyArr[selectNum][2].cpName;
	url = _jsDeliveryCompanyArr[selectNum][2].url;
	url = url.replace("##NUM##", invoice_num);
	
	}

};

$(document).ready(function(){
	$('form').submit(function(){
		$(this).attr("action", 'https://' + url);
	})
})
</script>
</head>
<body>
	<div id="deliveryColl" class="wid_w">
		<div class="coll_tit">
			<h2 class="tit">�ù� �� �װ�ȭ�� ��ȸ</h2>
		</div>
		<div class="coll_cont">
			<div class="mg_cont">
				<div class="wrap_inquiry">
					<div class="box_search">
						<form name="kocn_mm" method="post" onsubmit="kocnSubmit();">
						<fieldset>
								<legend>�ù� �� �װ�ȭ�� ��ȸ</legend>
								<dl class="info_delivery">
									<dt class="tit">��ü��</dt>
									<dd class="cont">
										<select id="_jsDeliveryCorpListHiddenSelBox" name="_jsDeliveryCorpListHiddenSelBox" class="select_box">
											<option value="0">������ �ּ���</option>
											<option value="1">�浿�ù�</option>
											<option value="2">�����װ�</option>
											<option value="3">�����ù�</option>
											<option value="4">�����ù�</option>
											<option value="5">�������佺</option>
											<option value="6">��ü���ù�</option>
											<option value="7">�Ͼ�������ù�</option>
											<option value="8">õ���ù�</option>
											<option value="9">�ѵ����ù�</option>
											<option value="10">���ǻ���ù�</option>
											<option value="11">�����ù�</option>
											<option value="12">�����ù�</option>
											<option value="13">CJ ��������ù�</option>
											<option value="14">CVSnet�������ù�</option>
											<option value="15">DHL�ù�</option>
											<option value="16">FedEx�ù�</option>
											<option value="17">GTX�������ù�</option>
											<option value="18">KG���ο�ĸ�ù�</option>
											<option value="19">KGB�ù�</option>
											<option value="20">OCS�ù�</option>
											<option value="21">TNT Express</option>
											<option value="22">UPS�ù�</option>
										</select>
									</dd>
								</dl>
								<dl class="info_delivery delivery_num">
									<dt class="tit">�����ȣ</dt>
									<dd class="cont">
										<input id="kocn_number" type="text" class="inp_txt" style="width: 130px" name="kocn_number" placeholder="��)1234567890" > 
										<input type="submit" class="btn_bus btn_inquiry" value="��ȸ">
									</dd>
								</dl>
								<div class="refer" id="deleveryInfoMes">��ü�� ���� ��, �����ȣ�� �Է����ּ���.</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>