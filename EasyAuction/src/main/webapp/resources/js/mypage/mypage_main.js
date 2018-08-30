function popupAction(){
   var winRef;
    if(winRef == null){
        winRef = window.open('./mypage_point.nhn', '포인트충전', 'width=450,height=400, top=300px, left=600px');
    }else{
        if (winRef.closed == false) {
            winRef.focus();
        }else{
            winRef = window.open('./mypage_point.nhn', '포인트충전', 'width=450,height=400, top=300px, left=600px');
        }
    }
}

function popupAction2(){
   var winRef;
    if(winRef == null){
        winRef = window.open('./mypage_return.nhn', '포인트반환','width=450,height=400, top=300px, left=600px');
    }else{
        if (winRef.closed == false) {
            winRef.focus();
        }else{
            winRef = window.open('./mypage_return.nhn', '포인트반환', 'width=450,height=400, top=300px, left=600px');
        }
    }
}


function r_ok(value, value2){
   
   var test = "."+value;
   var state = confirm("확정하시겠습니까?");
   
   if(state){
   $.ajax({
      type:"post",
      url:"result_ok.nhn",
      data: {"itemnum": value,
    	  "seller": value2},
      success: function(data){      
         alert("구매 확정되었습니다.");
      },
      complete:function(){
         window.location.reload();
      },
      error:function(request,status,error){
           console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
   
   })
   }
}
function popupAction_cancel(itemnum1){
   var itemnum = itemnum1;
   alert(itemnum);
   var page = 1;
   var winRef;
    if(winRef == null){
        winRef = window.open('./order_cancel_choice.nhn?itemnum='+itemnum+'&page='+page, '구매취소', 'width=520,height=500');
    }else{
        if (winRef.closed == false) {
            winRef.focus();
        }else{
            winRef = window.open('./order_cancel_choice.nhn?itemnum='+itemnum+'&page='+page, '구매취소', 'width=520,height=500');
        }
    }
    
    
    
}