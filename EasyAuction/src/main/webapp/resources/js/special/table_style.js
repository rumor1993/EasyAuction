

$(function(){
	switch($("#item_count").val()){
	case '1':
		$("#open_table0").css({'left':'860px'})
		break;
	case '2':
		$("#open_table0").css({'left':'710px'})
		$("#open_table1").css({'left':'1010px'})
		break;
	case '3':
		$("#open_table0").css({'left':'550px'})
		$("#open_table1").css({'left':'850px'})
		$("#open_table2").css({'left':'1150px'})
		break;
	case '4':
		$("#open_table0").css({'left':'400px'})
		$("#open_table1").css({'left':'700px'})
		$("#open_table2").css({'left':'1000px'})
		$("#open_table3").css({'left':'1300px'})
		break;
	case '5':
		$("#open_table0").css({'left':'250px'})
		$("#open_table1").css({'left':'550px'})
		$("#open_table2").css({'left':'850px'})
		$("#open_table3").css({'left':'1150px'})
		$("#open_table4").css({'left':'1450px'})
		break;		
	}

	for(var i=0; i<Number($("#item_ready_count").val()); i++){
		$("#open_ready_table"+i).css({'left':+(i%5)*300+250+'px',
			'top':+(Math.floor(i/5))*450+200+'px',
			'position':'absolute'});
	}
	
	var a = Math.floor((Number($("#item_ready_count").val())-1)/5);
	if(a<0){a=0;}
	$("#open_ready_area").css({'height':a*400+600+'px'});
	if($("#item_ready_count").val() == 0){
		$("#open_ready_area").css({'height':'500px'});
	}
	
})

	

