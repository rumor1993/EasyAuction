

$(function(){
	var date = new Date()
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	if(month < 10){
		 month = '0'+month
	 }
	var day = date.getDate();
	if(day < 10){
		 day = '0'+day
	 }
	var sysdate = year+"-"+month+"-"+day
	
	
	var open_time_mill = new Array(); //오픈시간밀리
	var open_time = new Array();	  //오픈시간
	var open_substring = new Array(); //오픈시간 -빼고
	var remain_time = new Array();	  //남은시간
	var days = new Array();			  //남은시간 일
	var hours = new Array();		  //남은시간 시간
	var minutes = new Array();		  //남은시간 분
	var second = new Array();		  // 남으시간 초
	var itemnum = new Array();		  // 아이템넘버
	var systime = new Date().getTime();
	var sysdate_substring = sysdate.substring(0,4)+sysdate.substring(5,7)+sysdate.substring(8,10)
	
	var open_time_mill2 = new Array(); //오픈시간밀리
	var open_time2 = new Array();	  //오픈시간
	var open2_substring = new Array();	  //오픈시간-빼고
	var remain_time2 = new Array();	  //남은시간
	var days2 = new Array();			  //남은시간 일
	var hours2 = new Array();		  //남은시간 시간
	var minutes2 = new Array();		  //남은시간 분
	var second2 = new Array();		  // 남으시간 초
	var itemnum2 = new Array();		  // 아이템넘버
	var ey_smallcategory = $("#ey_smallcategory").val();
	var ey_bigcategory = $("#ey_bigcategory").val();
	var range = $("#range").val();
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//경매준비중인 리스트들
	for(var i =0; i<Number($("#item_ready_count").val()); i++){
		itemnum.push($("#item_num"+i).val());
		open_time_mill.push(new Date($("#open_time"+i).val()).getTime());
		open_time.push($("#open_time"+i).val());
		open_substring.push(open_time[i].substring(0,4)+open_time[i].substring(5,7)+open_time[i].substring(8,10));
		remain_time.push(open_time_mill[i]-systime);
		days.push(Math.floor(remain_time[i]/1000/60/60/24));
		hours.push(Math.floor(remain_time[i]/1000/60/60)-(days[i]*24));
		minutes.push(Math.floor(remain_time[i]/1000/60)-(days[i]*24*60)-(hours[i]*60));
		second.push(Math.floor(remain_time[i]/1000)-(days[i]*24*60*60)-(hours[i]*60*60)-(minutes[i]*60));
		$("#remain_time"+i).empty().html(days[i]+'일 ' + hours[i]+"시간 " + minutes[i]+"분 " + second[i]+"초");
		
		if(days[i] == 0){
			$("#remain_time"+i).empty().html(hours[i]+"시간 " + minutes[i]+"분 " + second[i]+"초");
			if(hours[i] == 0){
				$("#remain_time"+i).empty().html(minutes[i]+"분 " + second[i]+"초");
			}
		}
		
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//금일오픈 리스트들
	for(var i =0; i<Number($("#item_count").val()); i++){
		itemnum2.push($("#today_item_num"+i).val());
		open_time_mill2.push(new Date($("#today_open_time"+i).val()).getTime());
		open_time2.push($("#today_open_time"+i).val());

		if($("#real_open_time"+i).val() != null){
			open2_substring.push($("#real_open_time"+i).val().substring(0,4)+$("#real_open_time"+i).val().substring(5,7)+$("#real_open_time"+i).val().substring(8,10))	
		}
		
		remain_time2.push(open_time_mill2[i]-systime);
		days2.push(Math.floor(remain_time2[i]/1000/60/60/24));
		hours2.push(Math.floor(remain_time2[i]/1000/60/60)-(days2[i]*24));
		minutes2.push(Math.floor(remain_time2[i]/1000/60)-(days2[i]*24*60)-(hours2[i]*60));
		second2.push(Math.floor(remain_time2[i]/1000)-(days2[i]*24*60*60)-(hours2[i]*60*60)-(minutes2[i]*60));
		
		$("#today_remain_time"+i).empty().html(days2[i]+'일 ' + hours2[i]+"시간 " + minutes2[i]+"분 " + second2[i]+"초");
		
		if(days2[i] == 0){
			$("#today_remain_time"+i).empty().html(hours2[i]+"시간 " + minutes2[i]+"분 " + second2[i]+"초");
			if(hours2[i] == 0){
				$("#today_remain_time"+i).empty().html(minutes2[i]+"분 " + second2[i]+"초");
			}
		}
	}
	
	setInterval(function (){
		systime = new Date().getTime();
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//경매준비중인 리스트들
		for(var i =0; i<Number($("#item_ready_count").val()); i++){
			remain_time.splice(i,0,open_time_mill[i]-systime);
			days.splice(i,0,Math.floor(remain_time[i]/1000/60/60/24));
			hours.splice(i,0,Math.floor(remain_time[i]/1000/60/60)-(days[i]*24));
			minutes.splice(i,0,Math.floor(remain_time[i]/1000/60)-(days[i]*24*60)-(hours[i]*60));
			second.splice(i,0,Math.floor(remain_time[i]/1000)-(days[i]*24*60*60)-(hours[i]*60*60)-(minutes[i]*60))
			$("#remain_time"+i).empty().html(days[i]+'일 ' + hours[i]+"시간 " + minutes[i]+"분 " + second[i]+"초");
			
			if(days[i] == 0){
				$("#remain_time"+i).empty().html(hours[i]+"시간 " + minutes[i]+"분 " + second[i]+"초");
				if(hours[i] == 0){
					$("#remain_time"+i).empty().html(minutes[i]+"분 " + second[i]+"초");
				}
			}
			
			// 오픈일이 오늘이면 금일 오픈리스트로 이동
		if(open_substring[i] <= sysdate_substring){
			location.href='special_today_open.nhn?itemnum='+itemnum[i]+'&ey_smallcategory='+ey_smallcategory+'&ey_bigcategory='+ey_bigcategory+'&range='+range
			}
		
		}
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//금일오픈 리스트들
		for(var i =0; i<Number($("#item_count").val()); i++){
			remain_time2.splice(i,0,open_time_mill2[i]-systime);
			days2.splice(i,0,Math.floor(remain_time2[i]/1000/60/60/24));
			hours2.splice(i,0,Math.floor(remain_time2[i]/1000/60/60)-(days2[i]*24));
			minutes2.splice(i,0,Math.floor(remain_time2[i]/1000/60)-(days2[i]*24*60)-(hours2[i]*60));
			second2.splice(i,0,Math.floor(remain_time2[i]/1000)-(days2[i]*24*60*60)-(hours2[i]*60*60)-(minutes2[i]*60))
			$("#today_remain_time"+i).empty().html(days2[i]+'일 ' + hours2[i]+"시간 " + minutes2[i]+"분 " + second2[i]+"초");
			
			// 일이 0일이라면 시 분 초만 표시
			if(days2[i] == 0){
				$("#today_remain_time"+i).empty().html(hours2[i]+"시간 " + minutes2[i]+"분 " + second2[i]+"초");
				// 시간이 0이라면 분 초만 표시
				if(hours2[i] == 0){
					$("#today_remain_time"+i).empty().html(minutes2[i]+"분 " + second2[i]+"초");
				}
			}
			// 경매까지 남은시간이 0보다 작다면 경매오픈
			if(remain_time2[i]<0){
				$("#today_remain_time"+i).empty();
				location.href='special_open.nhn?itemnum='+itemnum2[i]+'&ey_smallcategory='+ey_smallcategory+'&ey_bigcategory='+ey_bigcategory+'&range='+range
			}
			if(open2_substring[i] < sysdate_substring){
				location.href='special_finish.nhn?itemnum='+itemnum2[i]+'&ey_smallcategory='+ey_smallcategory+'&ey_bigcategory='+ey_bigcategory+'&range='+range
			}
		}
	}, 1000);
	

})

