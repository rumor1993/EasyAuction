    function wrapWindowByMask(){
        // 화면의 높이와 너비를 변수로 만듭니다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
        // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
        $('.mask').css({'width':maskWidth,'height':maskHeight});
 
        // fade 애니메이션 : 1초 동안 검게 됐다가 30%의 불투명으로 변합니다.
        $('.mask').fadeTo("slow",0.3);
 
        // 레이어 팝업을 띄웁니다.
        $('.window').show();
    }
    
    $(document).ready(function(){
        // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
    	$("#house_list_bt").click(function(e){
        	e.preventDefault();
            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
            wrapWindowByMask();
        });
 
        // 닫기(close)를 눌렀을 때 작동합니다.
        $('.window .close').click(function (e) {
            $('.mask, .window').hide();
        });

    });