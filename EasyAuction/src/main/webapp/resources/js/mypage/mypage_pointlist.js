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
        winRef = window.open('./mypage_return.nhn', '포인트반환', 'width=450,height=400, top=300px, left=600px');
    }else{
        if (winRef.closed == false) {
            winRef.focus();
        }else{
            winRef = window.open('./mypage_return.nhn', '포인트반환', 'width=450,height=400, top=300px, left=600px');
        }
    }
}